import 'package:todak_shop/core/domain/domain.dart';

abstract class HistoryInterface {
  History get history;

  void getListOfHistories();

  Future<void> addHistory(History product);

  Future<void> clearHistory();
}
