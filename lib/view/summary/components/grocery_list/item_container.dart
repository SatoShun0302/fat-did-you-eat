import 'package:diet_app/system/extension/build_context_extension.dart';
import 'package:flutter/material.dart';

class ItemContainer extends StatelessWidget {
  const ItemContainer({Key? key, required this.groceryName, required this.restrictFromDate}) : super(key: key);

  final String groceryName;
  final String restrictFromDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.cardInnerPadding),
      child: Container(
        //color: Colors.amberAccent,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.black12,width: 1.0)
          )
        ),
        width: context.commonWidth,
        height: context.commonWidth * 0.14,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Text(groceryName),
                ),
                Expanded(
                  child: Text(restrictFromDate),
                ),
              ],
            ),
            Icon(
              Icons.content_paste_go_rounded
            ),
          ],
        ),
      ),
    );
  }
}
