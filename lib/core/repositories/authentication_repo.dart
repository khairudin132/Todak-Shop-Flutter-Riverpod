import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todak_shop/core/core.dart';

final authenticationRepoProvider = Provider((ref) => AuthenticationRepo(ref));

class AuthenticationRepo implements AuthenticationInterface {
  AuthenticationRepo(this._ref);

  final ProviderRef _ref;

  AuthenticationApiClient get _apiClient =>
      _ref.read(authenticationApiClientProvider);

  AuthenticationLocalStorage get _localStorage =>
      _ref.read(authenticationLocalStorageProvider);

  User? _user;

  @override
  User? get user => _user;

  @override
  String? get getAccountToken => _localStorage.getAccountToken;

  @override
  DateTime? get getTokenExpirationDate => getAccountToken.isNullOrEmpty
      ? null
      : JwtDecoder.getExpirationDate(getAccountToken!);

  @override
  Future<void> setAccountToken(String token) async =>
      await _localStorage.setAccountToken(token);

  @override
  bool get getIsLoggedIn => _localStorage.getIsLoggedIn ?? false;

  @override
  Future<void> setIsLoggedIn(bool isLoggedIn) async =>
      await _localStorage.setIsLoggedIn(isLoggedIn);

  @override
  bool get isTokenExpired => getAccountToken.isNullOrEmpty
      ? false
      : JwtDecoder.isExpired(getAccountToken!);

  @override
  Future<void> signIn(SignInRequest request) async {
    final result = await _apiClient.apiSignIn(request: request);

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
    final result = await _apiClient.apiGetCurrentAuthUser();

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
    await _localStorage.reset([
      Constant.accountTokenKey,
      Constant.isLoggedInKey,
    ]);
  }
}
