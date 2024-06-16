import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/core.dart';
import '../../../../ui.dart';
import '../../provider/provider.dart';

class SignUpScreen extends ConsumerWidget {
  SignUpScreen({super.key});

  static String path = '/SignUpScreen';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopScope(
      onPopInvoked: (didPop) =>
          ref.read(currentAuthUserProvider.notifier).clearTextFormField(),
      child: FormPageBase(
        formKey: _formKey,
        title: 'Sign Up',
        button: ConfirmButton(
          label: 'Sign Up',
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              final result =
                  await ref.read(currentAuthUserProvider.notifier).signUp();

              result.when(
                data: (data) async {
                  if (context.mounted) {
                    await showAppAlertDialog(
                      context,
                      title: 'Sign Up',
                      message: 'Success',
                    );
                  }

                  if (context.mounted) {
                    context.navigator.pop();
                  }
                },
                error: (error) async {
                  if (context.mounted) {
                    await showAppAlertDialog(
                      context,
                      title: 'Sign Up',
                      message: error.codeMessage,
                      errors: error.errors,
                    );
                  }
                },
              );
            }
          },
        ),
        children: [
          Consumer(builder: (context, ref, widget) {
            final username = ref.watch(usernameTextFieldProvider);

            return LearningTextFormField(
              controller: username.controller,
              label: username.fieldLabel,
              prefixIcon: Icon(AppIconsAdaptive.profile),
              validator: username.validate,
            );
          }),
          Consumer(builder: (context, ref, widget) {
            final email = ref.watch(emailTextFieldProvider);

            return LearningTextFormField(
              controller: email.controller,
              label: email.fieldLabel,
              prefixIcon: Icon(AppIconsAdaptive.profile),
              validator: email.validate,
            );
          }),
          Consumer(builder: (context, ref, widget) {
            final firstName = ref.watch(firstNameTextFieldProvider);

            return LearningTextFormField(
              controller: firstName.controller,
              label: firstName.fieldLabel,
              prefixIcon: Icon(AppIconsAdaptive.profile),
              validator: firstName.validate,
            );
          }),
          Consumer(builder: (context, ref, widget) {
            final lastName = ref.watch(lastNameTextFieldProvider);

            return LearningTextFormField(
              controller: lastName.controller,
              label: lastName.fieldLabel,
              prefixIcon: Icon(AppIconsAdaptive.profile),
              validator: lastName.validate,
            );
          }),
          Consumer(builder: (context, ref, widget) {
            final password = ref.watch(passwordTextFieldProvider);

            return LearningPasswordFormField(
              controller: password.controller,
              label: password.fieldLabel,
              validator: password.validate,
            );
          }),
        ],
      ),
    );
  }
}
