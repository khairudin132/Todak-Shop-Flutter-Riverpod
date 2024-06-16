import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todak_shop/core/core.dart';

final authenticationApiClientProvider =
    Provider((ref) => AuthenticationApiClient());

class AuthenticationApiClient {
  AuthenticationApiClient();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<ApiResult<void>> signUp({required SignUpRequest request}) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: request.email,
        password: request.password,
      );

      if (credential.user != null) {
        await credential.user!.updateDisplayName(request.username);

        final user = UserProfile(
          id: credential.user!.uid,
          username: request.username,
          email: request.email,
          firstName: request.firstName,
          lastName: request.lastName,
        );

        await _firestore
            .collection(Constant.firebaseConstants.users)
            .doc(credential.user!.uid)
            .set(user.toJson());

        await credential.user!.sendEmailVerification();
      }

      return ApiSuccess(value: null);
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

  // Sign In
  Future<ApiResult<UserCredential>> signIn(
      {required SignInRequest request}) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: request.email,
        password: request.password,
      );

      return ApiSuccess(value: userCredential);
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

  // Get Current User
  Future<ApiResult<UserProfile>> apiGetCurrentAuthUser() async {
    try {
      final currentUser = _auth.currentUser;
      UserProfile? user;

      if (currentUser != null) {
        final result = await _firestore
            .collection(Constant.firebaseConstants.users)
            .doc(currentUser.uid)
            .get();

        user =
            result.data() == null ? null : UserProfile.fromJson(result.data()!);
      }

      return ApiSuccess(value: user);
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

  // signout
  Future<ApiResult<void>> signOut() async {
    try {
      await _auth.signOut();
      return ApiSuccess(value: null);
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
