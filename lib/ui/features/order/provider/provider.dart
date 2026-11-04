import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todak_shop/core/core.dart';

final orderListProvider = Provider((ref) {
  return ref.read(orderRepoProvider).getListOfOrders;
});
