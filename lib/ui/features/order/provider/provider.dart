import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todak_shop/core/core.dart';

final orderListProvider = Provider((ref) {
  return ref.read(orderRepoProvider).getListOfOrders;
});
