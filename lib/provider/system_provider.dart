import 'package:diet_app/notifier/locale_setting_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../system/localization/locale_setting.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((_) => throw UnimplementedError());

final localeSettingProvider = NotifierProvider.autoDispose<LocaleSettingNotifier, LocaleSetting>(() => LocaleSettingNotifier());