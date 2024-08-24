import 'package:cloud_firestore/cloud_firestore.dart' hide Order;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todak_shop/core/core.dart';
import 'package:todak_shop/ui/features/address/provider/provider.dart';
import 'package:todak_shop/ui/features/cart/provider/provider.dart';
import 'package:todak_shop/ui/features/order/provider/provider.dart';

part 'provider.g.dart';

@riverpod
class CheckoutCartItem extends _$CheckoutCartItem {
  @override
  ({List<Cart> carts, String totalPrice}) build() {
    return (carts: [], totalPrice: '0');
  }

  void getCarts(List<Cart> carts) {
    final double total = carts
        .map((e) => (e.item?.product?.price ?? 0.0) * e.item!.quantity!)
        .fold(0.0, (previousValue, element) => previousValue + element);
    state = (carts: carts, totalPrice: total.toString());
  }

  Future<ApiResult<void>> checkout() async {
    try {
      ref.read(appLoaderProvider.notifier).setLoaderValue(true);

      final listOfCarts = state.carts;
      final totalPrice = state.totalPrice;

      final defaultAddress = ref.read(defaultAddressProvider);

      if (defaultAddress == null) {
        return ApiError(message: 'Please save your address first');
      }

      final order = Order(
        item: OrderItem(
          carts: listOfCarts,
          address: defaultAddress,
          totalPrice: totalPrice,
          createdAt: Timestamp.now().toDate(),
        ),
      );

      await ref.read(orderItemsListProvider.notifier).addOrder(order);
      // TODO remove cart in order
      // await ref.read(cartItemsListProvider.notifier).removeCartItem(listOfCarts);
      ref.read(collectCartItemForCheckoutProvider.notifier).clearCart();


      return ApiSuccess(value: null);
    } finally {
      ref.read(appLoaderProvider.notifier).setLoaderValue(false);
    }
  }
}
