import 'dart:convert';

import 'package:todak_shop/core/core.dart';

class Cart {
  Cart({
    this.id,
    this.item,
  });

  int? id;
  CartItem? item;

  Cart copyWith({
    int? id,
    CartItem? item,
  }) {
    return Cart(
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

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      id: map['id'] != null ? map['id'] as int : null,
      item: map['item'] != null
          ? CartItem.fromMap(map['item'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cart.fromJson(String source) =>
      Cart.fromMap(json.decode(source) as Map<String, dynamic>);
}
