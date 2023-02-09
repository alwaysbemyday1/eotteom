import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'closet/closet_appbar.dart';
import 'closet/closet.dart';
import "package:eotteom/provider.dart";
import "package:eotteom/tabs/mycloset/enrollclothes/enroll.dart";
import 'package:flutter/cupertino.dart';

class MyCloset extends StatelessWidget {
  const MyCloset({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => ClothProvider())),
      ],
      child: MaterialApp(
        home: Scaffold(
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(right: 16, bottom: 40),
            child: FloatingActionButton(
                backgroundColor: Color(0xff151515),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).push(
                      CupertinoPageRoute(builder: (ctx) => ClothesEnroll()));
                },
                child: Icon(Icons.add)),
          ),
          appBar: appbar,
          body: Closet(),
        ),
      ),
    );
  }
}
