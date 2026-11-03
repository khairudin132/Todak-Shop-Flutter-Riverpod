# CLAUDE.md

Guidance for Claude Code (and humans) working in this repository.

## Project

**Todak Shop** — a Flutter e-commerce demo app (`package:todak_shop`) backed by the
public [DummyJSON](https://dummyjson.com/) API (`Constant.baseUrl`). State management is
Riverpod 3 with code generation; local persistence is `shared_preferences`.

## Toolchain

| Tool | Version |
| --- | --- |
| Flutter | `>=3.47.0` (stable) |
| Dart SDK | `^3.13.0` |
| Android | AGP 9.1, Kotlin 2.4, Gradle 9.3, Java 17, Kotlin DSL (`*.gradle.kts`) |
| iOS | Deployment target 15.0, Swift Package Manager + UIScene lifecycle (no `Podfile` committed) |

## Commands

```bash
flutter pub get                     # install dependencies
dart run build_runner build         # regenerate *.g.dart + lib/core/gen/assets.gen.dart
dart run build_runner watch         # same, continuously
flutter analyze                     # must report "No issues found!" (includes riverpod_lint)
dart format lib test                # format
flutter test                        # widget tests in test/
flutter run                         # run on a device/emulator
```

Run `build_runner` after changing any `@riverpod` / `@Riverpod(...)` declaration or
anything under `assets/`. Generated files **are committed** — commit them together with
their source change.

## Architecture

```
lib/
├── main.dart                 # ProviderScope + SharedPreferences override, MyApp
├── core/                     # everything non-UI; barrel: core/core.dart
│   ├── constants/            # Constant (storage keys, baseUrl, radius…)
│   ├── databases/
│   │   ├── services/         # DioService, SharedPreferencesService, *StorageService wrappers
│   │   ├── local_storage/    # per-domain SharedPreferences accessors
│   │   └── network_service/  # one @riverpod function per API call → ApiResult<T>
│   ├── domain/
│   │   ├── api/              # request/response + common models (toJson/fromJson by hand)
│   │   ├── interfaces/       # abstract contracts implemented by repositories/services
│   │   └── models/           # ApiResult (sealed: ApiSuccess / ApiError), UI models
│   ├── repositories/         # *Repo classes (repository pattern), exposed via Provider
│   ├── router.dart           # AppRouter.generateRoute — Navigator 1.0 named routes
│   ├── theme/                # Material 3 ColorScheme + ThemeData
│   ├── gen/                  # flutter_gen output (do not edit)
│   └── utils/                # AppLoader, ThemeModeSetting (@riverpod notifiers)
└── ui/                       # barrel: ui/ui.dart
    ├── features/<feature>/   # provider/ (state), controller/ (simple state), view/{screen,widget}/
    └── widgets/              # shared, design-system widgets
```

Data flow: **Screen → feature provider → Repo → (LocalStorage | network_service provider) → Dio/SharedPreferences**.

- Each folder has a barrel file (`view.dart`, `screen.dart`, `widgets.dart`, …). Add new
  files to the relevant barrel and import via `package:todak_shop/core/core.dart` or
  `package:todak_shop/ui/ui.dart`.
- Each screen exposes `static const path` and is registered in `_listOfPages` in
  `lib/core/router.dart`. Navigate with `context.navigator.pushNamed(Screen.path, arguments: {...})`.
- Network calls never throw to the UI: they return `ApiResult<T>`; consume it with
  `result.when(data: ..., error: ...)`.
- `sharedPreferencesProvider` throws unless overridden — always override it in
  `ProviderScope` (see `main.dart` and `test/widget_test.dart`).

## Riverpod 3 conventions

- Prefer code generation: `@riverpod` (auto-dispose) or `@Riverpod(keepAlive: true)`, with
  `part '<file>.g.dart';`.
- Functional providers take a plain `Ref ref` — the generated `XxxRef` types no longer
  exist in Riverpod 3. Repositories keep a `Ref` field (not `ProviderRef`).
- Files that declare manual `Provider` / `FutureProvider` / `StreamProvider` must import
  `package:flutter_riverpod/flutter_riverpod.dart` (`riverpod_annotation` no longer
  re-exports them).
- `StateProvider` / `StateNotifierProvider` are legacy in Riverpod 3 and come from
  `package:flutter_riverpod/legacy.dart` (used in `main_bottom_nav` and `onboarding`
  controllers). New state should be a generated `Notifier` instead.
- Riverpod 3 retries failing providers automatically and pauses listeners of off-screen
  widgets; keep that in mind when debugging repeated network calls.
- `riverpod_lint` runs as an analyzer plugin (`plugins:` in `analysis_options.yaml`), so
  `flutter analyze` surfaces its warnings.

## Flutter / Material conventions

- Material 3 only. Use `WidgetStateProperty` (not `MaterialStateProperty`),
  `CardThemeData`, `Color.withValues(alpha: …)` (not `withOpacity`), and `RadioGroup`
  for radio selection (`Radio.groupValue` / `onChanged` are deprecated).
- In a `State`, guard post-`await` context use with `if (mounted)`; elsewhere with
  `context.mounted`.
- `_` is a wildcard in Dart 3.7+ and cannot be read — name callback params you use.

## Dependency notes

- `build_runner` is held at `^2.16.2` because `flutter_gen_runner` 5.15 still depends on
  `build ^4`. Bump both together once `flutter_gen_runner` supports `build 5`.
- `get_it`, `go_router`, `hive`, `mockito` and `riverpod` are declared but not imported
  anywhere in `lib/`/`test/` yet. Do not assume they are wired up.
- Check upgrades with `flutter pub outdated`; after upgrading, re-run `build_runner`,
  `flutter analyze` and `flutter test`.

## Before you commit

1. `dart run build_runner build` (if providers/assets changed)
2. `flutter analyze` → no issues
3. `flutter test` → all green
