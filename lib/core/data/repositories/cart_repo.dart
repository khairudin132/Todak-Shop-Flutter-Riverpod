import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todak_shop/core/core.dart';

final cartRepoProvider = Provider((ref) => CartRepo(ref));

class CartRepo implements CartInterface {
  CartRepo(this._ref);

  final ProviderRef _ref;

  CartApiClient get _apiClient => _ref.read(cartApiClientProvider);

  @override
  Future<List<Cart>> getListOfCarts() async {
    final result = await _apiClient.getListOfCartItems();

    return result.when(
      data: (data) => data ?? [],
      error: (error) => throw error,
    );
  }

  @override
  Future<void> addCart(Cart cart) async {
    final result = await _apiClient.addCartItem(cartItem: cart);

    result.when(
      data: (data) {},
      error: (error) => throw error,
    );
  }

  @override
  Future<void> removeCartItem(String id) async {
    final result = await _apiClient.removeCartItemById(id);

    result.when(
      data: (data) {},
      error: (error) => throw error,
    );
  }
}
