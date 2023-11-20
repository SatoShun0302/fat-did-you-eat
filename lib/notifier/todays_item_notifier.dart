import 'dart:async';

import 'package:diet_app/system/database/constant/database_flag.dart';
import 'package:diet_app/test_mock/insert_mock_record.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/history.dart';
import '../provider/repository_provider.dart';

class TodaysItemNotifier extends AutoDisposeAsyncNotifier<List<History>> {
  @override
  FutureOr<List<History>> build() {
    return _fetchItems();
  }

  Future<List<History>> _fetchItems() async {
    // 全アイテムと飲食履歴を取得
    final repository = ref.read(localDatabaseRepositoryProvider);
    final historyJsonList = await repository.fetchHistoryList();
    final List<History> historyList = historyJsonList.map((json) => History.fromJson(json)).toList();
    // 今日飲食可能なitemのidを抽出
    final today = DateTime.now();
    final ut = DateTime(today.year, today.month, today.day).millisecondsSinceEpoch;
    final List<History> filteredItemList = historyList.where((e) => e.nextAllowedDate <= ut).map((e) => e).toList();
    return filteredItemList;
  }

  Future<void> updateConsumedDate(int groceryId, int frequency) async {
    // 次に飲食可能な日を算出する
    DateTime today = DateTime.now();
    final DateTime formattedToday = DateTime(today.year, today.month, today.day);
    final DateTime nextAllowedDate = formattedToday.add(Duration(days: frequency));
    // UnixTimeへ変換する
    final int ut = nextAllowedDate.millisecondsSinceEpoch;
    // historyTableにレコードを追加
    final History history = History(
        historyId: DatabaseFlag.undefinedId,
        groceryId: groceryId,
        consumedDate: formattedToday.millisecondsSinceEpoch,
        nextAllowedDate: ut,
        isDeleted: DatabaseFlag.isNotDeleted
    );
    final repository = ref.read(localDatabaseRepositoryProvider);
    await repository.insertHistory(history);
    // 最新のhistoryTableを取得
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final List<History> itemList = await _fetchItems();
      return itemList;
    });
  }

  Future<void> insertMockItem() async {
    state = const AsyncValue.loading();
    final repository = ref.read(localDatabaseRepositoryProvider);
    state = await AsyncValue.guard(() async {
      final imr = InsertMockRecord();
      await imr.insertMock(repository);
      List<History> history = await _fetchItems();
      return history;
    });
  }
}
