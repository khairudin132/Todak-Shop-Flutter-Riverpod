import 'dart:convert';

import 'product.dart';

class CartItem {
  CartItem({
    this.quantity,
    this.product,
  });

  int? quantity;
  Product? product;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'quantity': quantity,
      'product': product?.toMap(),
    };
  }

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      quantity: map['quantity'] != null ? map['quantity'] as int : null,
      product: map['product'] != null
          ? Product.fromMap(map['product'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartItem.fromJson(String source) =>
      CartItem.fromMap(json.decode(source) as Map<String, dynamic>);
}
