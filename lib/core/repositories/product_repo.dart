import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:todak_shop/core/core.dart';

final productRepoProvider = Provider((ref) => ProductRepo(ref));

class ProductRepo implements ProductInterface {
  ProductRepo(this._ref);

  final ProviderRef _ref;

  @override
  Future<List<CategoryItem>> getListOfCategories() async {
    final result = await _ref.read(apiGetCategoriesProvider.future);

    return result.when(
      data: (data) {
        return data?.categories
                ?.mapIndexed((index, element) => CategoryItem(
                      index: index + 1,
                      rawString: element,
                    ))
                .toList() ??
            [];
      },
      error: (error) => throw error,
    );
  }

  @override
  Future<List<Product>> getListOfProducts({String? category}) async {
    final result =
        await _ref.read(apiGetProductsProvider(category: category).future);

    return result.when(
      data: (data) {
        return data?.products ?? [];
      },
      error: (error) => throw error,
    );
  }

  @override
  Future<Product?> getProductById(int id) async {
    final result = await _ref.read(apiGetProductDetailProvider(id: id).future);

    return result.when(
      data: (data) {
        return data;
      },
      error: (error) => throw error,
    );
  }
}
