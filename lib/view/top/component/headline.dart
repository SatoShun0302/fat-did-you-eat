import 'package:diet_app/view/common/locale/tr_text.dart';
import 'package:flutter/material.dart';

class Headline extends StatelessWidget {
  const Headline({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
      child: TrText(title: title),
    );
  }
}
