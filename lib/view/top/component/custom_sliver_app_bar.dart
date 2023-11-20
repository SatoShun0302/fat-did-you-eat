import 'dart:ui';

import 'package:diet_app/system/extension/build_context_extension.dart';
import 'package:diet_app/system/converter/datetime_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../provider/system_provider.dart';

class CustomSliverAppBar extends ConsumerWidget {
  const CustomSliverAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localSetting = ref.watch(localeSettingProvider);
    return SliverAppBar(
      expandedHeight: context.screenHeight * 0.27,
      collapsedHeight: context.screenHeight * 0.13,
      backgroundColor: Colors.white.withOpacity(0.1),
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        collapseMode: CollapseMode.pin,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Builder(builder: (context) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 0.7,
                    sigmaY: 0.7,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.4),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    height: context.screenHeight * 0.1,
                    width: context.screenWidth * 0.6,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            DateTimeUtil.getStringYearMonthDay(
                                localSetting.dateFormat,
                                localSetting.dateLocale),
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Builder(builder: (context) {
                            return Text(
                              '生活改善開始120日目',
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                  fontSize: context.screenHeight * 0.015),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        //title: Text("data"),
        background: Image.asset(
          'assets/sliver_background.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
