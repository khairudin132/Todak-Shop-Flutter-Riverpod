// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$apiSignInHash() => r'7d252a2cd6d982c1dea1714da83bbfa56cc81d47';

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

/// See also [apiSignIn].
@ProviderFor(apiSignIn)
const apiSignInProvider = ApiSignInFamily();

/// See also [apiSignIn].
class ApiSignInFamily extends Family<AsyncValue<ApiResult<User>>> {
  /// See also [apiSignIn].
  const ApiSignInFamily();

  /// See also [apiSignIn].
  ApiSignInProvider call({
    required SignInRequest request,
  }) {
    return ApiSignInProvider(
      request: request,
    );
  }

  @override
  ApiSignInProvider getProviderOverride(
    covariant ApiSignInProvider provider,
  ) {
    return call(
      request: provider.request,
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
  String? get name => r'apiSignInProvider';
}

/// See also [apiSignIn].
class ApiSignInProvider extends AutoDisposeFutureProvider<ApiResult<User>> {
  /// See also [apiSignIn].
  ApiSignInProvider({
    required SignInRequest request,
  }) : this._internal(
          (ref) => apiSignIn(
            ref as ApiSignInRef,
            request: request,
          ),
          from: apiSignInProvider,
          name: r'apiSignInProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$apiSignInHash,
          dependencies: ApiSignInFamily._dependencies,
          allTransitiveDependencies: ApiSignInFamily._allTransitiveDependencies,
          request: request,
        );

  ApiSignInProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.request,
  }) : super.internal();

  final SignInRequest request;

  @override
  Override overrideWith(
    FutureOr<ApiResult<User>> Function(ApiSignInRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ApiSignInProvider._internal(
        (ref) => create(ref as ApiSignInRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        request: request,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ApiResult<User>> createElement() {
    return _ApiSignInProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ApiSignInProvider && other.request == request;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, request.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ApiSignInRef on AutoDisposeFutureProviderRef<ApiResult<User>> {
  /// The parameter `request` of this provider.
  SignInRequest get request;
}

class _ApiSignInProviderElement
    extends AutoDisposeFutureProviderElement<ApiResult<User>>
    with ApiSignInRef {
  _ApiSignInProviderElement(super.provider);

  @override
  SignInRequest get request => (origin as ApiSignInProvider).request;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
