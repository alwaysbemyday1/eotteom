import "package:eotteom/tabs/myoutfit/outfit/outfit.dart";
import 'package:eotteom/tabs/myoutfit/outfit/outfit_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import "package:eotteom/provider.dart";
import "package:provider/provider.dart";
import "package:eotteom/tabs/myoutfit/enrolloufit/enroll.dart";


class Outfit extends StatelessWidget {
  const Outfit({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FilterProvider(),
      child: MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [const Locale('ko')],
        locale: Locale('ko'),
        home: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 40,right: 16),
            child: FloatingActionButton(
                backgroundColor: Color(0xff151515),
                child: Icon(Icons.add),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).push(
                      MaterialPageRoute(builder: (context) => OutfitEnroll()));
                }),
          ),
          backgroundColor: Colors.white,
          appBar: appbarOutfit,
          body: Cody(),
        ),
      ),
    );
  }
}
