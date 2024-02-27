import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todak_shop/core/core.dart';

part 'cart.freezed.dart';
part 'cart.g.dart';

@freezed
class Cart with _$Cart {
  @JsonSerializable(explicitToJson: true)
  factory Cart({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'item') CartItem? item,
  }) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}
