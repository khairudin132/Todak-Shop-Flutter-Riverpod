// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CheckoutCartItem)
final checkoutCartItemProvider = CheckoutCartItemProvider._();

final class CheckoutCartItemProvider
    extends
        $NotifierProvider<
          CheckoutCartItem,
          ({List<Cart> carts, String totalPrice})
        > {
  CheckoutCartItemProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'checkoutCartItemProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$checkoutCartItemHash();

  @$internal
  @override
  CheckoutCartItem create() => CheckoutCartItem();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(({List<Cart> carts, String totalPrice}) value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<({List<Cart> carts, String totalPrice})>(value),
    );
  }
}

String _$checkoutCartItemHash() => r'6faba34959df95f322a9121e3cee5793a3998d9a';

abstract class _$CheckoutCartItem
    extends $Notifier<({List<Cart> carts, String totalPrice})> {
  ({List<Cart> carts, String totalPrice}) build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<
              ({List<Cart> carts, String totalPrice}),
              ({List<Cart> carts, String totalPrice})
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                ({List<Cart> carts, String totalPrice}),
                ({List<Cart> carts, String totalPrice})
              >,
              ({List<Cart> carts, String totalPrice}),
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(CheckoutToOrder)
final checkoutToOrderProvider = CheckoutToOrderProvider._();

final class CheckoutToOrderProvider
    extends $AsyncNotifierProvider<CheckoutToOrder, ApiResult<void>> {
  CheckoutToOrderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'checkoutToOrderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$checkoutToOrderHash();

  @$internal
  @override
  CheckoutToOrder create() => CheckoutToOrder();
}

String _$checkoutToOrderHash() => r'6f29fa1bc456aa26b067c8b23e46da0d8444d680';

abstract class _$CheckoutToOrder extends $AsyncNotifier<ApiResult<void>> {
  FutureOr<ApiResult<void>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<ApiResult<void>>, ApiResult<void>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ApiResult<void>>, ApiResult<void>>,
              AsyncValue<ApiResult<void>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
