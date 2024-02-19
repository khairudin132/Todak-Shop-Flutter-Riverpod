import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todak_shop/core/core.dart';

final getProductDetailProvider =
    FutureProvider.family<Product?, int>((ref, id) async {
  return await ref.read(productRepoProvider).getProductById(id);
});
