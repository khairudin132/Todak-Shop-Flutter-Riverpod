import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todak_shop/core/core.dart';

final addressRepoProvider = Provider((ref) => AddressRepo(ref));

class AddressRepo implements AddressInterface {
  AddressRepo(this._ref);

  final ProviderRef _ref;

  var _listOfAddresses = <Address>[];

  @override
  Address? get getSaveAddress {
    final address = _ref.read(addressLocalStorageProvider).getSaveAddress;

    return address != null ? Address.fromJson(address) : null;
  }

  @override
  Future<void> saveAddress(Address address) async => await _ref
      .read(addressLocalStorageProvider)
      .setSaveAddress(address.toJson());

  @override
  List<Address> get getListOfAddresses => _listOfAddresses = _ref
          .read(addressLocalStorageProvider)
          .getListOfAddresses
          ?.map((e) => Address.fromJson(e))
          .toList() ??
      [];

  @override
  Future<void> addAddress(Address address) async {
    // Find the highest current ID in the list of addresses, or use -1 if the list is empty
    final int currentMaxId = _listOfAddresses.isNullOrEmpty
        ? -1
        : _listOfAddresses.map((e) => e.id ?? 0).reduce(max);

    // Assign the next ID as one more than the highest ID
    final int nextId = currentMaxId + 1;

    // Create a new Address object with the new ID.
    final Address newAddress = address.copyWith(id: nextId);

    // Add the new Address object to the list.
    _listOfAddresses.add(newAddress);

    // Update the address in local storage or database.
    await _updateAddressLocal(_listOfAddresses);
  }

  @override
  Future<void> updateAddress(Address address) async {
    final indexAdress =
        _listOfAddresses.indexWhere((element) => element.id == address.id);

    _listOfAddresses.removeWhere((element) => element.id == address.id);

    _listOfAddresses.insert(indexAdress, address);

    await _updateAddressLocal(_listOfAddresses);
  }

  @override
  Future<void> deleteAddress(int id) async {
    _listOfAddresses.removeWhere((element) => element.id == id);

    await _updateAddressLocal(_listOfAddresses);
  }

  Future<void> _updateAddressLocal(List<Address> listOfAddresses) async {
    final listOfAddressesString =
        listOfAddresses.map((e) => (e.toJson())).toList();

    await _ref.read(addressLocalStorageProvider).clearAddress();
    await _ref
        .read(addressLocalStorageProvider)
        .setListOfAddresses(listOfAddressesString);
  }
}
