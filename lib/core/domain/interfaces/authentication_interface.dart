import 'package:todak_shop/core/core.dart';

abstract class AuthenticationInterface {
  User? get user;

  bool get getIsLoggedIn;

  String? get getAccountToken;

  DateTime? get getTokenExpirationDate;

  bool get isTokenExpired;

  Future<void> signIn(SignInRequest request);

  Future<void> setIsLoggedIn(bool isLoggedIn);

  Future<void> setAccountToken(String token);

  Future<void> getCurrentAuthUser();

  Future<void> signOut();

  Future<void> reset();
}
