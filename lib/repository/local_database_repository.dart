import 'package:diet_app/repository/base_repository.dart';
import 'package:diet_app/system/database/query/insert_record.dart';

import '../model/item.dart';
import '../system/database/constant/database_and_table_name.dart';

class LocalDatabaseRepository extends BaseRepository {
  LocalDatabaseRepository() : super();

  Future<int> insertItem(Item item) async {
    Map<String, dynamic> insertItemMap = {
      'grocery_name' : item.groceryName,
      'day' : item.day,
      'frequency' : item.frequency,
      'is_deleted' : item.isDeleted
    };
    String sql = InsertRecord.insertItemRecord
        .replaceAll('{grocery_name}', item.groceryName)
        .replaceAll('{day}', item.day.toString())
        .replaceAll('{frequency}', item.frequency.toString());
    var db = await database;
    int result = await db.insert(DatabaseAndTableName.groceryTable, insertItemMap);
    //int result = await db.rawInsert(sql);
    return result;
  }

  Future<List<Map<String, dynamic>>> fetchItemList() async {
    var db = await database;
    final List<Map<String, dynamic>> maps = await db.query(DatabaseAndTableName.groceryTable, where: 'is_deleted = ?', whereArgs: [0]);
    return maps;
  }

  Future<void> updateAllItem(List<Item> list) async {
    var db = await database;
    var batch = db.batch();
    for (Item item in list) {
      batch.update(DatabaseAndTableName.groceryTable, item.toJson(), where: 'grocery_id = ?', whereArgs: [item.groceryId]);
    }
    await batch.commit();
  }
}
