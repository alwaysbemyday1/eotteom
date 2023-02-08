import 'package:eotteom/style.dart';
import 'package:eotteom/tabs/mycloset/enrollclothes/clothes_name.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'brand.dart';
import 'category.dart';
import 'enrollbutton.dart';
import 'fit.dart';
import 'picture.dart';
import 'clothescolor.dart';
import 'size.dart';
import 'price.dart';

class ClothesEnroll extends StatefulWidget {
  ClothesEnroll({super.key, this.rootContext});
  var rootContext;

  @override
  State<ClothesEnroll> createState() => _ClothesEnrollState();
}

class _ClothesEnrollState extends State<ClothesEnroll> {
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
                  middle: Text('옷 등록', style: enrollTitleTheme),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 100.h -
                          103 -
                          90 -
                          MediaQuery.of(context).viewInsets.bottom,
                      child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0, 32, 0, 0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      margin: EdgeInsets.fromLTRB(16, 0, 0, 24),
                                      child: Text('옷 기본정보',
                                          style: enrollTitleTheme)),
                                  Picture(),
                                  Catetory(),
                                  Container(
                                    height: 8,
                                    width: double.infinity,
                                    margin: EdgeInsets.only(bottom: 26),
                                    color: Color(0xffF8F8F8),
                                  ),
                                  Container(
                                      margin: EdgeInsets.fromLTRB(16, 0, 0, 24),
                                      child: Text('옷 세부정보',
                                          style: enrollTitleTheme)),
                                  ClothesColor(),
                                  Price(),
                                  Brand(),
                                  Size(),
                                  Fit(),
                                  ClothesName()
                                ]),
                          )),
                    ),
                    Container(
                        margin: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: EnrollButton(ctx: context))
                  ],
                ))));
  }
}
