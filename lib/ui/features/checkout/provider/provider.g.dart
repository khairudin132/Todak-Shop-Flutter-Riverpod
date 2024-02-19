// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$checkoutCartItemHash() => r'6faba34959df95f322a9121e3cee5793a3998d9a';

/// See also [CheckoutCartItem].
@ProviderFor(CheckoutCartItem)
final checkoutCartItemProvider = AutoDisposeNotifierProvider<CheckoutCartItem,
    ({List<Cart> carts, String totalPrice})>.internal(
  CheckoutCartItem.new,
  name: r'checkoutCartItemProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$checkoutCartItemHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CheckoutCartItem
    = AutoDisposeNotifier<({List<Cart> carts, String totalPrice})>;
String _$checkoutToOrderHash() => r'37e0f9015c9925f7dd80fa00b4afccfd6bff6590';

/// See also [CheckoutToOrder].
@ProviderFor(CheckoutToOrder)
final checkoutToOrderProvider =
    AutoDisposeAsyncNotifierProvider<CheckoutToOrder, ApiResult<void>>.internal(
  CheckoutToOrder.new,
  name: r'checkoutToOrderProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$checkoutToOrderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CheckoutToOrder = AutoDisposeAsyncNotifier<ApiResult<void>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
