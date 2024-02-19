import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todak_shop/core/core.dart';

part 'sign_in.g.dart';

@riverpod
Future<ApiResult<User>> apiSignIn(
  ApiSignInRef ref, {
  required SignInRequest request,
}) async {
  try {
    final result =
        await ref.read(networkStorageServiceProvider).networkStorage.post(
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
