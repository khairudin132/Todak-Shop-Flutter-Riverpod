import 'package:todak_shop/core/domain/domain.dart';

abstract class CartInterface {
  Future<List<Cart>> getListOfCarts();

  Future<void> addCart(Cart cart);

  Future<void> removeCartItem(String id);
}
