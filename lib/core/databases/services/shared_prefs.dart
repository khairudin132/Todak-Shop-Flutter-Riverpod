import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:todak_shop/core/core.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>(
  (_) => throw UnimplementedError(),
);

final sharedPreferenceServiceProvider = Provider(
  (ref) => SharedPreferencesService(ref.read(sharedPreferencesProvider)),
);

class SharedPreferencesService implements LocalStorageInterface {
  SharedPreferencesService(this._prefs);

  final SharedPreferences _prefs;

  @override
  String? getString({required String key}) {
    final get = _prefs.getString(key);

    _log('Get', key, get);

    return get;
  }

  @override
  Future<void> setString({required String key, required String value}) async {
    await _prefs.setString(key, value);

    _log('Set', key, value);
  }

  @override
  bool? getBool({required String key}) {
    final get = _prefs.getBool(key);

    _log('Get', key, get);

    return get;
  }

  @override
  Future<void> setBool({required String key, required bool value}) async {
    await _prefs.setBool(key, value);

    _log('Set', key, value);
  }

  @override
  List<String>? getStringList({required String key}) {
    final get = _prefs.getStringList(key) ?? [];

    _log('Get', key, get);

    return get;
  }

  @override
  Future<void> setStringList({
    required String key,
    required List<String> value,
  }) async {
    await _prefs.setStringList(key, value);

    _log('Set', key, value);
  }

  @override
  Future<void> remove({required String key}) async {
    await _prefs.remove(key);

    _log('Remove', key);
  }
}

/// Keys whose values must never reach the logs.
const _sensitiveKeys = {Constant.accountTokenKey};

/// Printable form of a stored value, with sensitive values redacted.
String describePrefsValue(String key, Object? value) {
  if (value != null && _sensitiveKeys.contains(key)) return '<redacted>';
  return '$value';
}

void _log(String action, String key, [Object? value]) {
  if (!kDebugMode) return;
  final suffix = action == 'Remove'
      ? ''
      : ': ${describePrefsValue(key, value)}';
  log('$action Prefs $key$suffix');
}
