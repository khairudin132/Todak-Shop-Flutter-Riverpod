// import 'package:flutter/material.dart';

// abstract class LocalStorageInterface {
//   // INSTALL APP
//   // This is the first time the app is installed to show onboarding or not
//   bool get getIsFirstTimeInstallApp;

//   Future<void> setFirstTimeInstallApp(bool isFirstTime);

//   // LOGGED IN
//   // This is for user logged in or not to skip login screen
//   bool get getIsLoggedIn;

//   Future<void> setIsLoggedIn(bool isLoggedIn);

//   // TOKEN
//   String get getAccountToken;

//   Future<void> setAccountToken(String token);

//   // THEME
//   String get getThemeMode;

//   Future<void> setThemeMode(ThemeMode mode);

//   // CART
//   String get getCart;

//   Future<void> setCart(String cart);

//   // ADDRESS
//   List<String> get getAddress;

//   Future<void> setAddress(List<String> address);
// }

abstract class LocalStorageInterface {
  String? getString({required String key});

  Future<void> setString({
    required String key,
    required String value,
  });

  bool? getBool({required String key});

  Future<void> setBool({
    required String key,
    required bool value,
  });

  List<String>? getStringList({required String key});

  Future<void> setStringList({
    required String key,
    required List<String> value,
  });

  Future<void> remove({required String key});
}
