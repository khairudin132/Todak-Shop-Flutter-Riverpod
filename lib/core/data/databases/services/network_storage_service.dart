import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todak_shop/core/core.dart';

import 'dio_config.dart';

final networkStorageServiceProvider = Provider<NetworkStorageService<Response>>(
  (ref) => NetworkStorageService<Response>(ref.read(dioServiceProvider)),
);

class NetworkStorageService<T> {
  NetworkStorageService(this.networkStorage);

  final NetworkStorageInterface<T> networkStorage;
}
