import 'package:eotteom/provider.dart';
import 'package:eotteom/style.dart';
import 'package:eotteom/tabs/myoutfit/enrolloufit/season.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';

import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

import 'outfit_category.dart';
import 'outfit_date.dart';
import 'outfit_name.dart';
import 'enrollbutton.dart';

import 'outfit_open_permission.dart';
import 'picture.dart';

class OutfitEnroll extends StatefulWidget {
  const OutfitEnroll({super.key});

  @override
  State<OutfitEnroll> createState() => _OutfitEnrollState();
}

class _OutfitEnrollState extends State<OutfitEnroll> {
  @override
  void initState() {
    context.read<EnrollOutfit>().initEnrollOufit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CupertinoPageScaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          navigationBar: CupertinoNavigationBar(
            backgroundColor: CupertinoColors.white,
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
            border: null,
            leading: Material(
              color: Colors.white,
              child: IconButton(
                icon: Icon(FlutterRemix.close_fill, size: 30),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            middle: Text('코디 등록', style: enrollTitleTheme),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Picture(),
                            Codi_Name(),
                            OutfitCategory(),
                            Container(
                              margin: EdgeInsets.fromLTRB(16, 0, 16, 32),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [CodiDate(), Season()],
                              ),
                            ),
                            OutfitOpenPermission(),
                            Divider(
                              thickness: 8,
                            ),
                          ])),
                ),
                EnrollButton(ctx: context)
              ])),
    );
  }
}
