import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todak_shop/core/core.dart';

final productApiClientProvider = Provider(
    (ref) => ProductApiClient(ref.read(networkStorageServiceProvider)));

class ProductApiClient {
  ProductApiClient(this._network);

  final NetworkStorageService _network;

  // Get Categories
  Future<ApiResult<GetCategoriesResponse>> apiGetCategories() async {
    try {
      final result = await _network.networkStorage.get('products/categories');

      final data = result.data == null
          ? null
          : GetCategoriesResponse(categories: result.data);

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

  // Get Products
  Future<ApiResult<GetProductsResponse>> apiGetProducts(
      {String? category}) async {
    try {
      final path =
          category == null ? 'products' : 'products/category/$category';

      final result = await _network.networkStorage.get(
        path,
        queryParameters: {
          'select': 'title,thumbnail,price,rating',
        },
      );

      final data = result.data == null
          ? null
          : GetProductsResponse.fromJson(result.data);

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

  // Get Product Detail
  Future<ApiResult<Product>> apiGetProductDetail({required int id}) async {
    try {
      final result = await _network.networkStorage.get('products/$id');

      final data = result.data == null ? null : Product.fromJson(result.data);

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
}
