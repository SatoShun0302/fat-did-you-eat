import 'package:diet_app/model/history.dart';
import 'package:diet_app/model/item.dart';
import 'package:diet_app/repository/local_database_repository.dart';
import 'package:diet_app/system/database/constant/database_flag.dart';

import '../provider/repository_provider.dart';

class InsertMockRecord {
  insertMock(LocalDatabaseRepository repository) async {
    List<Item> itemList = [];
    for (int i = 0; i < 10; i++) {
      final item = Item(
          groceryId: DatabaseFlag.undefinedId,
          groceryName: 'テストアイテム$i',
          day: i,
          frequency: 1,
          isDeleted: DatabaseFlag.isNotDeleted);
      itemList.add(item);
    }
    repository.insertAllItem(itemList);
    var json = await repository.fetchItemList();
    List<Item> fetchedItemList = json.map((i) => Item.fromJson(i)).toList();

    final List<History> historyList = [];
    final DateTime formattedToday = DateTime(2023, 1, 1);
    for (Item item in fetchedItemList) {
      final DateTime nextAllowedDate = formattedToday.add(Duration(days: item.frequency));
      // UnixTimeへ変換する
      final int ut = nextAllowedDate.millisecondsSinceEpoch;
      final History history = History(
          historyId: DatabaseFlag.undefinedId,
          groceryId: item.groceryId,
          consumedDate: formattedToday.millisecondsSinceEpoch,
          nextAllowedDate: ut,
          isDeleted: DatabaseFlag.isNotDeleted
      );
      historyList.add(history);
    }
    repository.insertAllHistory(historyList);
  }
}