import 'package:diet_app/system/extension/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'item_container.dart';

class GroceryListCard extends ConsumerWidget {
  const GroceryListCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = [
      {'groceryName': 'ハンバーガー', 'restrictFromDate': '2023年10月30日 から5日間制限中'},
      {'groceryName': 'ポテト', 'restrictFromDate': '2023年10月30日 から5日間制限中'},
      {'groceryName': 'ピザ', 'restrictFromDate': '2023年10月30日 から5日間制限中'},
      {'groceryName': 'ビール', 'restrictFromDate': '2023年10月30日 から5日間制限中'},
      {'groceryName': 'コーラ', 'restrictFromDate': '2023年10月30日 から5日間制限中'},
      {'groceryName': '揚げ物', 'restrictFromDate': '2023年10月30日 から5日間制限中'},
      {'groceryName': 'ハンバーガー', 'restrictFromDate': '2023年10月30日 から5日間制限中'},
    ];
    return Padding(
      padding: EdgeInsets.only(left: context.commonLeftPadding),
      child: Card(
        child: SizedBox(
          width: context.commonWidth,
          height: context.commonWidth * 0.8,
          child: Padding(
            padding: EdgeInsets.only(left: context.cardInnerPadding, right: context.cardInnerPadding),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for (var item in list)
                    ItemContainer(groceryName: item['groceryName']??'', restrictFromDate: item['restrictFromDate']??'')
                  // ItemContainer(
                  //   groceryName: "ハンバーガー",
                  //   restrictFromDate: "2023年10月30日 から5日間制限中",
                  // ),
                  // ItemContainer(
                  //   groceryName: "ハンバーガー",
                  //   restrictFromDate: "2023年10月30日 から5日間制限中",
                  // ),
                  // ItemContainer(
                  //   groceryName: "ハンバーガー",
                  //   restrictFromDate: "2023年10月30日 から5日間制限中",
                  // ),
                  // ItemContainer(
                  //   groceryName: "ハンバーガー",
                  //   restrictFromDate: "2023年10月30日 から5日間制限中",
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
