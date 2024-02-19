import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todak_shop/core/core.dart';

final appDeviceRepoProvider = Provider((ref) => AppDeviceRepo(ref));

class AppDeviceRepo implements AppDeviceInterface {
  AppDeviceRepo(this._ref);

  final ProviderRef _ref;

  @override
  bool get getIsFirstTimeInstallApp =>
      _ref.read(appDeviceLocalStorageProvider).getIsFirstTimeInstallApp ?? true;

  @override
  Future<void> setIsFirstTimeInstallApp(bool isFirstTime) async => await _ref
      .read(appDeviceLocalStorageProvider)
      .setIsFirstTimeInstallApp(isFirstTime);

  @override
  ThemeMode get getThemeMode =>
      ThemeMode.values.firstWhereOrNull((element) =>
          element.name ==
          _ref.read(appDeviceLocalStorageProvider).getThemeMode) ??
      ThemeMode.system;

  @override
  Future<void> setThemeMode(ThemeMode themeMode) async =>
      await _ref.read(appDeviceLocalStorageProvider).setThemeMode(themeMode);
}
