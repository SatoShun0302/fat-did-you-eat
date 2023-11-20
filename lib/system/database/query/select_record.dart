import 'package:diet_app/system/database/constant/database_and_table_name.dart';

import '../constant/database_flag.dart';

class SelectRecord {
  static const String selectHistoryAndItemNameRecord = """
    SELECT h.history_id, h.grocery_id, h.consumed_date, h.next_allowed_date, h.is_deleted, i.grocery_name 
    FROM ${DatabaseAndTableName.historyTable} h 
    LEFT JOIN ${DatabaseAndTableName.groceryTable} i 
      ON h.grocery_id = i.grocery_id 
      AND i.is_deleted IS NOT ${DatabaseFlag.isDeleted} 
    WHERE h.is_deleted IS NOT ${DatabaseFlag.isDeleted} 
    GROUP BY h.grocery_id 
    HAVING MAX (h.history_id)
  """;
}