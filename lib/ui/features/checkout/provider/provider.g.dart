// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$checkoutCartItemHash() => r'84a2a38c9b9065ba85d7f3f9d4b19dbb840c288c';

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
String _$checkoutToOrderHash() => r'6a286f9ff9485ad6521a6a6999d92dc9b192702a';

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
