import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:todak_shop/core/core.dart';

final sharedPreferencesProvider =
    Provider<SharedPreferences>((_) => throw UnimplementedError());

final sharedPreferenceServiceProvider = Provider(
  (ref) => SharedPreferencesService(
    ref.read(sharedPreferencesProvider),
  ),
);

class SharedPreferencesService implements LocalStorageInterface {
  SharedPreferencesService(this._prefs);

  final SharedPreferences _prefs;

  @override
  String? getString({required String key}) {
    final get = _prefs.getString(key);

    log('Get Prefs $key: $get');

    return get;
  }

  @override
  Future<void> setString({
    required String key,
    required String value,
  }) async {
    await _prefs.setString(key, value);

    log('Set Prefs $key: $value');
  }

  @override
  bool? getBool({required String key}) {
    final get = _prefs.getBool(key);

    log('Get Prefs $key: $get');

    return get;
  }

  @override
  Future<void> setBool({
    required String key,
    required bool value,
  }) async {
    await _prefs.setBool(key, value);

    log('Set Prefs $key: $value');
  }

  @override
  List<String>? getStringList({required String key}) {
    final get = _prefs.getStringList(key) ?? [];

    log('Get Prefs $key: $get');

    return get;
  }

  @override
  Future<void> setStringList({
    required String key,
    required List<String> value,
  }) async {
    await _prefs.setStringList(key, value);

    log('Set Prefs $key: $value');
  }

  @override
  Future<void> remove({required String key}) async {
    await _prefs.remove(key);

    log('Remove Prefs $key');
  }
}
