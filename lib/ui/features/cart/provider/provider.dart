import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todak_shop/core/core.dart';

part 'provider.g.dart';

@riverpod
class CartItemsList extends _$CartItemsList {
  @override
  Future<List<Cart>> build() async {
    return await ref.read(cartRepoProvider).getListOfCarts();
  }

  Future<ApiResult<void>> addCart(Cart cart) async {
    try {
      ref.read(appLoaderProvider.notifier).setLoaderValue(true);

      await ref.read(cartRepoProvider).addCart(cart);

      state = AsyncData(
        await ref.read(cartRepoProvider).getListOfCarts(),
      );

      return ApiSuccess();
    } on ApiError catch (e) {
      return e;
    } finally {
      ref.read(appLoaderProvider.notifier).setLoaderValue(false);
    }
  }

  Future<ApiResult<void>> removeCartItem(String id) async {
    try {
      ref.read(appLoaderProvider.notifier).setLoaderValue(true);

      await ref.read(cartRepoProvider).removeCartItem(id);

      state = AsyncData(
        await ref.read(cartRepoProvider).getListOfCarts(),
      );

      return ApiSuccess();
    } on ApiError catch (e) {
      return e;
    } finally {
      ref.read(appLoaderProvider.notifier).setLoaderValue(false);
    }
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
class TotalCartQuantity extends _$TotalCartQuantity {
  @override
  Stream<int> build() async* {
    // final list = ref.watch(cartItemsListProvider);
    final getCarts = await ref.watch(cartItemsListProvider.future);

    final totalQuantity = getCarts
        .map((e) => e.item?.quantity ?? 0)
        .fold(0, (previousValue, element) => previousValue + element);

    yield totalQuantity;
  }
}

@riverpod
class TotalPriceCart extends _$TotalPriceCart {
  @override
  String build() {
    final list = ref.watch(collectCartItemForCheckoutProvider);

    final double total = list
        .map((e) => (e.item?.product?.price ?? 0.0) * e.item!.quantity!)
        .fold(0.0, (previousValue, element) => previousValue + element);

    return total.toString();
  }
}
