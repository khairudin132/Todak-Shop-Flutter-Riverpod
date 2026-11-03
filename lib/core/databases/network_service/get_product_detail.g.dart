// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_product_detail.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(apiGetProductDetail)
final apiGetProductDetailProvider = ApiGetProductDetailFamily._();

final class ApiGetProductDetailProvider
    extends
        $FunctionalProvider<
          AsyncValue<ApiResult<Product>>,
          ApiResult<Product>,
          FutureOr<ApiResult<Product>>
        >
    with
        $FutureModifier<ApiResult<Product>>,
        $FutureProvider<ApiResult<Product>> {
  ApiGetProductDetailProvider._({
    required ApiGetProductDetailFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'apiGetProductDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$apiGetProductDetailHash();

  @override
  String toString() {
    return r'apiGetProductDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<ApiResult<Product>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ApiResult<Product>> create(Ref ref) {
    final argument = this.argument as int;
    return apiGetProductDetail(ref, id: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ApiGetProductDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$apiGetProductDetailHash() =>
    r'5e31158ff93eb0f934988082dae7662ba365252b';

final class ApiGetProductDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<ApiResult<Product>>, int> {
  ApiGetProductDetailFamily._()
    : super(
        retry: null,
        name: r'apiGetProductDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ApiGetProductDetailProvider call({required int id}) =>
      ApiGetProductDetailProvider._(argument: id, from: this);

  @override
  String toString() => r'apiGetProductDetailProvider';
}
