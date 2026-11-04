// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UsernameTextField)
final usernameTextFieldProvider = UsernameTextFieldProvider._();

final class UsernameTextFieldProvider
    extends $NotifierProvider<UsernameTextField, TextFieldModel> {
  UsernameTextFieldProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'usernameTextFieldProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$usernameTextFieldHash();

  @$internal
  @override
  UsernameTextField create() => UsernameTextField();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TextFieldModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TextFieldModel>(value),
    );
  }
}

String _$usernameTextFieldHash() => r'3e3b23bbc0e77f03e45cd5b4ee805b27b47a9c8c';

abstract class _$UsernameTextField extends $Notifier<TextFieldModel> {
  TextFieldModel build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<TextFieldModel, TextFieldModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TextFieldModel, TextFieldModel>,
              TextFieldModel,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(PasswordTextField)
final passwordTextFieldProvider = PasswordTextFieldProvider._();

final class PasswordTextFieldProvider
    extends $NotifierProvider<PasswordTextField, TextFieldModel> {
  PasswordTextFieldProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'passwordTextFieldProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$passwordTextFieldHash();

  @$internal
  @override
  PasswordTextField create() => PasswordTextField();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TextFieldModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TextFieldModel>(value),
    );
  }
}

String _$passwordTextFieldHash() => r'390da3d046a1bc2d96cd67fa62552b308a4c3e3c';

abstract class _$PasswordTextField extends $Notifier<TextFieldModel> {
  TextFieldModel build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<TextFieldModel, TextFieldModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TextFieldModel, TextFieldModel>,
              TextFieldModel,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(CurrentAuthUser)
final currentAuthUserProvider = CurrentAuthUserProvider._();

final class CurrentAuthUserProvider
    extends $NotifierProvider<CurrentAuthUser, User?> {
  CurrentAuthUserProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentAuthUserProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentAuthUserHash();

  @$internal
  @override
  CurrentAuthUser create() => CurrentAuthUser();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(User? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<User?>(value),
    );
  }
}

String _$currentAuthUserHash() => r'8a03441413c3fc459aceafa93c71113d02e421e3';

abstract class _$CurrentAuthUser extends $Notifier<User?> {
  User? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<User?, User?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<User?, User?>,
              User?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
