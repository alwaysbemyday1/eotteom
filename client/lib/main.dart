import 'package:eotteom/signin.dart';
import 'package:eotteom/tabs/home/randomOutfit.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'tabs/home/home.dart';
import 'provider.dart';
import 'tabs/closet/mycloset.dart';
import "style/style.dart";

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (c) => SignInPage()),
        ChangeNotifierProvider(create: (c) => Position()),
      ],
      child: const CupertinoApp(
        home: Eotteom(),
        theme: homeTheme,
      )));
}

class Eotteom extends StatefulWidget {
  const Eotteom({super.key});

  @override
  State<Eotteom> createState() => _EotteomState();
}

class _EotteomState extends State<Eotteom> {
  @override
  Widget build(BuildContext context) {
    return SigninPage(); // 초기 로그인 페이지로 연결되고, 로그인 페이지에서 메인으로 연결됨.

  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final phoneWidth =
        MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width;
    final phoneHeight =
        MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height;
    return CupertinoTabScaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        tabBar: CupertinoTabBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.abc),
              label: '모두의 룩',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart_outlined), label: '옷장 분석'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
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
        controller: CupertinoTabController(initialIndex: 2),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return CupertinoTabView(
                builder: (context) {
                  return CupertinoPageScaffold(
                    navigationBar: CupertinoNavigationBar(
                        trailing: SizedBox(
                      width: 50,
                      child: CupertinoButton(
                        padding: EdgeInsets.fromLTRB(30, 5, 0, 0),
                        child: Icon(CupertinoIcons.settings),
                        onPressed: () {},
                      ),
                    )),
                    child: Center(child: Text('모두의 룩')),
                  );
                },
              );
            case 1:
              return CupertinoTabView(
                builder: (context) {
                  return CupertinoPageScaffold(
                    navigationBar: CupertinoNavigationBar(
                        trailing: SizedBox(
                      width: 50,
                      child: CupertinoButton(
                        padding: EdgeInsets.fromLTRB(30, 5, 0, 0),
                        child: Icon(CupertinoIcons.settings),
                        onPressed: () {},
                      ),
                    )),
                    child: Center(child: Text('옷장 분석')),
                  );
                },
              );
            case 2:
              return CupertinoTabView(
                builder: (context) {
                  return CupertinoPageScaffold(
                    navigationBar: CupertinoNavigationBar(
                        border: Border(
                            bottom: BorderSide(color: Colors.transparent)),
                        trailing: SizedBox(
                          width: 50,
                          child: CupertinoButton(
                            padding: EdgeInsets.fromLTRB(30, 5, 0, 0),
                            child: Icon(Icons.settings),
                            onPressed: () {},
                          ),
                        )),
                    child: Center(
                        child: Home(
                            phoneHeight: phoneHeight, phoneWidth: phoneWidth)),
                  );
                },
              );
            case 3:
              return CupertinoTabView(
                builder: (context) {
                  return CupertinoPageScaffold(
                    child: MaterialApp(
                      home: MyCloset(),
                    ),
                  );
                },
              );
            case 4:
              return CupertinoTabView(
                builder: (context) {
                  return CupertinoPageScaffold(
                    navigationBar: CupertinoNavigationBar(
                        trailing: SizedBox(
                      width: 50,
                      child: CupertinoButton(
                        padding: EdgeInsets.fromLTRB(30, 5, 0, 0),
                        child: Icon(CupertinoIcons.settings),
                        onPressed: () {},
                      ),
                    )),
                    child: Center(child: Center(child: Text('옷 추가'))),
                  );
                },
              );
          }
          return const Text('null'); // 고쳐야함
        });
  }
}
