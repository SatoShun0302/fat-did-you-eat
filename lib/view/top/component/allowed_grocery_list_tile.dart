import 'package:diet_app/system/extension/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllowedGroceryListTile extends ConsumerWidget {
  const AllowedGroceryListTile(
      {Key? key,
      required this.groceryId,
      required this.groceryName,
      required this.limitContinuingDays})
      : super(key: key);
  final String groceryName;
  final int limitContinuingDays;
  final int groceryId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double tileHeight = context.screenHeight * 0.07;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: tileHeight,
        child: Material(
          elevation: 4,
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: tileHeight * 0.2),
                      child: Text(groceryName),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: tileHeight * 0.2),
                      child: Text('$limitContinuingDays日間制限継続中'),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('飲食日時を更新'),
                            content: Text(
                              '今日$groceryNameの飲食を行いましたか？\n',
                            ),
                            actions: <Widget>[
                              TextButton(
                                style: TextButton.styleFrom(
                                  textStyle:
                                      Theme.of(context).textTheme.labelLarge,
                                ),
                                child: const Text('いいえ'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  textStyle:
                                      Theme.of(context).textTheme.labelLarge,
                                ),
                                child: const Text('はい'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: const FittedBox(child: Text("更新")),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
