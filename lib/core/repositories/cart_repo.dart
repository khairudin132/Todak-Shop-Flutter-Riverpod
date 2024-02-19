import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todak_shop/core/core.dart';

final cartRepoProvider = Provider((ref) => CartRepo(ref));

class CartRepo implements CartInterface {
  CartRepo(this._ref);

  final ProviderRef _ref;

  var _listOfCarts = <Cart>[];

  @override
  List<Cart> get getListOfCarts => _listOfCarts = _ref
          .read(cartLocalStorageProvider)
          .getListOfCarts
          ?.map((e) => Cart.fromJson(e))
          .toList() ??
      [];

  @override
  Future<void> addCart(Cart cart) async {
    // Find the highest current ID in the list of carts, or use -1 if the list is empty
    final int currentMaxId = _listOfCarts.isNullOrEmpty
        ? -1
        : _listOfCarts.map((e) => e.id ?? 0).reduce(max);

    // Assign the next ID as one more than the highest ID
    final int nextId = currentMaxId + 1;

    // Create a new Cart object with the new ID.
    final Cart newCart = cart.copyWith(id: nextId);

    // Add the new Cart object to the list.
    _listOfCarts.add(newCart);

    // Update the cart in local storage or database.
    await _updateCartLocal(_listOfCarts);
  }

  @override
  Future<void> removeCart(List<Cart> selectedCarts) async {
    _listOfCarts.removeWhere((element) => selectedCarts.contains(element));

    await _updateCartLocal(_listOfCarts);
  }

  @override
  Future<void> clearCart() async {
    _listOfCarts.clear();
    await _ref.read(cartLocalStorageProvider).clearCart();
  }

  Future<void> _updateCartLocal(List<Cart> listOfCarts) async {
    final listOfCartsString = listOfCarts.map((e) => (e.toJson())).toList();

    await _ref.read(cartLocalStorageProvider).clearCart();
    await _ref.read(cartLocalStorageProvider).setListOfCarts(listOfCartsString);
  }
}
