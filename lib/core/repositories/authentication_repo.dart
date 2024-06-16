import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

  User? get _firebaseCurrentUser => FirebaseAuth.instance.currentUser;

  UserProfile? _user;

  @override
  UserProfile? get user => _user;

  String? _getUserToken;

  @override
  String? get getUserToken => _getUserToken;

  DateTime? _getTokenExpirationDate;

  @override
  DateTime? get getTokenExpirationDate => _getTokenExpirationDate;

  @override
  bool get isTokenExpired {
    if (_getTokenExpirationDate == null) {
      return true;
    }
    return _getTokenExpirationDate!.isBefore(DateTime.now().toUtc());
  }

  @override
  Future<void> signUp(SignUpRequest request) async {
    final result = await _apiClient.signUp(request: request);

    result.when(
      data: (data) {},
      error: (error) => throw error,
    );
  }

  @override
  Future<void> signIn(SignInRequest request) async {
    final result = await _apiClient.signIn(request: request);

    result.when(
      data: (data) async {
        final token =
            await data!.user!.getIdTokenResult().then((value) => value);

        _getUserToken = token.token;

        _getTokenExpirationDate = token.expirationTime;
      },
      error: (error) => throw error,
    );
  }

  @override
  Future<void> getCurrentAuthUser() async {
    final result = await _apiClient.apiGetCurrentAuthUser();

    result.when(
      data: (data) => _user = data,
      error: (error) => throw error,
    );
  }

  @override
  Future<void> signOut() async {
    final result = await _apiClient.signOut();

    result.when(
      data: (data) {
        _user = null;
      },
      error: (error) => throw error,
    );
  }

  @override
  Future<void> reset() async {
    _user = null;
    await _localStorage.reset([
      Constant.isLoggedInKey,
    ]);
  }
}
