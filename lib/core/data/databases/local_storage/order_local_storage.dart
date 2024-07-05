import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todak_shop/core/core.dart';

final orderLocalStorageProvider =
    Provider((ref) => OrderLocalStorage(ref.read(localStorageServiceProvider)));

class OrderLocalStorage {
  OrderLocalStorage(this._storage);

  final LocalStorageService _storage;

  List<String>? get getListOfOrders =>
      _storage.localStorage.getStringList(key: Constant.orderKey);

  Future<void> setListOfOrders(List<String> list) async =>
      await _storage.localStorage.setStringList(
        key: Constant.orderKey,
        value: list,
      );

  Future<void> clearOrder() async =>
      _storage.localStorage.remove(key: Constant.orderKey);
}
