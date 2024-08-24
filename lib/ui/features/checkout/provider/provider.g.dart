// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$checkoutCartItemHash() => r'c6a9162e79c7916de613bbd01be7f3407b95f6b6';

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
