import 'package:shared_preferences/shared_preferences.dart';

import 'setter_getter.dart';

enum SharedPreferencesKeys {
  isNotFirstAppBoot('setting_is_first_app_boot'),
  appInstallDate('info_app_install_date'),
  currentLocale('setting_current_locale');

  const SharedPreferencesKeys(this.key);
  final String key;
}

class SharedPreferencesManager {

  static Future<SharedPreferences> initInstance() async {
    return await SharedPreferences.getInstance();
  }

  static getValue(SharedPreferences prefs, SharedPreferencesKeys key) {
    switch (key) {
      case SharedPreferencesKeys.isNotFirstAppBoot:
        return SharedPreferencesSetterGetter.getBoolValue(prefs, key);
      case SharedPreferencesKeys.appInstallDate:
      case SharedPreferencesKeys.currentLocale:
        return SharedPreferencesSetterGetter.getIntValue(prefs, key);
    }
  }

  static Future<void> setValue(SharedPreferences prefs, SharedPreferencesKeys key, dynamic value) async {
    switch (key) {
      case SharedPreferencesKeys.isNotFirstAppBoot:
        await SharedPreferencesSetterGetter.setBoolValue(prefs, key, value);
        break;
      case SharedPreferencesKeys.appInstallDate:
      case SharedPreferencesKeys.currentLocale:
        await SharedPreferencesSetterGetter.setIntValue(prefs, key, value);
        break;
    }
  }
}