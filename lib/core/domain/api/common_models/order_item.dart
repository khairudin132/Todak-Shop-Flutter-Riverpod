import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todak_shop/core/domain/domain.dart';

part 'order_item.freezed.dart';
part 'order_item.g.dart';

@freezed
class OrderItem with _$OrderItem {
  @JsonSerializable(explicitToJson: true)
  factory OrderItem({
    @JsonKey(name: 'carts') List<Cart>? carts,
    @JsonKey(name: 'address') Address? address,
    @JsonKey(name: 'totalPrice') int? totalPrice,
    @JsonKey(name: 'createdAt') DateTime? createdAt,
  }) = _OrderItem;

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);
}
