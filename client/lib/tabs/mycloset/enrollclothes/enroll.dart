import 'package:eotteom/provider.dart';
import 'package:eotteom/style.dart';
import 'package:eotteom/tabs/mycloset/enrollclothes/clothes_name.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';
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
  void initState() {
    context.read<EnrollClothes>().initEnrollClothes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
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
                middle: Text('옷 등록', style: enrollTitleTheme),
              ),
              child: Container(
                width: 100.w,
                height: 100.h - 103 - MediaQuery.of(context).viewInsets.bottom,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 100.w,
                      height: 100.h -
                          90 -
                          103 -
                          MediaQuery.of(context).viewInsets.bottom,
                      child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    margin: EdgeInsets.fromLTRB(16, 27, 0, 24),
                                    child:
                                        Text('기본정보', style: enrollTitleTheme)),
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
                                    child:
                                        Text('세부정보', style: enrollTitleTheme)),
                                ClothesColor(),
                                Price(),
                                Brand(),
                                Size(),
                                Fit(),
                                ClothesName()
                              ])),
                    ),
                    EnrollButton(ctx: context)
                  ],
                ),
              )));
    });
  }
}
