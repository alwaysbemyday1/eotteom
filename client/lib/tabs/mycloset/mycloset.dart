import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'closet/closet_appbar.dart';
import 'closet/closet.dart';
import "package:eotteom/provider.dart";

class MyCloset extends StatelessWidget {
  const MyCloset({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => OutfitProvider())),
      ],
      child: MaterialApp(
        home: Scaffold(
          appBar: appbar,
          body: Closet(),
        ),
      ),
    );
  }
}