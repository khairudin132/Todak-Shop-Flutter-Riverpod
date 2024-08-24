import 'package:cloud_firestore/cloud_firestore.dart' hide Order;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todak_shop/core/core.dart';

final orderApiClientProvider = Provider((ref) => OrderApiClient());

class OrderApiClient {
  OrderApiClient();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<ApiResult<List<Order>>> getListOfOrderItems() async {
    try {
      final docSnapshot = await _firestore
          .collection(Constant.firebaseConstants.users)
          .doc(_auth.currentUser!.uid)
          .collection(Constant.firebaseConstants.orders)
          .get();

      final orderItems =
          docSnapshot.docs.map((doc) => Order.fromJson(doc.data())).toList();

      if (orderItems.isNullOrEmpty) {
        return ApiError(
          code: "order_not_found",
          message: "Order not found",
        );
      }

      return ApiSuccess(value: orderItems);
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

  Future<ApiResult<void>> addOrderItem({required Order orderItem}) async {
    try {
      final docRef = await _firestore
          .collection(Constant.firebaseConstants.users)
          .doc(_auth.currentUser!.uid)
          .collection(Constant.firebaseConstants.orders)
          .add(orderItem.toJson());

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

  // TODO: Stream query update order item quantity
  // Future<ApiResult<void>> updateAddress({required Address address}) async {
  //   try {
  //     await _firestore
  //         .collection(Constant.firebaseConstants.users)
  //         .doc(_auth.currentUser!.uid)
  //         .collection(Constant.firebaseConstants.orders)
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

  Future<ApiResult<void>> removeOrderItemById(String id) async {
    try {
      await _firestore
          .collection(Constant.firebaseConstants.users)
          .doc(_auth.currentUser!.uid)
          .collection(Constant.firebaseConstants.orders)
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
