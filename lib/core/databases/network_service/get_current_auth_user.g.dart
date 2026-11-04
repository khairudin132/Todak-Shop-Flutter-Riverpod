// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_current_auth_user.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(apiGetCurrentAuthUser)
final apiGetCurrentAuthUserProvider = ApiGetCurrentAuthUserProvider._();

final class ApiGetCurrentAuthUserProvider
    extends
        $FunctionalProvider<
          AsyncValue<ApiResult<User>>,
          ApiResult<User>,
          FutureOr<ApiResult<User>>
        >
    with $FutureModifier<ApiResult<User>>, $FutureProvider<ApiResult<User>> {
  ApiGetCurrentAuthUserProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'apiGetCurrentAuthUserProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$apiGetCurrentAuthUserHash();

  @$internal
  @override
  $FutureProviderElement<ApiResult<User>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ApiResult<User>> create(Ref ref) {
    return apiGetCurrentAuthUser(ref);
  }
}

String _$apiGetCurrentAuthUserHash() =>
    r'a51d7ba5311fa09f3fa883fbd5540038ee02ff32';
