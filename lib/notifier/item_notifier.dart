import 'dart:async';

import 'package:diet_app/system/database/constant/database_flag.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/history.dart';
import '../model/item.dart';
import '../provider/repository_provider.dart';

class ItemNotifier extends AutoDisposeAsyncNotifier<List<Item>> {
  @override
  FutureOr<List<Item>> build() {
    return _fetchItems();
  }

  Future<List<Item>> _fetchItems() async {
    List<Item> itemList = [];
    final repository = ref.read(localDatabaseRepositoryProvider);
    var jsonList = await repository.fetchItemList();
    for (Map<String, dynamic> item in jsonList) {
      itemList.add(Item.fromJson(item));
    }
    return itemList;
  }

  Future<void> registerItem(String groceryName, int day, int frequency) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(localDatabaseRepositoryProvider);
      final item = Item(
          groceryId: DatabaseFlag.undefinedId,
          groceryName: groceryName,
          day: day,
          frequency: frequency,
          isDeleted: DatabaseFlag.isNotDeleted);
      int result = await repository.insertItem(item);
      List<Item> list = [];
      if (result != 0) {
        list = [...?state.value, item];
      } else {
        list = [...?state.value];
      }
      return list;
    });
  }

  Future<void> changeDayValue(int id, int day) async {
    state = await AsyncValue.guard(() async {
      List<Item>? list = state.value
          ?.map((item) => item.groceryId == id ? item.copyWith(day: day) : item)
          .toList();
      if (list != null) {
        return list;
      }
      return [];
    });
  }

  Future<void> changeFrequencyValue(int id, int frequency) async {
    state = await AsyncValue.guard(() async {
      List<Item>? list = state.value
          ?.map((item) =>
              item.groceryId == id ? item.copyWith(frequency: frequency) : item)
          .toList();
      if (list != null) {
        return list;
      }
      return [];
    });
  }

  Future<void> updateAllItem() async {
    List<Item>? list = state.value;
    if (list == null || list.isEmpty) return;
    final repository = ref.read(localDatabaseRepositoryProvider);
    // Itemテーブルを更新
    await repository.updateAllItem(list);
    // Historyテーブルを更新
    final List<History> historyList = [];
    for (Item item in list) {
      // 次に飲食可能な日を算出する
      DateTime today = DateTime.now();
      final DateTime formattedToday = DateTime(today.year, today.month, today.day);
      final DateTime nextAllowedDate = formattedToday.add(Duration(days: item.frequency));
      // UnixTimeへ変換する
      final int ut = nextAllowedDate.millisecondsSinceEpoch;
      final History history = History(
          historyId: DatabaseFlag.undefinedId,
          groceryId: item.groceryId,
          groceryName: item.groceryName,
          consumedDate: formattedToday.millisecondsSinceEpoch,
          nextAllowedDate: ut,
          isDeleted: DatabaseFlag.isNotDeleted
      );
      historyList.add(history);
    }
    // historyTableにレコードを追加
    repository.insertAllHistory(historyList);
    await Future.delayed(const Duration(seconds: 2));
  }
}
