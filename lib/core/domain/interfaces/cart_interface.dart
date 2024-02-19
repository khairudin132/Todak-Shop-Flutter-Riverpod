import 'package:todak_shop/core/domain/domain.dart';

abstract class CartInterface {
  List<Cart> get getListOfCarts;

  Future<void> addCart(Cart cart);

  Future<void> removeCart(List<Cart> cart);

  Future<void> clearCart();
}
