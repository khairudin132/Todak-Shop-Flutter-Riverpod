import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todak_shop/core/core.dart';

final cartLocalStorageProvider =
    Provider((ref) => CartLocalStorage(ref.read(localStorageServiceProvider)));

class CartLocalStorage {
  CartLocalStorage(this._storage);

  final LocalStorageService _storage;

  List<String>? get getListOfCarts =>
      _storage.localStorage.getStringList(key: Constant.cartKey);

  Future<void> setListOfCarts(List<String> list) async =>
      await _storage.localStorage.setStringList(
        key: Constant.cartKey,
        value: list,
      );

  Future<void> clearCart() async =>
      _storage.localStorage.remove(key: Constant.cartKey);
}
