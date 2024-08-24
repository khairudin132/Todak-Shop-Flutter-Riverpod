import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todak_shop/core/core.dart';

final orderRepoProvider = Provider((ref) => OrderRepo(ref));

class OrderRepo implements OrderInterface {
  OrderRepo(this._ref);

  final ProviderRef _ref;

  OrderApiClient get _apiClient => _ref.read(orderApiClientProvider);

  @override
  Future<List<Order>> getListOfOrders() async {
    final result = await _apiClient.getListOfOrderItems();

    return result.when(
      data: (data) => data ?? [],
      error: (error) => throw error,
    );
  }

  @override
  Future<void> addOrder(Order order) async {
    final result = await _apiClient.addOrderItem(orderItem: order);

    result.when(
      data: (data) {},
      error: (error) => throw error,
    );
  }

  @override
  Future<void> removeOrderItem(String id) async {
    final result = await _apiClient.removeOrderItemById(id);

    result.when(
      data: (data) {},
      error: (error) => throw error,
    );
  }
}
