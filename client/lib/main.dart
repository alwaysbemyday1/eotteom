import 'package:eotteom/tabs/closetanalysis/analysis.dart';
import 'package:eotteom/tabs/myoutfit/myoutfit.dart';
import 'package:eotteom/tabs/profile/Profile.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_remix/flutter_remix.dart';
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
        ChangeNotifierProvider(create: (c) => EnrollOutfit()),
        ChangeNotifierProvider(create: (c) => UserProvider())
      ],
      child: const CupertinoApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          DefaultWidgetsLocalizations.delegate,
        ],
        supportedLocales: [const Locale('ko', 'KO')],
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
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        tabBar: CupertinoTabBar(
          height: 55,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(FlutterRemix.pie_chart_2_fill, size: 24),
              label: '옷장분석',
            ),
            BottomNavigationBarItem(
                icon: Icon(FlutterRemix.t_shirt_2_fill, size: 24), label: '옷장'),
            BottomNavigationBarItem(
                icon: Icon(FlutterRemix.home_4_fill, size: 24), label: '홈'),
            BottomNavigationBarItem(
              icon: Icon(FlutterRemix.shirt_fill, size: 24),
              label: '코디',
            ),
            BottomNavigationBarItem(
              icon: Icon(FlutterRemix.settings_5_fill, size: 24),
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
                  return Home();
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
                    child: MaterialApp(
                      home: Profile(),
                    ),
                  );
                },
              );
            default:
              return const Text('null');
          }
        });
  }
}
