import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todak_shop/core/core.dart';

final historyRepoProvider = Provider((ref) => HistoryRepo(ref));

class HistoryRepo implements HistoryInterface {
  HistoryRepo(this._ref);

  final ProviderRef _ref;

  var _listOfHistories = <History>[];

  List<History> get listOfHistories => _listOfHistories;

  late History _history;

  @override
  History get history => _history;

  @override
  void getListOfHistories() => _listOfHistories = _ref
          .read(historyLocalStorageProvider)
          .getListOfHistories
          ?.map((e) => History.fromJson(jsonDecode(e)))
          .toList() ??
      [];

  @override
  Future<void> addHistory(History history) async {
    _listOfHistories.add(history);

    await _updateHistoryLocal(_listOfHistories);
  }

  @override
  Future<void> clearHistory() async {
    _listOfHistories.clear();
    await _ref.read(historyLocalStorageProvider).clearHistory();
  }

  Future<void> _updateHistoryLocal(List<History> listOfHistories) async {
    final listOfHistoriesString =
        listOfHistories.map((e) => (jsonEncode(e))).toList();

    await clearHistory();
    await _ref
        .read(historyLocalStorageProvider)
        .setListOfHistories(listOfHistoriesString);
  }
}
