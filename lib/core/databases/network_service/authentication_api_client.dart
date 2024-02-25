import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todak_shop/core/core.dart';

final authenticationApiClientProvider = Provider(
    (ref) => AuthenticationApiClient(ref.read(networkStorageServiceProvider)));

class AuthenticationApiClient {
  AuthenticationApiClient(this._network);

  final NetworkStorageService _network;

  // Sign In
  Future<ApiResult<User>> apiSignIn({
    required SignInRequest request,
  }) async {
    try {
      final result = await _network.networkStorage.post(
        'auth/login',
        data: request.toJson(),
      );

      final data = result.data == null ? null : User.fromJson(result.data);

      return ApiSuccess(value: data);
    } on DioException catch (e, s) {
      return ApiError(
        code: e.response?.statusCode,
        message: e.message,
        errors: e.response?.data as Map<String, dynamic>?,
        stackTrace: s,
      );
    } catch (e, s) {
      return ApiError(
        message: e.toString(),
        stackTrace: s,
      );
    }
  }

  // Get Current User
  Future<ApiResult<User>> apiGetCurrentAuthUser() async {
    try {
      final result = await _network.networkStorage.get('auth/me');

      final data = result.data == null ? null : User.fromJson(result.data);

      return ApiSuccess(value: data);
    } on DioException catch (e, s) {
      return ApiError(
        code: e.response?.statusCode,
        message: e.message,
        errors: e.response?.data as Map<String, dynamic>?,
        stackTrace: s,
      );
    } catch (e, s) {
      return ApiError(
        message: e.toString(),
        stackTrace: s,
      );
    }
  }
}
