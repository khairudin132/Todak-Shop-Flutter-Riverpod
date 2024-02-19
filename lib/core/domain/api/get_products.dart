import 'package:todak_shop/core/domain/api/common_models/product.dart';

class GetProductsResponse {
  GetProductsResponse({
    this.products,
  });

  List<Product>? products;

  factory GetProductsResponse.fromJson(Map<String, dynamic> map) {
    return GetProductsResponse(
      products: map['products'] != null
          ? List<Product>.from(
              (map['products'] as List<dynamic>).map<Product?>(
                (x) => Product.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }
}
