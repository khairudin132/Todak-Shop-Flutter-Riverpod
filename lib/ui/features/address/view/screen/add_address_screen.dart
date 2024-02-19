import 'package:flutter/cupertino.dart';
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
    return FormPageBase(
      formKey: _formKey,
      title: 'Add Address',
      button: ConfirmButton(
        label: 'Save',
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            // ref.read(appLoaderProvider.notifier).setLoaderValue(true);

            final result =
                await ref.read(addressListProvider.notifier).addAddress();

            if (context.mounted) {
              context.navigator.pop();
            }

            // result.when(
            //   data: (data) async {
            //     if (context.mounted) {
            //       context.navigator.pushNamedAndRemoveUntil(
            //         MainBottomNavScreen.path,
            //         (_) => false,
            //       );
            //     }
            //   },
            //   error: (error) async {
            //     if (context.mounted) {
            //       await showAppAlertDialog(
            //         context,
            //         title: 'Sign In',
            //         message: error.codeMessage,
            //         errors: error.errors,
            //       );
            //     }
            //   },
            // );
          }
        },
      ),
      children: [
        Consumer(builder: (context, ref, widget) {
          final address1 = ref.watch(address1TextFieldProvider);

          return LearningTextFormField(
            controller: address1.controller,
            label: address1.fieldLabel,
            prefixIcon: const Icon(Icons.mail),
            validator: address1.validate,
          );
        }),
        Consumer(builder: (context, ref, widget) {
          final address2 = ref.watch(address2TextFieldProvider);

          return LearningTextFormField(
            controller: address2.controller,
            label: address2.fieldLabel,
            prefixIcon: const Icon(Icons.mail),
            validator: address2.validate,
          );
        }),
        Consumer(builder: (context, ref, widget) {
          final city = ref.watch(cityTextFieldProvider);

          return LearningTextFormField(
            controller: city.controller,
            label: city.fieldLabel,
            prefixIcon: const Icon(Icons.mail),
            validator: city.validate,
          );
        }),
        Consumer(builder: (context, ref, widget) {
          final postcode = ref.watch(postcodeTextFieldProvider);

          return LearningTextFormField(
            keyboardType: TextInputType.number,
            controller: postcode.controller,
            label: postcode.fieldLabel,
            prefixIcon: const Icon(Icons.mail),
            validator: postcode.validate,
          );
        }),
        Consumer(builder: (context, ref, widget) {
          final state = ref.watch(stateTextFieldProvider);

          return LearningTextFormField(
            controller: state.controller,
            label: state.fieldLabel,
            prefixIcon: const Icon(Icons.mail),
            validator: state.validate,
          );
        }),
      ],
    );
  }
}
