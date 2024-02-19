import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todak_shop/core/core.dart';

final appDeviceLocalStorageProvider = Provider(
    (ref) => AppDeviceLocalStorage(ref.read(localStorageServiceProvider)));

class AppDeviceLocalStorage {
  AppDeviceLocalStorage(this._storage);

  final LocalStorageService _storage;

  bool? get getIsFirstTimeInstallApp =>
      _storage.localStorage.getBool(key: Constant.isFirstTimeInstallAppKey);

  Future<void> setIsFirstTimeInstallApp(bool isFirstTime) async =>
      _storage.localStorage.setBool(
        key: Constant.isFirstTimeInstallAppKey,
        value: isFirstTime,
      );

  String? get getThemeMode =>
      _storage.localStorage.getString(key: Constant.themeModeKey);

  Future<void> setThemeMode(ThemeMode themeMode) async =>
      await _storage.localStorage.setString(
        key: Constant.themeModeKey,
        value: themeMode.name,
      );
}
