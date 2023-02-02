import 'package:eotteom/style.dart';
import 'package:eotteom/tabs/myoutfit/enrolloufit/season.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sizer/sizer.dart';

import 'codi_category.dart';
import 'codi_date.dart';
import 'enrollbutton.dart';
import 'name.dart';
import 'picture.dart';

class EnrollOutfit extends StatefulWidget {
  const EnrollOutfit({super.key});

  @override
  State<EnrollOutfit> createState() => _EnrollOutfitState();
}

class _EnrollOutfitState extends State<EnrollOutfit> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        navigationBar: CupertinoNavigationBar(
          backgroundColor: CupertinoColors.white,
          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
          border: null,
          leading: Material(
            color: Colors.white,
            child: IconButton(
              icon: Icon(CupertinoIcons.clear, size: 12.73),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          middle: Text('아웃핏 등록', style: enrollTitleTheme),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: 100.w,
                  height: 100.h - 103 - 90,
                  child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Container(
                          width: 100.w,
                          margin: EdgeInsets.fromLTRB(0, 32, 0, 0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Picture(),
                                Category(),
                                Container(
                                  margin: EdgeInsets.fromLTRB(16, 0, 3, 32),
                                  child: Row(
                                    children: [CodiDate(), Season()],
                                  ),
                                ),
                              ])))),
              EnrollButton(ctx: context)
            ]));
  }
}
