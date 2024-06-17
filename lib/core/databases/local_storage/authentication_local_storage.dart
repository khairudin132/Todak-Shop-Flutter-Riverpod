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
      await _storage.localStorage.setString(
        key: Constant.accountTokenKey,
        value: token,
      );

  DateTime? get getAccountTokenExpirationDate => _storage.localStorage
          .getString(key: Constant.accountTokenExpirationDateKey)
          .isNullOrEmpty
      ? null
      : DateTime.tryParse(_storage.localStorage
          .getString(key: Constant.accountTokenExpirationDateKey)!);

  Future<void> setAccountTokenExpirationDate(String stringDateTime) async =>
      await _storage.localStorage.setString(
        key: Constant.accountTokenExpirationDateKey,
        value: stringDateTime,
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
