import 'package:eotteom/tabs/closetanalysis/analysis.dart';
import 'package:eotteom/tabs/myoutfit/myoutfit.dart';

import 'package:eotteom/user/signin.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'tabs/home/home.dart';
import 'provider.dart';
import 'tabs/mycloset/mycloset.dart';
import 'style.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (c) => SignInPage()),
        ChangeNotifierProvider(create: (c) => Position()),
        ChangeNotifierProvider(create: (c) => EnrollClothes()),
        ChangeNotifierProvider(create: (c) => EnrollOutfit())
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
    return CupertinoTabScaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        tabBar: CupertinoTabBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.abc),
              label: '옷장분석',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart_outlined), label: '옷장'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '코디',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_add),
              label: '프로필',
            ),
          ],
        ),
        controller: CupertinoTabController(initialIndex: 2),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return CupertinoTabView(builder: (context) {
                return CupertinoPageScaffold(
                  child: MaterialApp(
                    home: Analysis(),
                  ),
                );
              });
            case 1:
              return CupertinoTabView(
                builder: (context) {
                  return CupertinoPageScaffold(
                    child: MaterialApp(
                      home: MyCloset(),
                    ),
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
                    child: Center(child: Home()),
                  );
                },
              );
            case 3:
              return CupertinoTabView(
                builder: (context) {
                  return CupertinoPageScaffold(
                    child: MaterialApp(
                      home: Outfit(),
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
                    child: Center(child: Center(child: Text('프로필 들어갈 페이지'))),
                  );
                },
              );
          }
          return const Text('null'); // 고쳐야함
        });
  }
}
