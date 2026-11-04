// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_products.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(apiGetProducts)
final apiGetProductsProvider = ApiGetProductsFamily._();

final class ApiGetProductsProvider
    extends
        $FunctionalProvider<
          AsyncValue<ApiResult<GetProductsResponse>>,
          ApiResult<GetProductsResponse>,
          FutureOr<ApiResult<GetProductsResponse>>
        >
    with
        $FutureModifier<ApiResult<GetProductsResponse>>,
        $FutureProvider<ApiResult<GetProductsResponse>> {
  ApiGetProductsProvider._({
    required ApiGetProductsFamily super.from,
    required String? super.argument,
  }) : super(
         retry: null,
         name: r'apiGetProductsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$apiGetProductsHash();

  @override
  String toString() {
    return r'apiGetProductsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<ApiResult<GetProductsResponse>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ApiResult<GetProductsResponse>> create(Ref ref) {
    final argument = this.argument as String?;
    return apiGetProducts(ref, category: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ApiGetProductsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$apiGetProductsHash() => r'eddbb53e2f531a371989e4bf03276a42fb9148e6';

final class ApiGetProductsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<ApiResult<GetProductsResponse>>,
          String?
        > {
  ApiGetProductsFamily._()
    : super(
        retry: null,
        name: r'apiGetProductsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ApiGetProductsProvider call({String? category}) =>
      ApiGetProductsProvider._(argument: category, from: this);

  @override
  String toString() => r'apiGetProductsProvider';
}
