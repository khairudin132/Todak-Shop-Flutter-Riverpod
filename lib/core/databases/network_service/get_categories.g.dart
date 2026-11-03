// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_categories.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(apiGetCategories)
final apiGetCategoriesProvider = ApiGetCategoriesProvider._();

final class ApiGetCategoriesProvider
    extends
        $FunctionalProvider<
          AsyncValue<ApiResult<GetCategoriesResponse>>,
          ApiResult<GetCategoriesResponse>,
          FutureOr<ApiResult<GetCategoriesResponse>>
        >
    with
        $FutureModifier<ApiResult<GetCategoriesResponse>>,
        $FutureProvider<ApiResult<GetCategoriesResponse>> {
  ApiGetCategoriesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'apiGetCategoriesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$apiGetCategoriesHash();

  @$internal
  @override
  $FutureProviderElement<ApiResult<GetCategoriesResponse>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ApiResult<GetCategoriesResponse>> create(Ref ref) {
    return apiGetCategories(ref);
  }
}

String _$apiGetCategoriesHash() => r'c702cf6857081ccf3be4945fd56d19818fa8bf6c';
