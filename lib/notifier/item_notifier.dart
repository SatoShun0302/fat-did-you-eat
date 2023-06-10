import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/item.dart';
import '../provider/repository_provider.dart';

class ItemNotifier extends AutoDisposeAsyncNotifier<List<Item>> {
  @override
  FutureOr<List<Item>> build() {
    return fetchItems();
  }

  Future<List<Item>> fetchItems() async {
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
      var item = Item(
          groceryId: 0,
          groceryName: groceryName,
          day: day,
          frequency: frequency,
          isDeleted: 0);
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
          ?.map((item) => item.groceryId == id ? item.copyWith(frequency: frequency) : item)
          .toList();
      if (list != null) {
        return list;
      }
      return [];
    });
  }

  Future<void> updateAllItem() async {
    List<Item>? list = state.value;
    if (list != null) {
      final repository = ref.read(localDatabaseRepositoryProvider);
      await repository.updateAllItem(list);
    }
    await Future.delayed(const Duration(seconds: 2));
  }
}
