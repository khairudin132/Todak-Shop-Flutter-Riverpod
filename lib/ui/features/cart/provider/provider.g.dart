// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cartItemsListHash() => r'66c3004ff294d2bfa43d0076d643e2a8fe6e82f8';

/// See also [CartItemsList].
@ProviderFor(CartItemsList)
final cartItemsListProvider =
    AutoDisposeAsyncNotifierProvider<CartItemsList, List<Cart>>.internal(
  CartItemsList.new,
  name: r'cartItemsListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$cartItemsListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CartItemsList = AutoDisposeAsyncNotifier<List<Cart>>;
String _$collectCartItemForCheckoutHash() =>
    r'aec2a027fd6e0e82ab1450caf7535db778ef1e0b';

/// See also [CollectCartItemForCheckout].
@ProviderFor(CollectCartItemForCheckout)
final collectCartItemForCheckoutProvider = AutoDisposeNotifierProvider<
    CollectCartItemForCheckout, List<Cart>>.internal(
  CollectCartItemForCheckout.new,
  name: r'collectCartItemForCheckoutProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$collectCartItemForCheckoutHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CollectCartItemForCheckout = AutoDisposeNotifier<List<Cart>>;
String _$totalCartQuantityHash() => r'a5adc68f6ee6e0d9baebf714227b980d60578eaf';

/// See also [TotalCartQuantity].
@ProviderFor(TotalCartQuantity)
final totalCartQuantityProvider =
    AutoDisposeStreamNotifierProvider<TotalCartQuantity, int>.internal(
  TotalCartQuantity.new,
  name: r'totalCartQuantityProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$totalCartQuantityHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TotalCartQuantity = AutoDisposeStreamNotifier<int>;
String _$totalPriceCartHash() => r'0552b115c291d7a6bc9d24007ae55cb0b695c830';

/// See also [TotalPriceCart].
@ProviderFor(TotalPriceCart)
final totalPriceCartProvider =
    AutoDisposeNotifierProvider<TotalPriceCart, String>.internal(
  TotalPriceCart.new,
  name: r'totalPriceCartProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$totalPriceCartHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TotalPriceCart = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
