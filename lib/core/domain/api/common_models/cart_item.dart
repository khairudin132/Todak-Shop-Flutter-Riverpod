import 'package:freezed_annotation/freezed_annotation.dart';

import 'product.dart';

part 'cart_item.freezed.dart';
part 'cart_item.g.dart';

@freezed
class CartItem with _$CartItem {
  @JsonSerializable(explicitToJson: true)
  factory CartItem({
    @JsonKey(name: 'quantity') int? quantity,
    @JsonKey(name: 'product') Product? product,
  }) = _CartItem;

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);
}
