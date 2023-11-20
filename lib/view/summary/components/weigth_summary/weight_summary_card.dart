import 'package:diet_app/system/constants/color_constant.dart';
import 'package:diet_app/system/extension/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeightSummaryCard extends ConsumerWidget {
  const WeightSummaryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const titleStyle = TextStyle(
      fontSize: 12,
    );

    const weightStyle = TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold
    );

    const percentageDataStyle = TextStyle(
      fontSize: 14,
    );

    return Padding(
      padding: EdgeInsets.only(left: context.commonLeftPadding),
      child: Card(
        child: SizedBox(
          width: context.commonWidth,
          height: context.commonWidth * 0.3,
          child: Padding(
            padding: EdgeInsets.all(context.cardInnerPadding),
            child: Row(
              children: [
                SizedBox(
                  width: context.commonWidth * 0.35,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: context.commonWidth * 0.07),
                        child: Text("最新体重",
                        style: titleStyle),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("115.0",
                              style: weightStyle),
                          Text("　kg")
                        ],
                      )
                    ],
                  ),
                ),
                VerticalDivider(
                  color: ColorConstant.dividerColor,
                  width: context.commonWidth * 0.078,
                ),
                SizedBox(
                  width: context.commonWidth * 0.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: context.commonWidth * 0.02),
                        child: Text("目標比",
                        style: titleStyle),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: context.commonWidth * 0.03,
                        left: context.commonWidth * 0.04,),
                        child: Row(
                          children: [
                            Text("-2.5%",
                            style: percentageDataStyle,),
                            Text("↓"),
                            Text("目標",
                              style: percentageDataStyle,),
                            Text("64.5kg",
                              style: percentageDataStyle,),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: context.commonWidth * 0.02),
                        child: Text("前月比",
                            style: titleStyle),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: context.commonWidth * 0.04,),
                        child: Row(
                          children: [
                            Text("-2.5%",
                              style: percentageDataStyle,),
                            Text("↓"),
                            Text("目標",
                              style: percentageDataStyle,),
                            Text("64.5kg",
                              style: percentageDataStyle,),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
