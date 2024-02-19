import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todak_shop/core/core.dart';

part 'get_products.g.dart';

@riverpod
Future<ApiResult<GetProductsResponse>> apiGetProducts(
  ApiGetProductsRef ref, {
  String? category,
}) async {
  try {
    final path = category == null ? 'products' : 'products/category/$category';

    final result =
        await ref.read(networkStorageServiceProvider).networkStorage.get(
      path,
      queryParameters: {
        'select': 'title,thumbnail,price,rating',
      },
    );

    final data =
        result.data == null ? null : GetProductsResponse.fromJson(result.data);

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
