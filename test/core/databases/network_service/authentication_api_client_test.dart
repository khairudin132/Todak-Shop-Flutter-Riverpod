import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todak_shop/core/core.dart';
import 'package:todak_shop/core/databases/services/dio_config.dart';

import 'authentication_api_client_test.mocks.dart';

@GenerateMocks([NetworkStorageService, DioService])
void main() {
  late MockNetworkStorageService mockNetwork;
  late MockDioService mockDio;

  setUp(() {
    mockNetwork = MockNetworkStorageService();
    mockDio = MockDioService();
  });

  group('apiSignIn', () {
    test('apiSignIn returns ApiSuccess with user data on successful request',
        () async {
      // Arrange
      when(mockNetwork.networkStorage).thenReturn(mockDio);
      when(mockDio.post('auth/login', data: anyNamed('data')))
          .thenAnswer((_) async => Response(
                requestOptions: RequestOptions(path: 'auth/login'),
                data: User().toJson(),
                statusCode: 200,
              ));
      final client = AuthenticationApiClient(mockNetwork);

      // Act
      final result = await client.apiSignIn(request: SignInRequest());

      // Assert
      expect(result, isA<ApiSuccess>());
      expect(result.value, isA<User>());

      verify(mockNetwork.networkStorage).called(1);
      verify(mockDio.post('auth/login', data: anyNamed('data'))).called(1);
      verifyNoMoreInteractions(mockNetwork.networkStorage);
      verifyNoMoreInteractions(mockDio);
    });

    test('apiSignIn returns ApiError when request throws DioException',
        () async {
      // Arrange
      when(mockNetwork.networkStorage).thenReturn(mockDio);
      when(mockDio.post('auth/login', data: anyNamed('data')))
          .thenThrow(DioException(
        requestOptions: RequestOptions(),
        response: null,
      ));

      final client = AuthenticationApiClient(mockNetwork);

      // Act
      final result = await client.apiSignIn(request: SignInRequest());

      // Assert
      expect(result, isA<ApiError>());
      expect(result.value, isNull);

      verify(mockNetwork.networkStorage).called(1);
      verify(mockDio.post('auth/login', data: anyNamed('data'))).called(1);
      verifyNoMoreInteractions(mockNetwork.networkStorage);
      verifyNoMoreInteractions(mockDio);
    });

    test('apiSignIn returns ApiError when request throws Exception', () async {
      // Arrange
      when(mockNetwork.networkStorage).thenReturn(mockDio);
      when(mockDio.post('auth/login', data: anyNamed('data')))
          .thenThrow(Exception());

      final client = AuthenticationApiClient(mockNetwork);

      // Act
      final result = await client.apiSignIn(request: SignInRequest());

      // Assert
      expect(result, isA<ApiError>());
      expect(result.value, isNull);

      verify(mockNetwork.networkStorage).called(1);
      verify(mockDio.post('auth/login', data: anyNamed('data'))).called(1);
      verifyNoMoreInteractions(mockNetwork.networkStorage);
      verifyNoMoreInteractions(mockDio);
    });
  });

  group('apiGetCurrentAuthUser', () {
    test(
        'apiGetCurrentAuthUser returns ApiSuccess with user data on successful request',
        () async {
      // Arrange
      when(mockNetwork.networkStorage).thenReturn(mockDio);
      when(mockDio.get('auth/me')).thenAnswer((_) async => Response(
            requestOptions: RequestOptions(path: 'auth/me'),
            data: User().toJson(),
            statusCode: 200,
          ));

      final client = AuthenticationApiClient(mockNetwork);

      // Act
      final result = await client.apiGetCurrentAuthUser();

      // Assert
      expect(result, isA<ApiSuccess>());
      expect(result.value, isA<User>());

      verify(mockNetwork.networkStorage).called(1);
      verify(mockDio.get('auth/me')).called(1);
      verifyNoMoreInteractions(mockNetwork.networkStorage);
      verifyNoMoreInteractions(mockDio);
    });

    test(
        'apiGetCurrentAuthUser returns ApiError when request throws DioException',
        () async {
      // Arrange
      when(mockNetwork.networkStorage).thenReturn(mockDio);
      when(mockDio.post('auth/me')).thenThrow(DioException(
        requestOptions: RequestOptions(),
        response: null,
      ));

      final client = AuthenticationApiClient(mockNetwork);

      // Act
      final result = await client.apiGetCurrentAuthUser();

      // Assert
      expect(result, isA<ApiError>());
      expect(result.value, isNull);

      verify(mockNetwork.networkStorage).called(1);
      verify(mockDio.get('auth/me')).called(1);
      verifyNoMoreInteractions(mockNetwork.networkStorage);
      verifyNoMoreInteractions(mockDio);
    });

    test('apiGetCurrentAuthUser returns ApiError when request throws Exception',
        () async {
      // Arrange
      when(mockNetwork.networkStorage).thenReturn(mockDio);
      when(mockDio.post('auth/me')).thenThrow(Exception());

      final client = AuthenticationApiClient(mockNetwork);

      // Act
      final result = await client.apiGetCurrentAuthUser();

      // Assert
      expect(result, isA<ApiError>());
      expect(result.value, isNull);

      verify(mockNetwork.networkStorage).called(1);
      verify(mockDio.get('auth/me')).called(1);
      verifyNoMoreInteractions(mockNetwork.networkStorage);
      verifyNoMoreInteractions(mockDio);
    });
  });
}
