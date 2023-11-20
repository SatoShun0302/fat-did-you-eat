import 'package:diet_app/system/extension/build_context_extension.dart';
import 'package:flutter/material.dart';

class TipsCard extends StatelessWidget {
  const TipsCard({Key? key, required this.title, required this.message}) : super(key: key);

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: context.commonWidth * 0.2,
        child: Column(
          children: [
            Text("data"),
            Text("data"),
          ],
        ),
      ),
    );
  }
}
