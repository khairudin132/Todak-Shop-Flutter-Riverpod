import 'package:todak_shop/core/domain/domain.dart';

abstract class OrderInterface {
  List<Order> get getListOfOrders;

  Future<void> addOrder(Order order);

  Future<void> clearOrder();
}
