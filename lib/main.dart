import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'style/style.dart';

void main() {
  runApp( const CupertinoApp(
    home: MyApp(),
    theme: homeTheme,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.abc),
              label: '모두의 룩',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart_outlined),
                label: '옷장 분석'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '홈'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '나의 옷장',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_add),
              label: '옷 추가',
            ),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          return CupertinoTabView(builder: (BuildContext context) {
            return const CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(
                  trailing: Icon(Icons.settings),
                ),
                child: Center(child: Text('Next page')));
          });
        });
  }
}
