import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todak_shop/core/core.dart';

final authenticationRepoProvider = Provider((ref) => AuthenticationRepo(ref));

class AuthenticationRepo implements AuthenticationInterface {
  AuthenticationRepo(this._ref);

  final ProviderRef _ref;

  User? _user;

  @override
  User? get user => _user;

  @override
  String? get getAccountToken =>
      _ref.read(authenticationLocalStorageProvider).getAccountToken;

  @override
  DateTime? get getTokenExpirationDate => getAccountToken.isNullOrEmpty
      ? null
      : JwtDecoder.getExpirationDate(getAccountToken!);

  @override
  Future<void> setAccountToken(String token) async => await _ref
      .read(authenticationLocalStorageProvider)
      .setAccountToken(token);

  @override
  bool get getIsLoggedIn =>
      _ref.read(authenticationLocalStorageProvider).getIsLoggedIn ?? false;

  @override
  Future<void> setIsLoggedIn(bool isLoggedIn) async => await _ref
      .read(authenticationLocalStorageProvider)
      .setIsLoggedIn(isLoggedIn);

  @override
  bool get isTokenExpired => getAccountToken.isNullOrEmpty
      ? false
      : JwtDecoder.isExpired(getAccountToken!);

  @override
  Future<void> signIn(SignInRequest request) async {
    final result = await _ref.read(apiSignInProvider(request: request).future);

    result.when(
      data: (data) async {
        _user = data!;
        await setAccountToken(_user!.token!);
        await setIsLoggedIn(true);
      },
      error: (error) => throw error,
    );
  }

  @override
  Future<void> getCurrentAuthUser() async {
    final result = await _ref.read(apiGetCurrentAuthUserProvider.future);

    result.when(
      data: (data) {
        _user = data!;
      },
      error: (error) => throw error,
    );
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<void> reset() async {
    _user = null;
    await _ref.read(authenticationLocalStorageProvider).reset([
      Constant.accountTokenKey,
      Constant.isLoggedInKey,
    ]);
  }
}
