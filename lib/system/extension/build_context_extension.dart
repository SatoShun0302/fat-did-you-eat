import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colorTheme => Theme.of(this).colorScheme;

  Size get screenSize => MediaQuery.of(this).size;

  double get screenHeight => MediaQuery.of(this).size.height;

  double get screenWidth => MediaQuery.of(this).size.width;

  bool get isKeyboardOpen => MediaQuery.of(this).viewInsets.bottom == 0.0 ? false : true;

  double get commonLeftPadding => MediaQuery.of(this).size.width * 0.075;

  double get commonWidth => MediaQuery.of(this).size.width * 0.85;

  double get cardInnerPadding => MediaQuery.of(this).size.width * 0.03;

  double get betweenTitleAndContentPadding => MediaQuery.of(this).size.width * 0.02;

  double get betweenContentAndTitlePadding => MediaQuery.of(this).size.width * 0.05;

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnack(
      SnackBar snackBar) {
    return ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }
}