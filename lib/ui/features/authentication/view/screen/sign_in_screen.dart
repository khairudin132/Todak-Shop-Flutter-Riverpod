import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/core.dart';
import '../../../../ui.dart';
import '../../provider/provider.dart';

class SignInScreen extends ConsumerWidget {
  SignInScreen({super.key});

  static String path = '/SignInScreen';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FormPageBase(
      formKey: _formKey,
      title: 'Sign In',
      button: ConfirmButton(
        label: 'Sign In',
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            // ref.read(appLoaderProvider.notifier).setLoaderValue(true);

            final result =
                await ref.read(currentAuthUserProvider.notifier).signIn();

            result.when(
              data: (data) async {
                if (context.mounted) {
                  context.navigator.pushNamedAndRemoveUntil(
                    MainBottomNavScreen.path,
                    (_) => false,
                  );
                }
              },
              error: (error) async {
                if (context.mounted) {
                  await showAppAlertDialog(
                    context,
                    title: 'Sign In',
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
          final password = ref.watch(passwordTextFieldProvider);

          return LearningPasswordFormField(
            controller: password.controller,
            label: password.fieldLabel,
            validator: password.validate,
          );
        }),
      ],
    );
  }
}
