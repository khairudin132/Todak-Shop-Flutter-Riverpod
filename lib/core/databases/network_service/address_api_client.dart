import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todak_shop/core/core.dart';

final addressApiClientProvider = Provider((ref) => AddressApiClient());

class AddressApiClient {
  AddressApiClient();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<ApiResult<Address>> getAddressById(String id) async {
    try {
      final docSnapshot = await _firestore
          .collection(Constant.firebaseConstants.users)
          .doc(_auth.currentUser!.uid)
          .collection(Constant.firebaseConstants.addresses)
          .doc(id)
          .get();

      final address = docSnapshot.data();

      if (address == null) {
        return ApiError(
          code: "address_not_found",
          message: "Address not found",
        );
      }

      return ApiSuccess(value: Address.fromJson(address));
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

  Future<ApiResult<List<Address>>> getListOfAddresses() async {
    try {
      final docSnapshot = await _firestore
          .collection(Constant.firebaseConstants.users)
          .doc(_auth.currentUser!.uid)
          .collection(Constant.firebaseConstants.addresses)
          .get();

      final addresses =
          docSnapshot.docs.map((doc) => Address.fromJson(doc.data())).toList();

      if (addresses.isNullOrEmpty) {
        return ApiError(
          code: "address_not_found",
          message: "Address not found",
        );
      }

      return ApiSuccess(value: addresses);
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

  Future<ApiResult<void>> addAddress({required Address address}) async {
    try {
      final docRef = await _firestore
          .collection(Constant.firebaseConstants.users)
          .doc(_auth.currentUser!.uid)
          .collection(Constant.firebaseConstants.addresses)
          .add(address.toJson());

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

  Future<ApiResult<void>> updateAddress({required Address address}) async {
    try {
      await _firestore
          .collection(Constant.firebaseConstants.users)
          .doc(_auth.currentUser!.uid)
          .collection(Constant.firebaseConstants.addresses)
          .doc(address.id)
          .update(address.toJson());

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

  Future<ApiResult<void>> removeAddressById(String id) async {
    try {
      await _firestore
          .collection(Constant.firebaseConstants.users)
          .doc(_auth.currentUser!.uid)
          .collection(Constant.firebaseConstants.addresses)
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

  Future<ApiResult<void>> setDefaultAddress(String id) async {
    try {
      final getPreviousDefaultAddress = await _firestore
          .collection(Constant.firebaseConstants.users)
          .doc(_auth.currentUser!.uid)
          .collection(Constant.firebaseConstants.addresses)
          .where("isDefault", isEqualTo: true)
          .get();

      if (getPreviousDefaultAddress.docs.isNotEmpty) {
        await _firestore
            .collection(Constant.firebaseConstants.users)
            .doc(_auth.currentUser!.uid)
            .collection(Constant.firebaseConstants.addresses)
            .doc(getPreviousDefaultAddress.docs.first.id)
            .update({"isDefault": false});
      }

      await _firestore
          .collection(Constant.firebaseConstants.users)
          .doc(_auth.currentUser!.uid)
          .collection(Constant.firebaseConstants.addresses)
          .doc(id)
          .update({"isDefault": true});

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

  Future<ApiResult<Address>> getDefaultAddress() async {
    try {
      final docSnapshot = await _firestore
          .collection(Constant.firebaseConstants.users)
          .doc(_auth.currentUser!.uid)
          .collection(Constant.firebaseConstants.addresses)
          .where("isDefault", isEqualTo: true)
          .get();

      final address = docSnapshot.docs
          .map((doc) => Address.fromJson(doc.data()))
          .firstOrNull;

      if (address == null) {
        return ApiError(
          code: "address_not_found",
          message: "Address not found",
        );
      }

      return ApiSuccess(value: address);
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
