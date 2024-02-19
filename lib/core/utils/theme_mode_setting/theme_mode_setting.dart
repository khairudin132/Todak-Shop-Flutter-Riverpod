import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todak_shop/core/core.dart';

part 'theme_mode_setting.g.dart';

@Riverpod(keepAlive: true)
class ThemeModeSetting extends _$ThemeModeSetting {
  @override
  ThemeMode build() {
    final theme = ref.read(appDeviceRepoProvider).getThemeMode;
    setThemeMode(theme);
    return ref.read(appDeviceRepoProvider).getThemeMode;
  }

  Future<void> setThemeMode(ThemeMode value) async {
    state = value;
    await ref.read(appDeviceRepoProvider).setThemeMode(value);
  }
}
