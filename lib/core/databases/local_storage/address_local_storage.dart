import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todak_shop/core/core.dart';

final addressLocalStorageProvider = Provider(
    (ref) => AddressLocalStorage(ref.read(localStorageServiceProvider)));

class AddressLocalStorage {
  AddressLocalStorage(this._storage);

  final LocalStorageService _storage;

  String? get getSaveAddress =>
      _storage.localStorage.getString(key: Constant.selectedSaveAddressKey);

  Future<void> setSaveAddress(String address) async =>
      _storage.localStorage.setString(
        key: Constant.selectedSaveAddressKey,
        value: address,
      );

  List<String>? get getListOfAddresses =>
      _storage.localStorage.getStringList(key: Constant.addressListKey);

  Future<void> setListOfAddresses(List<String> list) async =>
      await _storage.localStorage.setStringList(
        key: Constant.addressListKey,
        value: list,
      );

  Future<void> clearAddress() async =>
      _storage.localStorage.remove(key: Constant.addressListKey);
}
