import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todak_shop/core/domain/api/common_models/product.dart';

part 'get_products.freezed.dart';
part 'get_products.g.dart';

@freezed
class GetProductsResponse with _$GetProductsResponse {
  factory GetProductsResponse({
    @JsonKey(name: 'products') List<Product>? products,
  }) = _GetProductsResponse;

  factory GetProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetProductsResponseFromJson(json);
}
