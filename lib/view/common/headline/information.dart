import 'package:diet_app/system/extension/build_context_extension.dart';
import 'package:diet_app/view/common/locale/tr_text.dart';
import 'package:flutter/material.dart';

class Information extends StatelessWidget {
  const Information({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: context.commonLeftPadding),
      child: SizedBox(
        width: context.commonWidth,
        child: TrText(title: title,
          style: const TextStyle(
              fontSize: 14,
              color: Color.fromRGBO(92, 86, 86, 1)
          ),),
      ),
    );
  }
}