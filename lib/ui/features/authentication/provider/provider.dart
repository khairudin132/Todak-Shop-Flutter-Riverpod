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
class PasswordTextField extends _$PasswordTextField {
  @override
  TextFieldModel build() {
    return TextFieldModel(
      fieldLabel: 'Password',
      controller: TextEditingController(),
    );
  }
}

@riverpod
class CurrentAuthUser extends _$CurrentAuthUser {
  @override
  User? build() {
    return ref.read(authenticationRepoProvider).user;
  }

  Future<ApiResult<void>> signIn() async {
    try {
      ref.read(appLoaderProvider.notifier).setLoaderValue(true);

      final username = ref.read(usernameTextFieldProvider);
      final password = ref.read(passwordTextFieldProvider);

      await ref.read(authenticationRepoProvider).signIn(
            SignInRequest(
              username: username.value,
              password: password.value,
            ),
          );

      state = ref.read(authenticationRepoProvider).user;

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

  Future<ApiResult<void>> resetAuthUser() async {
    try {
      await ref.read(authenticationRepoProvider).reset();

      state = ref.read(authenticationRepoProvider).user;

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
