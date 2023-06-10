import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colorTheme => Theme.of(this).colorScheme;

  Size get screenSize => MediaQuery.of(this).size;

  double get screenHeight => MediaQuery.of(this).size.height;

  double get screenWidth => MediaQuery.of(this).size.width;

  bool get isKeyboardOpen => MediaQuery.of(this).viewInsets.bottom == 0.0 ? false : true;

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnack(
      SnackBar snackBar) {
    return ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }
}