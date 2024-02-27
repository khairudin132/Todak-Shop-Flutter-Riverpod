import 'package:freezed_annotation/freezed_annotation.dart';

import 'order_item.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
class Order with _$Order {
  @JsonSerializable(explicitToJson: true)
  factory Order({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'item') OrderItem? item,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}
