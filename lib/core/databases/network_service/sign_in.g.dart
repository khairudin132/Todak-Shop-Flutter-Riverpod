// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(apiSignIn)
final apiSignInProvider = ApiSignInFamily._();

final class ApiSignInProvider
    extends
        $FunctionalProvider<
          AsyncValue<ApiResult<User>>,
          ApiResult<User>,
          FutureOr<ApiResult<User>>
        >
    with $FutureModifier<ApiResult<User>>, $FutureProvider<ApiResult<User>> {
  ApiSignInProvider._({
    required ApiSignInFamily super.from,
    required SignInRequest super.argument,
  }) : super(
         retry: null,
         name: r'apiSignInProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$apiSignInHash();

  @override
  String toString() {
    return r'apiSignInProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<ApiResult<User>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ApiResult<User>> create(Ref ref) {
    final argument = this.argument as SignInRequest;
    return apiSignIn(ref, request: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ApiSignInProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$apiSignInHash() => r'd0d943bdbf3757ef4e03339927c6a9ecf1f58b3a';

final class ApiSignInFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<ApiResult<User>>, SignInRequest> {
  ApiSignInFamily._()
    : super(
        retry: null,
        name: r'apiSignInProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ApiSignInProvider call({required SignInRequest request}) =>
      ApiSignInProvider._(argument: request, from: this);

  @override
  String toString() => r'apiSignInProvider';
}
