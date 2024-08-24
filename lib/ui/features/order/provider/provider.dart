import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todak_shop/core/core.dart';

part 'provider.g.dart';

@riverpod
class OrderItemsList extends _$OrderItemsList {
  @override
  Future<List<Order>> build() async {
    return await ref.read(orderRepoProvider).getListOfOrders();
  }

  Future<ApiResult<void>> addOrder(Order order) async {
    try {
      ref.read(appLoaderProvider.notifier).setLoaderValue(true);

      await ref.read(orderRepoProvider).addOrder(order);

      state = AsyncData(
        await ref.read(orderRepoProvider).getListOfOrders(),
      );

      return ApiSuccess();
    } on ApiError catch (e) {
      return e;
    } finally {
      ref.read(appLoaderProvider.notifier).setLoaderValue(false);
    }
  }

  Future<ApiResult<void>> removeOrderItem(String id) async {
    try {
      ref.read(appLoaderProvider.notifier).setLoaderValue(true);

      await ref.read(orderRepoProvider).removeOrderItem(id);

      state = AsyncData(
        await ref.read(orderRepoProvider).getListOfOrders(),
      );

      return ApiSuccess();
    } on ApiError catch (e) {
      return e;
    } finally {
      ref.read(appLoaderProvider.notifier).setLoaderValue(false);
    }
  }
}
