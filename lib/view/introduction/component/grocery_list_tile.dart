import 'package:diet_app/system/extension/build_context_extension.dart';
import 'package:flutter/material.dart';

class GroceryListTile extends StatelessWidget {
  const GroceryListTile({Key? key, required this.groceryName, required this.day, required this.frequency}) : super(key: key);

  final String groceryName;
  final String day;
  final String frequency;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(groceryName),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: //Text('$day日に$frequency回'),
              Row(
                children: [
                  Text(day),
                  Text('日に'),
                  Text(frequency),
                  Text('回'),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}
