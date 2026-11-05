import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todak_shop/core/core.dart';

final orderRepoProvider = Provider((ref) => OrderRepo(ref));

class OrderRepo implements OrderInterface {
  OrderRepo(this._ref);

  final Ref _ref;

  var _listOfOrders = <Order>[];

  @override
  List<Order> get getListOfOrders => _listOfOrders =
      _ref
          .read(orderLocalStorageProvider)
          .getListOfOrders
          ?.map((e) => Order.fromJson(e))
          .toList() ??
      [];

  @override
  Future<void> addOrder(Order order) async {
    // Reload from storage: the in-memory list is empty until something has
    // read getListOfOrders, and saving it as-is would wipe stored orders.
    final listOfOrders = getListOfOrders;

    // Find the highest current ID in the list of orders, or use -1 if the list is empty
    final int currentMaxId = listOfOrders.isNullOrEmpty
        ? -1
        : listOfOrders.map((e) => e.id ?? 0).reduce(max);

    // Assign the next ID as one more than the highest ID
    final int nextId = currentMaxId + 1;

    // Create a new Order object with the new ID.
    final Order newOrder = order.copyWith(id: nextId);

    // Store a new list instance so providers holding the old one see a change.
    _listOfOrders = [...listOfOrders, newOrder];

    await _updateOrderLocal(_listOfOrders);
  }

  @override
  Future<void> clearOrder() async {
    _listOfOrders = [];
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
