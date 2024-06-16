import 'package:todak_shop/core/core.dart';

abstract class AuthenticationInterface {
  UserProfile? get user;

  String? get getUserToken;

  DateTime? get getTokenExpirationDate;

  bool get isTokenExpired;

  Future<void> signUp(SignUpRequest request);

  Future<void> signIn(SignInRequest request);

  Future<void> getCurrentAuthUser();

  Future<void> signOut();

  Future<void> reset();
}
