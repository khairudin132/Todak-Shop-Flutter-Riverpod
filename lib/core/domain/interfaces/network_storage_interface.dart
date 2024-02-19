abstract class NetworkStorageInterface<T> {
  bool? get isTokenExpired;

  Map<String, dynamic>? get getAuthorizationHeader;

  Future<T> get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  });

  Future<T> post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  });
}
