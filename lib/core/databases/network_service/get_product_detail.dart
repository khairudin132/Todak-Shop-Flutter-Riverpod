import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todak_shop/core/core.dart';

part 'get_product_detail.g.dart';

@riverpod
Future<ApiResult<Product>> apiGetProductDetail(
  ApiGetProductDetailRef ref, {
  required int id,
}) async {
  try {
    final result = await ref
        .read(networkStorageServiceProvider)
        .networkStorage
        .get('products/$id');

    final data = result.data == null ? null : Product.fromMap(result.data);

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
