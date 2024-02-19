import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todak_shop/core/core.dart';

final historyLocalStorageProvider = Provider(
    (ref) => HistoryLocalStorage(ref.read(localStorageServiceProvider)));

class HistoryLocalStorage {
  HistoryLocalStorage(this._storage);

  final LocalStorageService _storage;

  List<String>? get getListOfHistories =>
      _storage.localStorage.getStringList(key: Constant.historyKey);

  Future<void> setListOfHistories(List<String> list) async =>
      await _storage.localStorage.setStringList(
        key: Constant.historyKey,
        value: list,
      );

  Future<void> clearHistory() async =>
      _storage.localStorage.remove(key: Constant.historyKey);
}
