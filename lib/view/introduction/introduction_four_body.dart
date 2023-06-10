import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/notifier_provider.dart';
import 'component/grocery_list_tile.dart';

class IntroductionFourBody extends ConsumerWidget {
  const IntroductionFourBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemList = ref.watch(itemNotifierProvider);
    return itemList.when(
      data: (itemList) => Column(
        children: [
          for (final item in itemList) GroceryListTile(groceryName: item.groceryName, day: item.day.toString(), frequency: item.frequency.toString())
        ],
      ),
      error: (err, stack) => Text('Error: $err'),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
