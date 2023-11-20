import 'package:diet_app/system/extension/build_context_extension.dart';
import 'package:diet_app/system/localization/locale_setting.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../provider/system_provider.dart';

class LocaleDropdownButton extends ConsumerWidget {
  const LocaleDropdownButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefs = ref.read(sharedPreferencesProvider);
    final localeSetting = ref.watch(localeSettingProvider);
    final localeSettingNotifier = ref.watch(localeSettingProvider.notifier);

    return DropdownButton(
        value: localeSetting.id,
        items: LocaleSetting.getIdAndLabelMap().entries.map<DropdownMenuItem<int>>((e) {
          return DropdownMenuItem<int>(
            value: e.key,
            child: Text(e.value),
          );
        }).toList(),
        onChanged: (int? value) {
          var newLocale = LocaleSetting.getCurrentLocaleSetting(value);
          context.setLocale(newLocale.locale);
          localeSettingNotifier.setLocale(context, prefs, newLocale);
        }
    );
  }
}