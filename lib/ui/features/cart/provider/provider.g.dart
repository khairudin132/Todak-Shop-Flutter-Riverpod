// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AddProductToCart)
final addProductToCartProvider = AddProductToCartProvider._();

final class AddProductToCartProvider
    extends $NotifierProvider<AddProductToCart, List<Cart>> {
  AddProductToCartProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addProductToCartProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addProductToCartHash();

  @$internal
  @override
  AddProductToCart create() => AddProductToCart();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Cart> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Cart>>(value),
    );
  }
}

String _$addProductToCartHash() => r'48afeabf09ff0a049c1f1b65eba4d4577a77b109';

abstract class _$AddProductToCart extends $Notifier<List<Cart>> {
  List<Cart> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<List<Cart>, List<Cart>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<Cart>, List<Cart>>,
              List<Cart>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(CollectCartItemForCheckout)
final collectCartItemForCheckoutProvider =
    CollectCartItemForCheckoutProvider._();

final class CollectCartItemForCheckoutProvider
    extends $NotifierProvider<CollectCartItemForCheckout, List<Cart>> {
  CollectCartItemForCheckoutProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'collectCartItemForCheckoutProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$collectCartItemForCheckoutHash();

  @$internal
  @override
  CollectCartItemForCheckout create() => CollectCartItemForCheckout();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Cart> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Cart>>(value),
    );
  }
}

String _$collectCartItemForCheckoutHash() =>
    r'aec2a027fd6e0e82ab1450caf7535db778ef1e0b';

abstract class _$CollectCartItemForCheckout extends $Notifier<List<Cart>> {
  List<Cart> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<List<Cart>, List<Cart>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<Cart>, List<Cart>>,
              List<Cart>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(TotalPriceCart)
final totalPriceCartProvider = TotalPriceCartProvider._();

final class TotalPriceCartProvider
    extends $NotifierProvider<TotalPriceCart, String> {
  TotalPriceCartProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'totalPriceCartProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$totalPriceCartHash();

  @$internal
  @override
  TotalPriceCart create() => TotalPriceCart();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$totalPriceCartHash() => r'f4da95c7018c0916d6151b4a22b91ca1d9337995';

abstract class _$TotalPriceCart extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
