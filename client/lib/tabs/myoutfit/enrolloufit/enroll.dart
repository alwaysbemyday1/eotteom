import 'package:eotteom/provider.dart';
import 'package:eotteom/style.dart';
import 'package:eotteom/tabs/myoutfit/enrolloufit/season.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            middle: Text('코디 등록', style: enrollTitleTheme),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: 100.w,
                    height: 100.h -
                        103 -
                        90 -
                        MediaQuery.of(context).viewInsets.bottom,
                    child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Container(
                            width: 100.w,
                            margin: EdgeInsets.fromLTRB(0, 32, 0, 0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10),
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
                                ])))),
                Container(
                    margin: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: EnrollButton(ctx: context))
              ])),
    );
  }
}
