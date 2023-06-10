import 'package:diet_app/view/introduction/component/grocery_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/notifier_provider.dart';
import 'register_bottom_sheet.dart';

class IntroductionTwoBody extends ConsumerWidget {
  const IntroductionTwoBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemList = ref.watch(itemNotifierProvider);

    return SingleChildScrollView(
      child: Column(
        children: [
          Text("太る原因となっていそうな食べ物をリストアップし、どの程度の頻度で食べているか確認してみましょう"),
          Align(
            alignment: Alignment.topRight,
            child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), //丸み具合
                    ),
                  ),
                ),
                onPressed: () => RegisterBottomSheet.showRegisterBottomSheet(context),
                child: const Text("リストを追加"),
            ),
          ),
          SizedBox(
            child: itemList.when(
                data: (itemList) => Column(
                  children: [
                    for (final item in itemList) GroceryListTile(groceryName: item.groceryName, day: item.day.toString(), frequency: item.frequency.toString())
                  ],
                ),
                error: (err, stack) => Text('Error: $err'),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
            ),
          )
        ],
      ),
    );
  }
}
