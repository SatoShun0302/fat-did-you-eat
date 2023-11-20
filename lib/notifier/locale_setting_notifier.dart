import 'package:diet_app/system/localization/locale_setting.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../system/shared_preferences/shared_preferences_manager.dart';
import '../system/converter/datetime_util.dart';

class LocaleSettingNotifier extends AutoDisposeNotifier<LocaleSetting> {

  LocaleSetting localSetting = LocaleSetting.jaJP;

  LocaleSettingNotifier({LocaleSetting overrideLocalSetting = LocaleSetting.jaJP}) {
    localSetting = overrideLocalSetting;
  }

  @override
  LocaleSetting build() {
    return localSetting;
  }

  Future<void> setLocale(BuildContext context, SharedPreferences prefs,
      LocaleSetting newLocale) async {
    // stateを更新
    state = newLocale;
    // EasyLocalizationのlocaleを設定
    context.setLocale(newLocale.locale);
    // 設定したlocaleをSharedPreferencesに保持
    await SharedPreferencesManager.setValue(
        prefs, SharedPreferencesKeys.currentLocale, state.id);
    // DateTimeをFormatする際のlocalを設定
    DateTimeUtil.setInitializeDateFormatting(state.dateLocale);
  }

}
