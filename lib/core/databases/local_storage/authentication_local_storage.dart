import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todak_shop/core/core.dart';

final authenticationLocalStorageProvider = Provider(
    (ref) => AuthenticationLocalStorage(ref.read(localStorageServiceProvider)));

class AuthenticationLocalStorage {
  AuthenticationLocalStorage(this._storage);

  final LocalStorageService _storage;

  String? get getAccountToken =>
      _storage.localStorage.getString(key: Constant.accountTokenKey);

  Future<void> setAccountToken(String token) async =>
      _storage.localStorage.setString(
        key: Constant.accountTokenKey,
        value: token,
      );

  bool? get getIsLoggedIn =>
      _storage.localStorage.getBool(key: Constant.isLoggedInKey);

  Future<void> setIsLoggedIn(bool isLoggedIn) async =>
      await _storage.localStorage.setBool(
        key: Constant.isLoggedInKey,
        value: isLoggedIn,
      );

  Future<void> reset(List<String> keys) async {
    for (final key in keys) {
      await _storage.localStorage.remove(key: key);
    }
  }
}
