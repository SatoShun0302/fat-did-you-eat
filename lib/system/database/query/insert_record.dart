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
}