import 'package:diet_app/system/database/constant/database_and_table_name.dart';

class InsertRecord {
  static const String insertItemRecord = """
    INSERT INTO ${DatabaseAndTableName.groceryTable} (
    grocery_name, day, frequency
    ) 
    VALUES ( 
    '{grocery_name}', {day}, {frequency} 
    );
  """;

  static const String insertHistoryRecord = """
    INSERT INTO ${DatabaseAndTableName.historyTable} (
      grocery_id, grocery_name, consumed_date, next_allowed_date, is_deleted
    )
  """;
}