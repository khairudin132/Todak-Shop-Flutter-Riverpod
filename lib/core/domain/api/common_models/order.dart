import 'dart:convert';

import 'order_item.dart';

class Order {
  Order({
    this.id,
    this.item,
  });

  int? id;
  OrderItem? item;

  Order copyWith({
    int? id,
    OrderItem? item,
  }) {
    return Order(
      id: id ?? this.id,
      item: item ?? this.item,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'item': item?.toMap(),
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['id'] != null ? map['id'] as int : null,
      item: map['item'] != null
          ? OrderItem.fromMap(map['item'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) =>
      Order.fromMap(json.decode(source) as Map<String, dynamic>);
}
