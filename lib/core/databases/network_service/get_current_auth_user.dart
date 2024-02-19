import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todak_shop/core/core.dart';

part 'get_current_auth_user.g.dart';

@riverpod
Future<ApiResult<User>> apiGetCurrentAuthUser(
    ApiGetCurrentAuthUserRef ref) async {
  try {
    final result = await ref
        .read(networkStorageServiceProvider)
        .networkStorage
        .get('auth/me');

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
