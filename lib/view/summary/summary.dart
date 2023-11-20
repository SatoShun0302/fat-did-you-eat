import 'package:diet_app/system/extension/build_context_extension.dart';
import 'package:diet_app/view/common/Headline/pageTitle.dart';
import 'package:diet_app/view/common/headline/information.dart';
import 'package:diet_app/view/common/headline/itemTitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'components/grocery_list/grocery_list_card.dart';
import 'components/tips/all_tips.dart';
import 'components/weigth_summary/weight_summary_card.dart';

class Summary extends ConsumerWidget {
  const Summary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: context.betweenTitleAndContentPadding),
          child: PageTitle(title: "pageTitle.summary"),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: context.betweenTitleAndContentPadding),
          child: Information(title: "summary.startDateInfo"),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: context.betweenContentAndTitlePadding),
          child: WeightSummaryCard(),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: context.betweenTitleAndContentPadding),
          child: ItemTitle(title: "summary.allowedGroceryTitle"),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: context.betweenContentAndTitlePadding),
          child: GroceryListCard(),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: context.betweenTitleAndContentPadding),
          child: ItemTitle(title: "summary.tipsTitle"),
        ),
        AllTips(),

      ],
    );
  }
}
