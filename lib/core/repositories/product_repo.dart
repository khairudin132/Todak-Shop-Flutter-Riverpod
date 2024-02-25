import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:collection/collection.dart';

import 'package:todak_shop/core/core.dart';

final productRepoProvider = Provider((ref) => ProductRepo(ref));

class ProductRepo implements ProductInterface {
  ProductRepo(this._ref);

  final ProviderRef _ref;

  ProductApiClient get _apiClient => _ref.read(productApiClientProvider);

  @override
  Future<List<CategoryItem>> getListOfCategories() async {
    final result = await _apiClient.apiGetCategories();

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
    final result = await _apiClient.apiGetProducts(category: category);

    return result.when(
      data: (data) {
        return data?.products ?? [];
      },
      error: (error) => throw error,
    );
  }

  @override
  Future<Product?> getProductById(int id) async {
    final result = await _apiClient.apiGetProductDetail(id: id);

    return result.when(
      data: (data) {
        return data;
      },
      error: (error) => throw error,
    );
  }
}
