import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todak_shop/core/core.dart';

final addressRepoProvider = Provider((ref) => AddressRepo(ref));

class AddressRepo implements AddressInterface {
  AddressRepo(this._ref);

  final ProviderRef _ref;

  AddressApiClient get _apiClient => _ref.read(addressApiClientProvider);

  @override
  Future<Address?> getAddressById(String id) async {
    final result = await _apiClient.getAddressById(id);

    return result.when(
      data: (data) => data,
      error: (error) => throw error,
    );
  }

  @override
  Future<List<Address>> getListOfAddresses() async {
    final result = await _apiClient.getListOfAddresses();

    return result.when(
      data: (data) => data ?? [],
      error: (error) => throw error,
    );
  }

  @override
  Future<void> addAddress(Address address) async {
    final result = await _apiClient.addAddress(address: address);

    result.when(
      data: (data) {},
      error: (error) => throw error,
    );
  }

  @override
  Future<void> updateAddress(Address address) async {
    final result = await _ref
        .read(addressApiClientProvider)
        .updateAddress(address: address);

    result.when(
      data: (data) {},
      error: (error) => throw error,
    );
  }

  @override
  Future<void> deleteAddress(String id) async {
    final result = await _apiClient.removeAddressById(id);

    result.when(
      data: (data) {},
      error: (error) => throw error,
    );
  }

  @override
  Future<void> setDefaultAddress(String id) async {
    final result = await _apiClient.setDefaultAddress(id);

    result.when(
      data: (data) {},
      error: (error) => throw error,
    );
  }

  @override
  Future<Address?> getDefaultAddress() async {
    final result = await _apiClient.getDefaultAddress();

    return result.when(
      data: (data) => data,
      error: (error) => throw error,
    );
  }
}
