import 'package:diet_app/system/shared_preferences/shared_preferences_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../converter/datetime_util.dart';

enum LocaleSetting {
  // 0はSharedPreferences.getIntValue()において値が取得できなかった場合のデフォルト値であるため使用しない
  enUS(id: 1, langCode: 'en', countryCode: 'US', dateLocale: 'en_US', dateFormat: 'MM/dd/yyyy(E)' , label: 'English(US)'),
  jaJP(id: 2, langCode: 'ja', countryCode: 'JP', dateLocale: 'ja_JP', dateFormat: 'yyyy年MM月dd日(E)' ,  label: '日本語');

  const LocaleSetting({
    required this.id,
    required this.langCode,
    required this.countryCode,
    required this.dateLocale,
    required this.dateFormat,
    required this.label
  });

  final int id;
  final String langCode;
  final String countryCode;
  final String dateLocale;
  final String dateFormat;
  final String label;

  Locale get locale => Locale(langCode, countryCode);

  static LocaleSetting getCurrentLocaleSetting(int? id) =>  id == null || id == 0
      ? LocaleSetting.jaJP
      : LocaleSetting.values.firstWhere((v) => v.id == id);

  static List<LocaleSetting> getLocaleSettingList() {
    return LocaleSetting.values;
  }

  static Map<int, String> getIdAndLabelMap() {
    Map<int, String> map = {};
    for (var e in LocaleSetting.values) {
      map[e.id] = e.label;
    }
    //LocaleSetting.values.map((e) => map[e.id] = e.label);
    return map;
  }
}