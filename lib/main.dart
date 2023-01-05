import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home/home.dart';
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
        backgroundColor: Colors.white,
        tabBar: CupertinoTabBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.abc), label: '모두의 룩',),
            BottomNavigationBarItem(icon: Icon(Icons.bar_chart_outlined), label: '옷장 분석'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: '나의 옷장',),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.person_add), label: '옷 추가',),
          ],
        ),
        controller: CupertinoTabController(initialIndex: 2),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return CupertinoTabView(
                builder: (context) {
                  return const Center(child: Text('모두의 룩'));
                },
              );
            case 1:
              return CupertinoTabView(
                builder: (context) {
                  return const Center(child: Text('옷장 분석'));
                },
              );
            case 2:
              return CupertinoTabView(
                builder: (context) {
                  return const Home();
                },
              );
            case 3:
              return CupertinoTabView(
                builder: (context) {
                  return const Center(child: Text('나의 옷장'));
                },
              );
            case 4:
              return CupertinoTabView(
                builder: (context) {
                  return const Center(child: Text('옷 추가'));
                },
              );
          }
          return const Text('null');  // 고쳐야함
        }
    );
  }
}
