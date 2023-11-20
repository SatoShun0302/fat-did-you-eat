import 'package:diet_app/system/extension/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/notifier_provider.dart';

class IntroductionThreeBody extends ConsumerWidget {
  const IntroductionThreeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemList = ref.watch(itemNotifierProvider);
    final itemNotifier = ref.watch(itemNotifierProvider.notifier);

    return Column(
      children: [
        Text("リストアップした飲食料品に対して、現状より少ない頻度を設定してみましょう"),
        itemList.when(
          data: (itemList) => Column(
            children: [
              for (final item in itemList) Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  elevation: 7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
                        child: Text(item.groceryName),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: context.screenWidth * 0.2,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                initialValue: item.day.toString(),
                                onChanged: (value) {
                                  if (int.tryParse(value) != null) {
                                    itemNotifier.changeDayValue(item.groceryId, int.tryParse(value)!);
                                  }
                                },
                              ),
                            ),
                            Text("日に"),
                            SizedBox(
                              width: context.screenWidth * 0.2,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                initialValue: item.frequency.toString(),
                                onChanged: (value) {
                                  if (int.tryParse(value) != null) {
                                    itemNotifier.changeFrequencyValue(item.groceryId, int.tryParse(value)!);
                                  }
                                },
                              ),
                            ),
                            Text("回"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          error: (err, stack) => Text('Error: $err'),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ],
    );
  }
}
