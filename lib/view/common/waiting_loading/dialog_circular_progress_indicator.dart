import 'package:flutter/material.dart';

class DialogCircularProgressIndicator {
  static build(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                CircularProgressIndicator(),
                SizedBox(height: 20),
                Text("登録中..."),
              ],
            ),
          );
        });
  }
}
