import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todak_shop/core/core.dart';

final cartApiClientProvider = Provider((ref) => CartApiClient());

class CartApiClient {
  CartApiClient();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<ApiResult<List<Cart>>> getListOfCartItems() async {
    try {
      final docSnapshot = await _firestore
          .collection(Constant.firebaseConstants.users)
          .doc(_auth.currentUser!.uid)
          .collection(Constant.firebaseConstants.carts)
          .get();

      final cartItems =
          docSnapshot.docs.map((doc) => Cart.fromJson(doc.data())).toList();

      if (cartItems.isNullOrEmpty) {
        return ApiError(
          code: "cart_not_found",
          message: "Cart not found",
        );
      }

      return ApiSuccess(value: cartItems);
    } on FirebaseAuthException catch (e) {
      return ApiError(
        code: e.code,
        message: e.message,
        stackTrace: e.stackTrace,
      );
    } catch (e, s) {
      return ApiError(
        message: e.toString(),
        stackTrace: s,
      );
    }
  }

  Future<ApiResult<void>> addCartItem({required Cart cartItem}) async {
    try {
      final docRef = await _firestore
          .collection(Constant.firebaseConstants.users)
          .doc(_auth.currentUser!.uid)
          .collection(Constant.firebaseConstants.carts)
          .add(cartItem.toJson());

      await docRef.update({"id": docRef.id});

      return ApiSuccess();
    } on FirebaseAuthException catch (e) {
      return ApiError(
        code: e.code,
        message: e.message,
        stackTrace: e.stackTrace,
      );
    } catch (e, s) {
      return ApiError(
        message: e.toString(),
        stackTrace: s,
      );
    }
  }

  // TODO: Stream query update cart item quantity
  // Future<ApiResult<void>> updateAddress({required Address address}) async {
  //   try {
  //     await _firestore
  //         .collection(Constant.firebaseConstants.users)
  //         .doc(_auth.currentUser!.uid)
  //         .collection(Constant.firebaseConstants.carts)
  //         .doc(address.id)
  //         .update(address.toJson());

  //     return ApiSuccess();
  //   } on FirebaseAuthException catch (e) {
  //     return ApiError(
  //       code: e.code,
  //       message: e.message,
  //       stackTrace: e.stackTrace,
  //     );
  //   } catch (e, s) {
  //     return ApiError(
  //       message: e.toString(),
  //       stackTrace: s,
  //     );
  //   }
  // }

  Future<ApiResult<void>> removeCartItemById(String id) async {
    try {
      await _firestore
          .collection(Constant.firebaseConstants.users)
          .doc(_auth.currentUser!.uid)
          .collection(Constant.firebaseConstants.carts)
          .doc(id)
          .delete();

      return ApiSuccess();
    } on FirebaseAuthException catch (e) {
      return ApiError(
        code: e.code,
        message: e.message,
        stackTrace: e.stackTrace,
      );
    } catch (e, s) {
      return ApiError(
        message: e.toString(),
        stackTrace: s,
      );
    }
  }
}
