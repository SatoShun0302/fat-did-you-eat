import 'package:flutter/material.dart';

import '../../../common/headline/information.dart';

class OptionText extends StatelessWidget {
  const OptionText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Information(title: 'pageTitle.summary',),
      ],
    );
  }
}
