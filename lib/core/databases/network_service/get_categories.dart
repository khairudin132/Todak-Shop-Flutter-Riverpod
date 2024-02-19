import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todak_shop/core/core.dart';

part 'get_categories.g.dart';

@riverpod
Future<ApiResult<GetCategoriesResponse>> apiGetCategories(
    ApiGetCategoriesRef ref) async {
  try {
    final result = await ref
        .read(networkStorageServiceProvider)
        .networkStorage
        .get('products/categories');

    final data = result.data == null
        ? null
        : GetCategoriesResponse.fromJson(result.data);

    return ApiSuccess(value: data);
  } on DioException catch (e, s) {
    return ApiError(
      code: e.response?.statusCode,
      message: e.message,
      errors: e.response?.data['errors'],
      stackTrace: s,
    );
  } catch (e, s) {
    return ApiError(
      message: e.toString(),
      stackTrace: s,
    );
  }
}
