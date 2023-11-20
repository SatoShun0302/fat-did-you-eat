import 'package:diet_app/system/extension/build_context_extension.dart';
import 'package:diet_app/view/summary/components/tips/tips_card.dart';
import 'package:flutter/material.dart';

class AllTips extends StatelessWidget {
  AllTips({Key? key}) : super(key: key);
  final List<Map<String, String>> dummyTips = List.generate(
      5, (index) => {'title': 'title$index', 'message': '1000 kcal'});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: context.commonLeftPadding),
      child: SizedBox(
        width: context.commonWidth,
        height: context.commonWidth * (0.2 * dummyTips.length),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 1行に2個のコンテナを配置
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 50.0,
              childAspectRatio: 2
            ),
            itemCount: dummyTips.length,
            itemBuilder: (context, index) {
              return TipsCard(title: "title", message: "message");
            },
        ),
      ),
    );
  }
}
