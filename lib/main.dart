import 'package:diet_app/system/localization/locale_setting.dart';
import 'package:diet_app/view/top/component/custom_sliver_app_bar.dart';
import 'package:diet_app/view/top/top.dart';
import 'package:diet_app/view/top/topPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';

import 'notifier/locale_setting_notifier.dart';
import 'provider/system_provider.dart';
import 'system/shared_preferences/shared_preferences_manager.dart';
import 'view/common/locale/locale_dropdown_button.dart';
import 'view/introduction/introduction_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  var prefs = await SharedPreferencesManager.initInstance();
  // 設定中のlocaleを取得
  int currentLocaleId = SharedPreferencesManager.getValue(
      prefs, SharedPreferencesKeys.currentLocale);
  LocaleSetting localeSetting =
      LocaleSetting.getCurrentLocaleSetting(currentLocaleId);
  LocaleSettingNotifier localeSettingNotifier =
      LocaleSettingNotifier(overrideLocalSetting: localeSetting);
  runApp(
    // ProviderScope(
    //   overrides: [
    //     sharedPreferencesProvider.overrideWithValue(
    //       await SharedPreferencesManager.initInstance(),
    //     ),
    //   ],
    //   child: const MyApp(),
    // ),
    EasyLocalization(
      supportedLocales: LocaleSetting.getLocaleSettingList()
          .map((setting) => setting.locale)
          .toList(),
      saveLocale: false,
      startLocale: localeSetting.locale,
      path: 'assets/translations',
      child: ProviderScope(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(prefs),
          localeSettingProvider.overrideWith(() => localeSettingNotifier),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefs = ref.read(sharedPreferencesProvider);
    bool isNotFirstAppBoot = SharedPreferencesManager.getValue(
        prefs, SharedPreferencesKeys.isNotFirstAppBoot);

    return MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'BIZUDPGothic',
          scaffoldBackgroundColor: const Color.fromRGBO(241, 242, 246, 1),
        ),
        home: isNotFirstAppBoot
            ? const TopPage()
            : const IntroductionPage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   title: Text(widget.title),
      // ),
      body: CustomScrollView(
        slivers: [
          const CustomSliverAppBar(),
          SliverToBoxAdapter(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: LocaleDropdownButton(),
                  ),
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Container(
                  color: index.isOdd ? Colors.white : Colors.black12,
                  height: 100.0,
                  child: Center(
                    child: Text('$index', textScaleFactor: 5),
                  ),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
