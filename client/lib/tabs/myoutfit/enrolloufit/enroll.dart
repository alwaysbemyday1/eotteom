import 'package:eotteom/style.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

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
    return Localizations(
        locale: const Locale('en', 'US'),
        delegates: const <LocalizationsDelegate<dynamic>>[
          DefaultWidgetsLocalizations.delegate,
          DefaultMaterialLocalizations.delegate,
        ],
        child: Material(
            child: CupertinoPageScaffold(
                backgroundColor: Colors.white,
                resizeToAvoidBottomInset: false,
                navigationBar: CupertinoNavigationBar(
                  backgroundColor: CupertinoColors.white,
                  padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                  border: null,
                  leading: Material(
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
                          height: 100.h - 103 - 90,
                          child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Container(
                                  margin: EdgeInsets.fromLTRB(0, 32, 0, 0),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [Picture(), Name()])))),
                      EnrollButton(ctx: context)
                    ]))));
  }
}
