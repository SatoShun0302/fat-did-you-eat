import 'package:diet_app/system/extension/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/notifier_provider.dart';

class RegisterBottomSheet {
  static showRegisterBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      barrierColor: Colors.blueGrey.withOpacity(0.7),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40), //丸み具合
      ),
      isScrollControlled: true, // 画面半分よりも大きなモーダルの表示設定
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: const ModalWindow(),
        );
      },
    );
  }
}

class ModalWindow extends ConsumerStatefulWidget {
  const ModalWindow({Key? key}) : super(key: key);

  @override
  ConsumerState<ModalWindow> createState() => _ModalWindowState();
}

class _ModalWindowState extends ConsumerState<ModalWindow> {
  final FocusNode focusNode = FocusNode();
  String? groceryName;
  int? day;
  int? frequency;

  @override
  Widget build(BuildContext context) {
    final itemNotifier = ref.watch(itemNotifierProvider.notifier);
    return SizedBox(
      height: context.screenHeight * 0.35,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("名称"),
            SizedBox(
              width: context.screenWidth * 0.8,
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    groceryName = value;
                  });
                },
              ),
            ),
            Text("頻度"),
            Row(
              children: [
                SizedBox(
                  width: context.screenWidth * 0.2,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        day = int.tryParse(value);
                      });
                    },
                  ),
                ),
                Text("日に"),
                SizedBox(
                  width: context.screenWidth * 0.2,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        frequency = int.tryParse(value);
                      });
                    },
                  ),
                ),
                Text("回"),
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), //丸み具合
                      ),
                    ),
                  ),
                  onPressed: () {
                    if (groceryName == null || day == null || frequency == null) {
                      return;
                    }
                    itemNotifier.registerItem(groceryName!, day!, frequency!);
                    Navigator.of(context).pop();
                  },
                  child: const Text("登録"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
