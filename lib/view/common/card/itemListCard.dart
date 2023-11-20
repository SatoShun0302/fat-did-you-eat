import 'package:diet_app/system/extension/build_context_extension.dart';
import 'package:flutter/material.dart';

class ItemListCard extends StatelessWidget {
  const ItemListCard({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: context.commonLeftPadding),
      child: Card(
        child: SizedBox(
          width: context.commonWidth,
          child: Padding(
              padding: EdgeInsets.all(context.cardInnerPadding), child: child),
        ),
      ),
    );
  }
}
