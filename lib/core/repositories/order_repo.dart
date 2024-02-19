import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todak_shop/core/core.dart';

final orderRepoProvider = Provider((ref) => OrderRepo(ref));

class OrderRepo implements OrderInterface {
  OrderRepo(this._ref);

  final ProviderRef _ref;

  var _listOfOrders = <Order>[];

  @override
  List<Order> get getListOfOrders => _listOfOrders = _ref
          .read(orderLocalStorageProvider)
          .getListOfOrders
          ?.map((e) => Order.fromJson(e))
          .toList() ??
      [];

  @override
  Future<void> addOrder(Order order) async {
    // Find the highest current ID in the list of orders, or use -1 if the list is empty
    final int currentMaxId = _listOfOrders.isNullOrEmpty
        ? -1
        : _listOfOrders.map((e) => e.id ?? 0).reduce(max);

    // Assign the next ID as one more than the highest ID
    final int nextId = currentMaxId + 1;

    // Create a new Order object with the new ID.
    final Order newOrder = order.copyWith(id: nextId);

    // Add the new Order object to the list.
    _listOfOrders.add(newOrder);

    // Update the order in local storage or database.

    await _updateOrderLocal(_listOfOrders);
  }

  @override
  Future<void> clearOrder() async {
    _listOfOrders.clear();
    await _ref.read(orderLocalStorageProvider).clearOrder();
  }

  Future<void> _updateOrderLocal(List<Order> listOfOrders) async {
    final listOfOrdersString = listOfOrders.map((e) => (e.toJson())).toList();

    await _ref.read(orderLocalStorageProvider).clearOrder();
    await _ref
        .read(orderLocalStorageProvider)
        .setListOfOrders(listOfOrdersString);
  }
}
