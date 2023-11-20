import 'package:diet_app/system/extension/build_context_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/locale/locale_dropdown_button.dart';
import '../common/locale/tr_text.dart';

class IntroductionZeroBody extends ConsumerWidget {
  const IntroductionZeroBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: const [
        Text('言語を選択して下さい'),
        Text('Choose your language'),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: LocaleDropdownButton(),
        ),
        TrText(title: 'sample.title'),
      ],
    );
  }
}

// class IntroductionZeroBody extends ConsumerStatefulWidget {
//   const IntroductionZeroBody({Key? key}) : super(key: key);
//
//   @override
//   ConsumerState<IntroductionZeroBody> createState() => _IntroductionZeroBodyState();
// }
//
// class _IntroductionZeroBodyState extends ConsumerState<IntroductionZeroBody> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text('こんにちは'),
//         Text('言語を選択して下さい'),
//         Text('Choose your language'),
//       ],
//     );
//   }
// }

