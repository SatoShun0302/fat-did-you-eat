import 'package:diet_app/repository/base_repository.dart';
import 'package:diet_app/system/database/query/insert_record.dart';

import '../model/history.dart';
import '../model/item.dart';
import '../system/database/constant/database_and_table_name.dart';
import '../system/database/constant/database_flag.dart';
import '../system/database/query/select_record.dart';

class LocalDatabaseRepository extends BaseRepository {
  LocalDatabaseRepository() : super();

  Future<int> insertItem(Item item) async {
    Map<String, dynamic> insertItemMap = {
      'grocery_name': item.groceryName,
      'day': item.day,
      'frequency': item.frequency,
      'is_deleted': item.isDeleted
    };
    var db = await database;
    int result =
        await db.insert(DatabaseAndTableName.groceryTable, insertItemMap);
    await db.close();
    return result;
  }

  Future<void> insertAllItem(List<Item> itemList) async {
    var db = await database;
    await db.transaction((txn) async {
      var batch = txn.batch();
      for (Item item in itemList) {
        Map<String, dynamic> insertItemMap = {
          'grocery_name': item.groceryName,
          'day': item.day,
          'frequency': item.frequency,
          'is_deleted': item.isDeleted
        };
        batch.insert(DatabaseAndTableName.groceryTable, insertItemMap);
      }
      await batch.commit(noResult: true);
    });
    await db.close();
  }

  Future<List<Map<String, dynamic>>> fetchItemList() async {
    var db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
        DatabaseAndTableName.groceryTable,
        where: 'is_deleted = ?',
        whereArgs: [DatabaseFlag.isNotDeleted]);
    await db.close();
    return maps;
  }

  Future<void> updateAllItem(List<Item> list) async {
    var db = await database;
    await db.transaction((txn) async {
      var batch = txn.batch();
      for (Item item in list) {
        batch.update(DatabaseAndTableName.groceryTable, item.toJson(),
            where: 'grocery_id = ?', whereArgs: [item.groceryId]);
      }
      await batch.commit();
    });
    await db.close();
  }

  Future<List<Map<String, dynamic>>> fetchHistoryList() async {
    var db = await database;
    // final List<Map<String, dynamic>> maps = await db.query(
    //     DatabaseAndTableName.historyTable,
    //     where: 'is_deleted = ?',
    //     whereArgs: [DatabaseFlag.isNotDeleted],
    //     groupBy: 'grocery_id',
    //     having: 'MAX(next_allowed_date)');
    final List<Map<String, dynamic>> maps =
        await db.rawQuery(SelectRecord.selectHistoryAndItemNameRecord);
    await db.close();
    return maps;
  }

  Future<int> insertHistory(History history) async {
    Map<String, dynamic> insertHistoryMap = {
      'grocery_id': history.groceryId,
      'consumed_date': history.consumedDate,
      'next_allowed_date': history.nextAllowedDate,
      'is_deleted': history.isDeleted
    };
    var db = await database;
    int result =
        await db.insert(DatabaseAndTableName.historyTable, insertHistoryMap);
    await db.close();
    return result;
  }

  Future<void> insertAllHistory(List<History> historyList) async {
    var db = await database;
    await db.transaction((txn) async {
      var batch = txn.batch();
      for (History history in historyList) {
        Map<String, dynamic> insertHistoryMap = {
          'grocery_id': history.groceryId,
          'consumed_date': history.consumedDate,
          'next_allowed_date': history.nextAllowedDate,
          'is_deleted': history.isDeleted,
          'grocery_name': history.groceryName
        };
        batch.insert(DatabaseAndTableName.historyTable, insertHistoryMap);
      }
      await batch.commit(noResult: true);
    });
    await db.close();
  }
}
