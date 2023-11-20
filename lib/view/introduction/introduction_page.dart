import 'package:diet_app/system/shared_preferences/shared_preferences_manager.dart';
import 'package:diet_app/view/common/waiting_loading/dialog_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';
import '../../provider/notifier_provider.dart';
import '../../provider/system_provider.dart';
import '../top/top.dart';
import 'introduction.dart';

class IntroductionPage extends ConsumerStatefulWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  ConsumerState<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends ConsumerState<IntroductionPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  Future<void> _onDone(context, SharedPreferences prefs) async {
    final itemNotifier = ref.watch(itemNotifierProvider.notifier);
    DialogCircularProgressIndicator.build(context);
    await itemNotifier.updateAllItem();
    await SharedPreferencesManager.setValue(prefs, SharedPreferencesKeys.isNotFirstAppBoot, true);
    Navigator.of(context).pop();
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (_) => const Top()),
    );
  }

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (_) => const MyHomePage(
                title: '',
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    final prefs = ref.read(sharedPreferencesProvider);
    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      showSkipButton: false,
      isTopSafeArea: true,
      onSkip: () => _onIntroEnd(context),
      onDone: () => _onDone(context, prefs),
      back: const Icon(Icons.arrow_back),
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      pages: [
        Introduction.introductionZero(),
        Introduction.introductionOne(),
        Introduction.introductionTwo(),
        Introduction.introductionThree(),
        Introduction.introductionFour()
      ],
    );
  }
}
