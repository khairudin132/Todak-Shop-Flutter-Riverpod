import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todak_shop/core/core.dart';

part 'provider.g.dart';

@riverpod
class CurrentSelectAddress extends _$CurrentSelectAddress {
  @override
  Address? build() {
    return ref.read(saveAddressProvider);
  }

  void updateSelectAddress(Address address) {
    state = address;
  }
}

@riverpod
class SaveAddress extends _$SaveAddress {
  @override
  Address? build() {
    return ref.read(addressRepoProvider).getSaveAddress;
  }

  Future<void> saveAddress() async {
    final address = ref.read(currentSelectAddressProvider);

    await ref.read(addressRepoProvider).saveAddress(address!);

    state = ref.read(addressRepoProvider).getSaveAddress;
  }
}

@riverpod
class AddressList extends _$AddressList {
  @override
  List<Address> build() {
    return ref.read(addressRepoProvider).getListOfAddresses;
  }

  Future<void> addAddress() async {
    final address1 = ref.read(address1TextFieldProvider).value;
    final address2 = ref.read(address2TextFieldProvider).value;
    final city = ref.read(cityTextFieldProvider).value;
    final postcode = ref.read(postcodeTextFieldProvider).value;
    final stateText = ref.read(stateTextFieldProvider).value;

    await ref.read(addressRepoProvider).addAddress(Address(
          address1: address1,
          address2: address2,
          city: city,
          postcode: postcode.isNullOrEmpty ? null : int.tryParse(postcode!),
          state: stateText,
        ));

    state = ref.read(addressRepoProvider).getListOfAddresses;
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
