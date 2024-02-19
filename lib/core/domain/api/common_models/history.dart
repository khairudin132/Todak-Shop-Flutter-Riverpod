// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'product.dart';

class History {
  History({
    this.id,
    this.product,
    this.viewTimes,
  });

  int? id;
  Product? product;
  int? viewTimes;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'product': product?.toMap(),
      'viewTimes': viewTimes,
    };
  }

  factory History.fromMap(Map<String, dynamic> map) {
    return History(
      id: map['id'] != null ? map['id'] as int : null,
      product: map['product'] != null
          ? Product.fromMap(map['product'] as Map<String, dynamic>)
          : null,
      viewTimes: map['viewTimes'] != null ? map['viewTimes'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory History.fromJson(String source) =>
      History.fromMap(json.decode(source) as Map<String, dynamic>);
}
