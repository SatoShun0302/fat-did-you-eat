import 'package:flutter/material.dart';

import 'component/allowed_grocery_list.dart';
import 'component/custom_sliver_app_bar.dart';
import 'component/headline.dart';

class Top extends StatelessWidget {
  const Top({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const CustomSliverAppBar(),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Headline(title: 'top.header1'),
                AllowedGroceryList(),
              ],
            ),
          ),
          // SliverList(
          //   delegate: SliverChildBuilderDelegate(
          //         (BuildContext context, int index) {
          //       return Container(
          //         color: index.isOdd ? Colors.white : Colors.black12,
          //         height: 100.0,
          //         child: Center(
          //           child: Text('$index', textScaleFactor: 5),
          //         ),
          //       );
          //     },
          //     childCount: 20,
          //   ),
          // ),
        ],
      ),
    );
  }
}
