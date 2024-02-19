// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_products.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$apiGetProductsHash() => r'37a14893465fb2314c288303cc73269193365dc1';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [apiGetProducts].
@ProviderFor(apiGetProducts)
const apiGetProductsProvider = ApiGetProductsFamily();

/// See also [apiGetProducts].
class ApiGetProductsFamily
    extends Family<AsyncValue<ApiResult<GetProductsResponse>>> {
  /// See also [apiGetProducts].
  const ApiGetProductsFamily();

  /// See also [apiGetProducts].
  ApiGetProductsProvider call({
    String? category,
  }) {
    return ApiGetProductsProvider(
      category: category,
    );
  }

  @override
  ApiGetProductsProvider getProviderOverride(
    covariant ApiGetProductsProvider provider,
  ) {
    return call(
      category: provider.category,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'apiGetProductsProvider';
}

/// See also [apiGetProducts].
class ApiGetProductsProvider
    extends AutoDisposeFutureProvider<ApiResult<GetProductsResponse>> {
  /// See also [apiGetProducts].
  ApiGetProductsProvider({
    String? category,
  }) : this._internal(
          (ref) => apiGetProducts(
            ref as ApiGetProductsRef,
            category: category,
          ),
          from: apiGetProductsProvider,
          name: r'apiGetProductsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$apiGetProductsHash,
          dependencies: ApiGetProductsFamily._dependencies,
          allTransitiveDependencies:
              ApiGetProductsFamily._allTransitiveDependencies,
          category: category,
        );

  ApiGetProductsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.category,
  }) : super.internal();

  final String? category;

  @override
  Override overrideWith(
    FutureOr<ApiResult<GetProductsResponse>> Function(
            ApiGetProductsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ApiGetProductsProvider._internal(
        (ref) => create(ref as ApiGetProductsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        category: category,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ApiResult<GetProductsResponse>>
      createElement() {
    return _ApiGetProductsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ApiGetProductsProvider && other.category == category;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, category.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ApiGetProductsRef
    on AutoDisposeFutureProviderRef<ApiResult<GetProductsResponse>> {
  /// The parameter `category` of this provider.
  String? get category;
}

class _ApiGetProductsProviderElement
    extends AutoDisposeFutureProviderElement<ApiResult<GetProductsResponse>>
    with ApiGetProductsRef {
  _ApiGetProductsProviderElement(super.provider);

  @override
  String? get category => (origin as ApiGetProductsProvider).category;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
