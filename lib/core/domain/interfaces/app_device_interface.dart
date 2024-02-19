import 'package:flutter/material.dart';

abstract class AppDeviceInterface {
  bool get getIsFirstTimeInstallApp;

  ThemeMode? get getThemeMode;

  Future<void> setIsFirstTimeInstallApp(bool isFirstTime);

  Future<void> setThemeMode(ThemeMode themeMode);
}
