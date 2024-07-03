import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todak_shop/core/core.dart';

part 'provider.g.dart';

@riverpod
class DefaultAddress extends _$DefaultAddress {
  @override
  Address? build() {
    return null;
  }

  Future<ApiResult<void>> getDefaultAddress() async {
    try {
      state = await ref.read(addressRepoProvider).getDefaultAddress();
      return ApiSuccess(value: null);
    } on ApiError catch (e) {
      return e;
    }
  }

  Future<ApiResult<void>> setDefaultAddress(String id) async {
    try {
      ref.read(appLoaderProvider.notifier).setLoaderValue(true);

      await ref.read(addressRepoProvider).setDefaultAddress(id);

      return ApiSuccess(value: null);
    } on ApiError catch (e) {
      return e;
    } finally {
      ref.read(appLoaderProvider.notifier).setLoaderValue(false);
    }
  }

  void updateSelectAddress(Address address) {
    state = address;
  }
}

@riverpod
class AddressList extends _$AddressList {
  @override
  Future<List<Address>> build() async {
    return await ref.read(addressRepoProvider).getListOfAddresses();
  }

  Future<ApiResult<void>> addAddress() async {
    try {
      ref.read(appLoaderProvider.notifier).setLoaderValue(true);

      final address1 = ref.read(address1TextFieldProvider).value;
      final address2 = ref.read(address2TextFieldProvider).value;
      final city = ref.read(cityTextFieldProvider).value;
      final postcode = ref.read(postcodeTextFieldProvider).value;
      final stateText = ref.read(stateTextFieldProvider).value;

      await ref.read(addressRepoProvider).addAddress(
            Address(
              address1: address1,
              address2: address2,
              city: city,
              postcode: postcode.isNullOrEmpty ? null : int.tryParse(postcode!),
              state: stateText,
            ),
          );

      state = AsyncValue.data(
        await ref.read(addressRepoProvider).getListOfAddresses(),
      );

      return ApiSuccess();
    } on ApiError catch (e) {
      return e;
    } finally {
      ref.read(appLoaderProvider.notifier).setLoaderValue(false);
    }
  }
}

@riverpod
class Address1TextField extends _$Address1TextField {
  @override
  TextFieldModel build() {
    return TextFieldModel(
      fieldLabel: 'Address 1',
      controller: TextEditingController(),
    );
  }
}

@riverpod
class Address2TextField extends _$Address2TextField {
  @override
  TextFieldModel build() {
    return TextFieldModel(
      fieldLabel: 'Address 2',
      controller: TextEditingController(),
    );
  }
}

@riverpod
class CityTextField extends _$CityTextField {
  @override
  TextFieldModel build() {
    return TextFieldModel(
      fieldLabel: 'City',
      controller: TextEditingController(),
    );
  }
}

@riverpod
class PostcodeTextField extends _$PostcodeTextField {
  @override
  TextFieldModel build() {
    return TextFieldModel(
      fieldLabel: 'Postcode',
      controller: TextEditingController(),
    );
  }
}

@riverpod
class StateTextField extends _$StateTextField {
  @override
  TextFieldModel build() {
    return TextFieldModel(
      fieldLabel: 'State',
      controller: TextEditingController(),
    );
  }
}
