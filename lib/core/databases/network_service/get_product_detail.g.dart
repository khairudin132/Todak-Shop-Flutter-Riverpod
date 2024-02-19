// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_product_detail.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$apiGetProductDetailHash() =>
    r'ae42cab912cc030a6a3cf58280f435b4c07f845d';

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

/// See also [apiGetProductDetail].
@ProviderFor(apiGetProductDetail)
const apiGetProductDetailProvider = ApiGetProductDetailFamily();

/// See also [apiGetProductDetail].
class ApiGetProductDetailFamily extends Family<AsyncValue<ApiResult<Product>>> {
  /// See also [apiGetProductDetail].
  const ApiGetProductDetailFamily();

  /// See also [apiGetProductDetail].
  ApiGetProductDetailProvider call({
    required int id,
  }) {
    return ApiGetProductDetailProvider(
      id: id,
    );
  }

  @override
  ApiGetProductDetailProvider getProviderOverride(
    covariant ApiGetProductDetailProvider provider,
  ) {
    return call(
      id: provider.id,
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
  String? get name => r'apiGetProductDetailProvider';
}

/// See also [apiGetProductDetail].
class ApiGetProductDetailProvider
    extends AutoDisposeFutureProvider<ApiResult<Product>> {
  /// See also [apiGetProductDetail].
  ApiGetProductDetailProvider({
    required int id,
  }) : this._internal(
          (ref) => apiGetProductDetail(
            ref as ApiGetProductDetailRef,
            id: id,
          ),
          from: apiGetProductDetailProvider,
          name: r'apiGetProductDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$apiGetProductDetailHash,
          dependencies: ApiGetProductDetailFamily._dependencies,
          allTransitiveDependencies:
              ApiGetProductDetailFamily._allTransitiveDependencies,
          id: id,
        );

  ApiGetProductDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<ApiResult<Product>> Function(ApiGetProductDetailRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ApiGetProductDetailProvider._internal(
        (ref) => create(ref as ApiGetProductDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ApiResult<Product>> createElement() {
    return _ApiGetProductDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ApiGetProductDetailProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ApiGetProductDetailRef
    on AutoDisposeFutureProviderRef<ApiResult<Product>> {
  /// The parameter `id` of this provider.
  int get id;
}

class _ApiGetProductDetailProviderElement
    extends AutoDisposeFutureProviderElement<ApiResult<Product>>
    with ApiGetProductDetailRef {
  _ApiGetProductDetailProviderElement(super.provider);

  @override
  int get id => (origin as ApiGetProductDetailProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
