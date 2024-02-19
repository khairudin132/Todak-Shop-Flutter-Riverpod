import 'package:todak_shop/core/core.dart';

abstract class ProductInterface {
  Future<List<CategoryItem>> getListOfCategories();

  Future<List<Product>> getListOfProducts({String? category});

  Future<Product?> getProductById(int id);
}
