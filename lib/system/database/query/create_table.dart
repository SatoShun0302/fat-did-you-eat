import 'package:diet_app/system/database/constant/database_and_table_name.dart';

class CreateTable {
  static const String createItemTable = """
    CREATE TABLE ${DatabaseAndTableName.groceryTable} (
    grocery_id INTEGER PRIMARY KEY AUTOINCREMENT,
    grocery_name TEXT NOT NULL,
    day INTEGER NOT NULL,
    frequency INTEGER NOT NULL,
    is_deleted INTEGER NOT NULL
    )
  """;

  static const String createHistoryTable = """
      CREATE TABLE ${DatabaseAndTableName.historyTable} (
      history_id INTEGER PRIMARY KEY AUTOINCREMENT,
      grocery_id INTEGER,
      consumed_date INTEGER NOT NULL,
      next_allowed_date INTEGER NOT NULL,
      is_deleted INTEGER NOT NULL
      )
  """;
}
