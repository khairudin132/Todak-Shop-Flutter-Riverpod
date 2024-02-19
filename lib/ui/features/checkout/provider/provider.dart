import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todak_shop/core/core.dart';
import 'package:todak_shop/ui/features/address/provider/provider.dart';
import 'package:todak_shop/ui/features/cart/provider/provider.dart';

part 'provider.g.dart';

@riverpod
class CheckoutCartItem extends _$CheckoutCartItem {
  @override
  ({List<Cart> carts, String totalPrice}) build() {
    return (carts: [], totalPrice: '0');
  }

  void getCarts(List<Cart> carts) {
    final total = carts
        .map((e) => (e.item?.product?.price ?? 0) * e.item!.quantity!)
        .fold(0, (previousValue, element) => previousValue + element);
    state = (carts: carts, totalPrice: total.toString());
  }
}

@riverpod
class CheckoutToOrder extends _$CheckoutToOrder {
  @override
  Future<ApiResult<void>> build() async {
    return ApiSuccess(value: null);
  }

  Future<ApiResult<void>> checkout() async {
    try {
      ref.read(appLoaderProvider.notifier).setLoaderValue(true);

      final listOfCarts = ref.read(checkoutCartItemProvider).carts;
      final totalPrice = ref.read(checkoutCartItemProvider).totalPrice;

      final currentSaveAddress = ref.read(saveAddressProvider);

      final order = Order(
        item: OrderItem(
          carts: listOfCarts,
          address: currentSaveAddress,
          totalPrice: int.tryParse(totalPrice),
          createdAt: DateTime.now(),
        ),
      );

      await ref.read(orderRepoProvider).addOrder(order);
      await ref.read(addProductToCartProvider.notifier).removeCart(listOfCarts);
      ref.read(collectCartItemForCheckoutProvider.notifier).clearCart();

      await Future.delayed(const Duration(seconds: 1));

      return ApiSuccess(value: null);
    } finally {
      ref.read(appLoaderProvider.notifier).setLoaderValue(false);
    }
  }
}
