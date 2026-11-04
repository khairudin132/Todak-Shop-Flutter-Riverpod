#!/bin/bash
# SessionStart hook: install the Flutter SDK and pub dependencies in
# Claude Code cloud sessions so `flutter analyze` and `flutter test` work.
set -euo pipefail

if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

cd "${CLAUDE_PROJECT_DIR:-.}"

FLUTTER_VERSION="3.47.9"
FLUTTER_HOME="/opt/flutter"
export PATH="$FLUTTER_HOME/bin:$PATH"
export CI=true # suppresses interactive/analytics prompts

# --- Flutter SDK (global tool, pinned version) ---------------------------
installed_version=""
if [ -x "$FLUTTER_HOME/bin/flutter" ]; then
  installed_version="$(sed -n 's/.*"frameworkVersion": *"\([^"]*\)".*/\1/p' \
    "$FLUTTER_HOME/bin/cache/flutter.version.json" 2>/dev/null || true)"
fi
if [ "$installed_version" != "$FLUTTER_VERSION" ]; then
  echo "Installing Flutter $FLUTTER_VERSION ..." >&2
  rm -rf "$FLUTTER_HOME"
  tmp="$(mktemp -d)"
  curl -fsSL -o "$tmp/flutter.tar.xz" \
    "https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${FLUTTER_VERSION}-stable.tar.xz"
  tar -xf "$tmp/flutter.tar.xz" -C "$(dirname "$FLUTTER_HOME")"
  rm -rf "$tmp"
fi
git config --global --get-all safe.directory | grep -qx "$FLUTTER_HOME" \
  || git config --global --add safe.directory "$FLUTTER_HOME"
flutter config --no-analytics >/dev/null 2>&1
dart --disable-analytics >/dev/null 2>&1

# --- pub dependencies (only when pubspec or this script changed) ---------
hashes=.dart_tool/.session-start.sha256
if ! sha256sum --check --status "$hashes" 2>/dev/null; then
  rm -f "$hashes"
  flutter pub get
  sha256sum .claude/hooks/session-start.sh pubspec.yaml pubspec.lock > "$hashes" || rm -f "$hashes"
fi

# --- every session ------------------------------------------------------
if [ -n "${CLAUDE_ENV_FILE:-}" ]; then
  echo "export PATH=\"$FLUTTER_HOME/bin:\$PATH\"" >> "$CLAUDE_ENV_FILE"
  echo "export CI=true" >> "$CLAUDE_ENV_FILE"
fi
