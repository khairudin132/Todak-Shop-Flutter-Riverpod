import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todak_shop/core/core.dart';
import 'package:todak_shop/ui/features/address/provider/provider.dart';

part 'provider.g.dart';

@riverpod
class AddProductToCart extends _$AddProductToCart {
  @override
  List<Cart> build() {
    return ref.read(cartRepoProvider).getListOfCarts;
  }

  Future<void> addCart(Cart cart) async {
    await ref.read(cartRepoProvider).addCart(cart);

    state = ref.read(cartRepoProvider).getListOfCarts;
  }

  Future<void> removeCart(List<Cart> carts) async {
    await ref.read(cartRepoProvider).removeCart(carts);

    state = ref.read(cartRepoProvider).getListOfCarts;
  }
}

@riverpod
class CollectCartItemForCheckout extends _$CollectCartItemForCheckout {
  @override
  List<Cart> build() {
    return [];
  }

  void addCartItem(Cart cart) {
    state = [...state, cart];
  }

  void deleteCartItem(Cart cart) {
    state = state.where((element) => element.id != cart.id).toList();
  }

  void clearCart() {
    state = [];
  }
}

@riverpod
class TotalPriceCart extends _$TotalPriceCart {
  @override
  String build() {
    final list = ref.watch(collectCartItemForCheckoutProvider);

    final total = list
        .map((e) => (e.item?.product?.price ?? 0) * e.item!.quantity!)
        .fold(0, (previousValue, element) => previousValue + element);

    return total.toString();
  }
}
