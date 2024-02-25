import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:todak_shop/core/core.dart';

final dioServiceProvider =
    Provider((ref) => DioService(ref.read(authenticationRepoProvider)));

class DioService implements NetworkStorageInterface<Response> {
  DioService(this._authentication) {
    _initialiseDioConfiguration();
  }

  final AuthenticationInterface _authentication;

  late Dio dio;

  @override
  bool? get isTokenExpired => _authentication.isTokenExpired;

  Options get requestOptions => Options(
        validateStatus: (_) => true,
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
        headers: getAuthorizationHeader,
      );

  @override
  Map<String, dynamic>? get getAuthorizationHeader {
    var headers = <String, dynamic>{};

    final token = _authentication.getAccountToken;
    if (!token.isNullOrEmpty) {
      headers['Authorization'] = 'Bearer $token';
    }

    return headers;
  }

  void _initialiseDioConfiguration() {
    final options = BaseOptions(
      baseUrl: Constant.baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {},
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
    );

    dio = Dio(options);

    dio.interceptors
      // ..add(
      //   TalkerDioLogger(
      //     settings: const TalkerDioLoggerSettings(
      //       printResponseData: true,
      //       printResponseHeaders: true,
      //       printResponseMessage: true,
      //       printRequestData: true,
      //       printRequestHeaders: true,
      //     ),
      //   ),
      // )
      ..add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            if (isTokenExpired == true) {
              return handler.reject(
                DioException.requestCancelled(
                  requestOptions: options,
                  reason: 'Token expired',
                ),
              );
            }
            return handler.next(options);
          },
          onResponse: (response, handler) {
            if (response.statusCode == 200) {
              return handler.next(response);
            }
            // else {
            // final error = switch (response.statusCode) {
            //   400 => DioException(
            //       requestOptions: response.requestOptions,
            //       response: response,
            //       message: "Bad request",
            //     ),
            //   401 => DioException(
            //       requestOptions: response.requestOptions,
            //       response: response,
            //       message: "Unauthorized",
            //     ),
            //   403 => DioException(
            //       requestOptions: response.requestOptions,
            //       response: response,
            //       message: "Forbidden",
            //     ),
            //   404 => DioException(
            //       requestOptions: response.requestOptions,
            //       response: response,
            //       message: "Not found",
            //     ),
            //   408 => DioException(
            //       requestOptions: response.requestOptions,
            //       response: response,
            //       message: "Request timeout",
            //     ),
            //   429 => DioException(
            //       requestOptions: response.requestOptions,
            //       response: response,
            //       message: "Too many requests",
            //     ),
            //   500 => DioException(
            //       requestOptions: response.requestOptions,
            //       response: response,
            //       message: "Internal server error",
            //     ),
            //   502 => DioException(
            //       requestOptions: response.requestOptions,
            //       response: response,
            //       message: "Bad gateway",
            //     ),
            //   503 => DioException(
            //       requestOptions: response.requestOptions,
            //       response: response,
            //       message: "Service unavailable",
            //     ),
            //   504 => DioException(
            //       requestOptions: response.requestOptions,
            //       response: response,
            //       message: "Gateway timeout",
            //     ),
            //   _ => DioException(
            //       requestOptions: response.requestOptions,
            //       response: response,
            //       message:
            //           "Received unexpected status code: ${response.statusCode}",
            //     ),
            // };
            // }
            return handler.reject(
              DioException(
                requestOptions: response.requestOptions,
                response: response,
              ),
            );
          },
          onError: (DioException e, handler) {
            // Handle token expiration errors specifically
            if (isTokenExpired==true) {
              return handler.reject(
                DioException.requestCancelled(
                  requestOptions: e.requestOptions,
                  reason: 'Token expired',
                ),
              );
            }
            return handler.reject(e);
          },
        ),
      )
      ..add(
        LogInterceptor(
          requestHeader: true,
          responseHeader: true,
          requestBody: true,
          responseBody: true,
          error: true,
          logPrint: (object) => debugPrint(object.toString()),
        ),
      );
    // ..add(
    //   TalkerDioLogger(
    //     settings: const TalkerDioLoggerSettings(
    //       printResponseData: true,
    //       printResponseHeaders: true,
    //       printResponseMessage: true,
    //       printRequestData: true,
    //       printRequestHeaders: true,
    //     ),
    //   ),
    // );
  }

  @override
  Future<Response> get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    var response = await dio.get(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
    );

    return response;
  }

  @override
  Future<Response> post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
    );

    return response;
  }
}

// DioException _createApiResult(DioException error) {
//   switch (error.type) {
//     case DioExceptionType.connectionTimeout:
//       return DioException(
//         requestOptions: error.requestOptions,
//         response: error.response,
//         message: "Connection timed out",
//       );

//     case DioExceptionType.sendTimeout:
//       return DioException(
//         requestOptions: error.requestOptions,
//         response: error.response,
//         message: "Send timed out",
//       );

//     case DioExceptionType.receiveTimeout:
//       return DioException(
//         requestOptions: error.requestOptions,
//         response: error.response,
//         message: "Receive timed out",
//       );

//     case DioExceptionType.badCertificate:
//       return DioException(
//         requestOptions: error.requestOptions,
//         response: error.response,
//         message: "Bad SSL certificates",
//       );

//     case DioExceptionType.badResponse:
//       switch (error.response!.statusCode) {
//         case 400:
//           return DioException(
//             requestOptions: error.requestOptions,
//             response: error.response,
//             message: "Bad request",
//           );
//         case 401:
//           return DioException(
//             requestOptions: error.requestOptions,
//             response: error.response,
//             message: "Permission denied",
//           );
//         case 500:
//           return DioException(
//             requestOptions: error.requestOptions,
//             response: error.response,
//             message: "Server internal error",
//           );
//       }
//       return DioException(
//         requestOptions: error.requestOptions,
//         response: error.response,
//         message: "Server bad response",
//       );

//     case DioExceptionType.cancel:
//       return DioException(
//         requestOptions: error.requestOptions,
//         response: error.response,
//         message: "Server canceled it",
//       );

//     case DioExceptionType.connectionError:
//       return DioException(
//         requestOptions: error.requestOptions,
//         response: error.response,
//         message: "Connection error",
//       );

//     case DioExceptionType.unknown:
//       return DioException(
//         requestOptions: error.requestOptions,
//         response: error.response,
//         message: "Unknown error",
//       );
//   }
// }
