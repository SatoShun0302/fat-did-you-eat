import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../system/database/constant/database_and_table_name.dart';
import '../system/database/query/create_table.dart';

class BaseRepository {
  late Database _database;

  Future<Database> get database async {
    await init();
    return _database;
  }

  init({int version = 1}) async {
    _database = await openDatabase(
      join(await getDatabasesPath(), DatabaseAndTableName.database),
      onCreate: (db, version) {
        db.execute(
          CreateTable.createItemTable
        );
        db.execute(
          CreateTable.createHistoryTable
        );
      },
      version: version,
    );
  }
}
