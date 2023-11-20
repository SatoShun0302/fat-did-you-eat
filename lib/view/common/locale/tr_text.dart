import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../provider/system_provider.dart';

class TrText extends ConsumerWidget {
  const TrText({Key? key, required this.title, this.style}) : super(key: key);
  final String title;
  final TextStyle? style;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(localeSettingProvider);
    return Text(tr(title),
    style: style ?? const TextStyle());
  }
}
