import 'package:diet_app/view/introduction/introduction_four_body.dart';
import 'package:diet_app/view/introduction/introduction_one_body.dart';
import 'package:diet_app/view/introduction/introduction_three_body.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'introduction_zero_body.dart';
import 'introduction_two_body.dart';

class Introduction {
  static Widget _buildImage(String assetName, [double width = 400]) {
    return Image.asset('assets/$assetName', width: width, height: 250);
  }

  static const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 26.0, fontWeight: FontWeight.w700),
      //bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
      contentMargin: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      imageAlignment: Alignment.topCenter,
      bodyFlex: 2);

  static PageViewModel introductionZero() {
    return PageViewModel(
        title: '',
        bodyWidget: const IntroductionZeroBody(),
        image: _buildImage("undraw_Jogging_re_k28i.png"),
        decoration: pageDecoration,
        useScrollView: false);
  }

  static PageViewModel introductionOne() {
    return PageViewModel(
        title: '健康のためのダイエットアプリ',
        bodyWidget: const IntroductionOneBody(),
        image: _buildImage("undraw_Jogging_re_k28i.png"),
        decoration: pageDecoration);
  }

  static PageViewModel introductionTwo() {
    return PageViewModel(
        title: '分析',
        bodyWidget: const IntroductionTwoBody(),
        image: _buildImage("undraw_Hamburger_re_7sfy.png"),
        decoration: pageDecoration);
  }

  static PageViewModel introductionThree() {
    return PageViewModel(
        title: '対策',
        bodyWidget: const IntroductionThreeBody(),
        image: _buildImage("undraw_Healthy_lifestyle_re_ifwg.png"),
        decoration: pageDecoration);
  }

  static PageViewModel introductionFour() {
    return PageViewModel(
        title: '以下の内容で間違い無いですか？',
        bodyWidget: const IntroductionFourBody(),
        image: _buildImage('undraw_Diary_re_4jpc.png'),
        decoration: pageDecoration);
  }
}
