import 'dart:convert';

import 'package:todak_shop/core/domain/domain.dart';

class OrderItem {
  OrderItem({
    this.carts,
    this.address,
    this.totalPrice,
    this.createdAt,
  });

  List<Cart>? carts;
  Address? address;
  int? totalPrice;
  DateTime? createdAt;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'carts': carts?.map((x) => x.toMap()).toList(),
      'address': address?.toMap(),
      'totalPrice': totalPrice,
      'createdAt': createdAt?.millisecondsSinceEpoch,
    };
  }

  factory OrderItem.fromMap(Map<String, dynamic> map) {
    return OrderItem(
      carts: map['carts'] != null
          ? List<Cart>.from(
              (map['carts'] as List<dynamic>).map<Cart?>(
                (x) => Cart.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      address: map['address'] != null
          ? Address.fromMap(map['address'] as Map<String, dynamic>)
          : null,
      totalPrice: map['totalPrice'] != null ? map['totalPrice'] as int : null,
      createdAt: map['createdAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderItem.fromJson(String source) =>
      OrderItem.fromMap(json.decode(source) as Map<String, dynamic>);
}
