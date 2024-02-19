import 'package:todak_shop/core/domain/domain.dart';

abstract class AddressInterface {
  Address? get getSaveAddress;

  Future<void> saveAddress(Address address);

  List<Address> get getListOfAddresses;

  Future<void> addAddress(Address address);

  Future<void> updateAddress(Address address);

  Future<void> deleteAddress(int id);
}
