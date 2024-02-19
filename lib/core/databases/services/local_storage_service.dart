import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todak_shop/core/core.dart';

final localStorageServiceProvider = Provider<LocalStorageService>(
  (ref) => LocalStorageService(ref.read(sharedPreferenceServiceProvider)),
);

class LocalStorageService {
  LocalStorageService(this.localStorage);

  final LocalStorageInterface localStorage;
}
