import 'package:diet_app/view/common/Headline/pageTitle.dart';
import 'package:diet_app/view/summary/summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopPage extends ConsumerWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int _selectedIndex = 0;
    const TextStyle optionStyle =
        TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
    const List<Widget> _widgetOptions = <Widget>[
      Summary(),
      Text(
        'Index 1: カレンダー画面',
        style: optionStyle,
      ),
      Text(
        'Index 2: グラフ画面',
        style: optionStyle,
      ),
    ];

    void _onItemTapped(int index) {
      print("on tap");
    }

    return Scaffold(
      //backgroundColor: const Color.fromRGBO(241, 242, 246, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        animationDuration: const Duration(seconds: 10),
        destinations: const <Widget>[
          NavigationDestination(
              icon: Icon(Icons.explore), label: 'ver A', tooltip: "tooltip1"),
          NavigationDestination(
              icon: Icon(Icons.commute), label: 'ver B', tooltip: "tooltip2"),
          NavigationDestination(
            icon: Icon(Icons.bookmark_border),
            label: 'ver C',
            tooltip: "tooltip3",
            selectedIcon: Icon(Icons.bookmark),
          ),
          NavigationDestination(
              icon: Icon(Icons.circle), label: 'ver D', tooltip: "tooltip4"),
          NavigationDestination(
              icon: Icon(Icons.train), label: 'ver E', tooltip: "tooltip5"),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(icon: Icon(Icons.mode_edit), label: '入力',),
      //     BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: 'カレンダー',),
      //     BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'グラフ',),
      //   ],
      //   currentIndex: _selectedIndex, //現在のアクティブインデックスを表示
      //   backgroundColor: Colors.grey[100],//ボトムバーの背景色
      //   selectedItemColor: Colors.amber[900], //Icon選択時にIcon色を指定
      //   onTap: _onItemTapped,//Iconタップ時のイベント
      // ),
    );
  }
}
