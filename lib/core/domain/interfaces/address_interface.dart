import 'package:todak_shop/core/domain/domain.dart';

abstract class AddressInterface {
  Future<Address?> getAddressById(String id);

  Future<List<Address>> getListOfAddresses();

  Future<void> addAddress(Address address);

  Future<void> updateAddress(Address address);

  Future<void> deleteAddress(String id);

  Future<void> setDefaultAddress(String id);

  Future<Address?> getDefaultAddress();
}
