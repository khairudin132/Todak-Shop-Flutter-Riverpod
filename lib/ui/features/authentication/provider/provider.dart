import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todak_shop/core/core.dart';

part 'provider.g.dart';

@riverpod
class UsernameTextField extends _$UsernameTextField {
  @override
  TextFieldModel build() {
    return TextFieldModel(
      fieldLabel: 'Username',
      controller: TextEditingController(),
    );
  }
}

@riverpod
class EmailTextField extends _$EmailTextField {
  @override
  TextFieldModel build() {
    return TextFieldModel(
      fieldLabel: 'Email',
      controller: TextEditingController(),
    );
  }
}

@riverpod
class FirstNameTextField extends _$FirstNameTextField {
  @override
  TextFieldModel build() {
    return TextFieldModel(
      fieldLabel: 'First Name',
      controller: TextEditingController(),
    );
  }
}

@riverpod
class LastNameTextField extends _$LastNameTextField {
  @override
  TextFieldModel build() {
    return TextFieldModel(
      fieldLabel: 'Last Name',
      controller: TextEditingController(),
    );
  }
}

@riverpod
class PasswordTextField extends _$PasswordTextField {
  @override
  TextFieldModel build() {
    return TextFieldModel(
      fieldLabel: 'Password',
      controller: TextEditingController(),
    );
  }
}

@Riverpod(keepAlive: true)
class CurrentAuthUser extends _$CurrentAuthUser {
  @override
  UserProfile? build() {
    return ref.read(authenticationRepoProvider).user;
  }

  void clearTextFormField() {
    ref.read(usernameTextFieldProvider).controller.clear();
    ref.read(emailTextFieldProvider).controller.clear();
    ref.read(firstNameTextFieldProvider).controller.clear();
    ref.read(lastNameTextFieldProvider).controller.clear();
    ref.read(passwordTextFieldProvider).controller.clear();
  }

  Future<ApiResult<void>> signUp() async {
    try {
      ref.read(appLoaderProvider.notifier).setLoaderValue(true);

      final username = ref.read(usernameTextFieldProvider);
      final email = ref.read(emailTextFieldProvider);
      final firstName = ref.read(firstNameTextFieldProvider);
      final lastName = ref.read(lastNameTextFieldProvider);
      final password = ref.read(passwordTextFieldProvider);

      await ref.read(authenticationRepoProvider).signUp(
            SignUpRequest(
              username: username.value!,
              email: email.value!,
              firstName: firstName.value!,
              lastName: lastName.value!,
              password: password.value!,
            ),
          );

      return ApiSuccess(value: null);
    } on ApiError catch (e) {
      return e;
    } finally {
      ref.read(appLoaderProvider.notifier).setLoaderValue(false);
    }
  }

  Future<ApiResult<void>> signIn() async {
    try {
      ref.read(appLoaderProvider.notifier).setLoaderValue(true);

      final email = ref.read(emailTextFieldProvider);
      final password = ref.read(passwordTextFieldProvider);

      await ref.read(authenticationRepoProvider).signIn(
            SignInRequest(
              email: email.value!,
              password: password.value!,
            ),
          );

      return ApiSuccess(value: null);
    } on ApiError catch (e) {
      return e;
    } finally {
      ref.read(appLoaderProvider.notifier).setLoaderValue(false);
    }
  }

  Future<ApiResult<void>> getCurrentAuthUser() async {
    try {
      await ref.read(authenticationRepoProvider).getCurrentAuthUser();

      state = ref.read(authenticationRepoProvider).user;

      return ApiSuccess(value: null);
    } on ApiError catch (e) {
      return e;
    }
  }

  Future<ApiResult<void>> signOut() async {
    try {
      ref.read(appLoaderProvider.notifier).setLoaderValue(true);

      await ref.read(authenticationRepoProvider).signOut();

      return ApiSuccess(value: null);
    } on ApiError catch (e) {
      return e;
    } finally {
      ref.read(appLoaderProvider.notifier).setLoaderValue(false);
    }
  }

  Future<ApiResult<void>> reset() async {
    try {
      await ref.read(authenticationRepoProvider).reset();
      final user = ref.read(authenticationRepoProvider).user;

      if (user != null) {
        return ApiError(message: 'Please try again');
      }

      return ApiSuccess(value: null);
    } on ApiError catch (e) {
      return e;
    }
  }
}

final tokenExpirationStreamProvider = StreamProvider.autoDispose<bool>((ref) {
  // Retrieve the expiration date from the authentication repository
  final DateTime expiredDate =
      ref.read(authenticationRepoProvider).getTokenExpirationDate!;

  // Create a stream that emits every second
  return Stream.periodic(const Duration(seconds: 1), (_) {
    // Check if the current time is after or at the same moment as the expiration date
    return DateTime.now().isAfter(expiredDate) ||
        DateTime.now().isAtSameMomentAs(expiredDate);
  })
      .where((isExpired) => isExpired) // Emit only when the token is expired
      .take(1); // Take only the first expired event
});
