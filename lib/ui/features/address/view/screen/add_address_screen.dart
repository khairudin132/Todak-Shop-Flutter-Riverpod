import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todak_shop/core/core.dart';

import '../../../../ui.dart';
import '../../provider/provider.dart';

class AddAddressScreen extends ConsumerWidget {
  AddAddressScreen({super.key});

  static String path = '/AddAddressScreen';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final address1 = ref.watch(address1TextFieldProvider);
    final address2 = ref.watch(address2TextFieldProvider);
    final city = ref.watch(cityTextFieldProvider);
    final postcode = ref.watch(postcodeTextFieldProvider);
    final state = ref.watch(stateTextFieldProvider);

    return FormPageBase(
      formKey: _formKey,
      title: 'Add Address',
      button: ConfirmButton(
        label: 'Save',
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            await ref.read(addressListProvider.notifier).addAddress();

            if (context.mounted) {
              await showAppAlertDialog(
                context,
                title: 'Address',
                message: 'Success Add Address',
              );
            }

            if (context.mounted) {
              context.navigator.pop();
            }
          }
        },
      ),
      children: [
        LearningTextFormField(
          controller: address1.controller,
          label: address1.fieldLabel,
          prefixIcon: const Icon(Icons.mail),
          validator: address1.validate,
        ),
        LearningTextFormField(
          controller: address2.controller,
          label: address2.fieldLabel,
          prefixIcon: const Icon(Icons.mail),
          validator: address2.validate,
        ),
        LearningTextFormField(
          controller: city.controller,
          label: city.fieldLabel,
          prefixIcon: const Icon(Icons.mail),
          validator: city.validate,
        ),
        LearningTextFormField(
          keyboardType: TextInputType.number,
          controller: postcode.controller,
          label: postcode.fieldLabel,
          prefixIcon: const Icon(Icons.mail),
          validator: postcode.validate,
        ),
        LearningTextFormField(
          controller: state.controller,
          label: state.fieldLabel,
          prefixIcon: const Icon(Icons.mail),
          validator: state.validate,
        ),
      ],
    );
  }
}
