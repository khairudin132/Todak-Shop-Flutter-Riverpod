import 'package:todak_shop/core/domain/domain.dart';

abstract class OrderInterface {
  Future<List<Order>> getListOfOrders();

  Future<void> addOrder(Order order);

  Future<void> removeOrderItem(String id);
}
