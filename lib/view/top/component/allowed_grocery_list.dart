import 'package:diet_app/model/item.dart';
import 'package:diet_app/system/converter/datetime_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../provider/notifier_provider.dart';
import 'allowed_grocery_list_tile.dart';

class AllowedGroceryList extends ConsumerWidget {
  const AllowedGroceryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemList = ref.watch(todaysItemNotifierProvider);
    final itemNotifier = ref.watch(todaysItemNotifierProvider.notifier);

    return itemList.when(
      data: (itemList) => Column(
        children: [
          ElevatedButton(
              onPressed: () {
                itemNotifier.insertMockItem();
              },
              child: Text("モックデータ挿入"),
          ),
          for (final item in itemList)
            AllowedGroceryListTile(
              groceryId: item.groceryId,
              groceryName: item.groceryName ?? "unknown item",
              limitContinuingDays: DateTimeUtil.getDaysDifferenceFromUnixTime(
                  DateTime.now().millisecondsSinceEpoch, item.nextAllowedDate),
            )
        ],
      ),
      error: (err, stack) => Text('Error: $err'),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
