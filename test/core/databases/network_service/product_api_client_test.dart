import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todak_shop/core/core.dart';

import 'authentication_api_client_test.mocks.dart';

void main() {
  late MockNetworkStorageService mockNetwork;
  late MockDioService mockDio;

  setUp(() {
    mockNetwork = MockNetworkStorageService();
    mockDio = MockDioService();
  });

  group('apiGetCategories', () {
    const path = 'products/categories';

    test(
        'apiGetCategories returns ApiSuccess with GetCategoriesResponse data on successful request',
        () async {
      // Arrange
      when(mockNetwork.networkStorage).thenReturn(mockDio);
      when(mockDio.get(path)).thenAnswer((_) async => Response(
            requestOptions: RequestOptions(path: path),
            data: [],
            statusCode: 200,
          ));

      final client = ProductApiClient(mockNetwork);

      // Act
      final result = await client.apiGetCategories();

      // Assert
      expect(result, isA<ApiSuccess>());
      expect(result.value, isA<GetCategoriesResponse>());

      verify(mockNetwork.networkStorage).called(1);
      verify(mockDio.get(path)).called(1);
      verifyNoMoreInteractions(mockNetwork.networkStorage);
      verifyNoMoreInteractions(mockDio);
    });

    test('apiGetCategories returns ApiError when request throws DioException',
        () async {
      // Arrange
      when(mockNetwork.networkStorage).thenReturn(mockDio);
      when(mockDio.get(path)).thenThrow(DioException(
        requestOptions: RequestOptions(),
        response: null,
      ));

      final client = ProductApiClient(mockNetwork);

      // Act
      final result = await client.apiGetCategories();

      // Assert
      expect(result, isA<ApiError>());
      expect(result.value, isNull);

      verify(mockNetwork.networkStorage).called(1);
      verify(mockDio.get(path)).called(1);
      verifyNoMoreInteractions(mockNetwork.networkStorage);
      verifyNoMoreInteractions(mockDio);
    });

    test('apiGetCategories returns ApiError when request throws Exception',
        () async {
      // Arrange
      when(mockNetwork.networkStorage).thenReturn(mockDio);
      when(mockDio.get(path)).thenThrow(Exception());

      final client = ProductApiClient(mockNetwork);

      // Act
      final result = await client.apiGetCategories();

      // Assert
      expect(result, isA<ApiError>());
      expect(result.value, isNull);

      verify(mockNetwork.networkStorage).called(1);
      verify(mockDio.get(path)).called(1);
      verifyNoMoreInteractions(mockNetwork.networkStorage);
      verifyNoMoreInteractions(mockDio);
    });
  });

  group('apiGetProducts', () {
    const path = 'products';

    test(
        'apiGetProducts returns ApiSuccess with GetProductsResponse data on successful request',
        () async {
      // Arrange
      when(mockNetwork.networkStorage).thenReturn(mockDio);
      when(mockDio.get(
        path,
        queryParameters: {
          'select': 'title,thumbnail,price,rating',
        },
      )).thenAnswer((_) async => Response(
            requestOptions: RequestOptions(path: path),
            data: GetProductsResponse().toJson(),
            statusCode: 200,
          ));

      final client = ProductApiClient(mockNetwork);

      // Act
      final result = await client.apiGetProducts();

      // Assert
      expect(result, isA<ApiSuccess>());
      expect(result.value, isA<GetProductsResponse>());

      verify(mockNetwork.networkStorage).called(1);
      verify(mockDio.get(
        path,
        queryParameters: {
          'select': 'title,thumbnail,price,rating',
        },
      )).called(1);
      verifyNoMoreInteractions(mockNetwork.networkStorage);
      verifyNoMoreInteractions(mockDio);
    });

    test('apiGetProducts returns ApiError when request throws DioException',
        () async {
      // Arrange
      when(mockNetwork.networkStorage).thenReturn(mockDio);
      when(mockDio.get(
        path,
        queryParameters: {
          'select': 'title,thumbnail,price,rating',
        },
      )).thenThrow(DioException(
        requestOptions: RequestOptions(),
        response: null,
      ));

      final client = ProductApiClient(mockNetwork);

      // Act
      final result = await client.apiGetProducts();

      // Assert
      expect(result, isA<ApiError>());
      expect(result.value, isNull);

      verify(mockNetwork.networkStorage).called(1);
      verify(mockDio.get(
        path,
        queryParameters: {
          'select': 'title,thumbnail,price,rating',
        },
      )).called(1);
      verifyNoMoreInteractions(mockNetwork.networkStorage);
      verifyNoMoreInteractions(mockDio);
    });

    test('apiGetProducts returns ApiError when request throws Exception',
        () async {
      // Arrange
      when(mockNetwork.networkStorage).thenReturn(mockDio);
      when(mockDio.get(
        path,
        queryParameters: {
          'select': 'title,thumbnail,price,rating',
        },
      )).thenThrow(Exception());

      final client = ProductApiClient(mockNetwork);

      // Act
      final result = await client.apiGetProducts();

      // Assert
      expect(result, isA<ApiError>());
      expect(result.value, isNull);

      verify(mockNetwork.networkStorage).called(1);
      verify(mockDio.get(
        path,
        queryParameters: {
          'select': 'title,thumbnail,price,rating',
        },
      )).called(1);
      verifyNoMoreInteractions(mockNetwork.networkStorage);
      verifyNoMoreInteractions(mockDio);
    });
  });

  group('apiGetProductDetail', () {
    const path = 'products/1';

    test(
        'apiGetProductDetail returns ApiSuccess with Product data on successful request',
        () async {
      // Arrange
      when(mockNetwork.networkStorage).thenReturn(mockDio);
      when(mockDio.get(path)).thenAnswer((_) async => Response(
            requestOptions: RequestOptions(path: path),
            data: Product().toMap(),
            statusCode: 200,
          ));

      final client = ProductApiClient(mockNetwork);

      // Act
      final result = await client.apiGetProductDetail(id: 1);

      // Assert
      expect(result, isA<ApiSuccess>());
      expect(result.value, isA<Product>());

      verify(mockNetwork.networkStorage).called(1);
      verify(mockDio.get(path)).called(1);
      verifyNoMoreInteractions(mockNetwork.networkStorage);
      verifyNoMoreInteractions(mockDio);
    });

    test(
        'apiGetProductDetail returns ApiError when request throws DioException',
        () async {
      // Arrange
      when(mockNetwork.networkStorage).thenReturn(mockDio);
      when(mockDio.get(path)).thenThrow(DioException(
        requestOptions: RequestOptions(),
        response: null,
      ));

      final client = ProductApiClient(mockNetwork);

      // Act
      final result = await client.apiGetProductDetail(id: 1);

      // Assert
      expect(result, isA<ApiError>());
      expect(result.value, isNull);

      verify(mockNetwork.networkStorage).called(1);
      verify(mockDio.get(path)).called(1);
      verifyNoMoreInteractions(mockNetwork.networkStorage);
      verifyNoMoreInteractions(mockDio);
    });

    test('apiGetProductDetail returns ApiError when request throws Exception',
        () async {
      // Arrange
      when(mockNetwork.networkStorage).thenReturn(mockDio);
      when(mockDio.get(path)).thenThrow(Exception());

      final client = ProductApiClient(mockNetwork);

      // Act
      final result = await client.apiGetProductDetail(id: 1);

      // Assert
      expect(result, isA<ApiError>());
      expect(result.value, isNull);

      verify(mockNetwork.networkStorage).called(1);
      verify(mockDio.get(path)).called(1);
      verifyNoMoreInteractions(mockNetwork.networkStorage);
      verifyNoMoreInteractions(mockDio);
    });
  });
}
