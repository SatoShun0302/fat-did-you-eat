import 'package:diet_app/system/extension/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/Headline/pageTitle.dart';

class RegistrationPage extends ConsumerWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: context.betweenTitleAndContentPadding),
          child: PageTitle(title: "pageTitle.register"),
        ),
      ],
    );
  }
}
