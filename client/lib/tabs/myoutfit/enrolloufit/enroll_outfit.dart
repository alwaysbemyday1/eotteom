import 'package:eotteom/provider.dart';
import 'package:eotteom/style.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';

import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

import 'clothes_outfit.dart';
import 'date_outfit.dart';
import 'name_outfit.dart';
import 'enrollbutton_outfit.dart';

import 'permission_outfit.dart';
import 'picture_outfit.dart';

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
          middle: Text('코디 등록', style: enrollTitleTheme),
        ),
        child: SafeArea(
            top: false,
            bottom: false,
            child: Container(
                padding: EdgeInsets.zero,
                width: 100.w,
                height: 100.h -
                    context.read<EnrollClothes>().start -
                    MediaQuery.of(context).viewInsets.bottom,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 100.w,
                        height: 100.h -
                            92 -
                            context.read<EnrollClothes>().start -
                            MediaQuery.of(context).viewInsets.bottom,
                        child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Picture(),
                                  Codi_Name(),
                                  // Category
                                  Container(
                                      width: 100.w - 32,
                                      margin:
                                          EdgeInsets.fromLTRB(16, 0, 16, 27),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    0, 0, 0, 13),
                                                child: Text(
                                                  '코디 카테고리',
                                                  style: enrollTitleTheme2,
                                                )),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 100.w - 32,
                                                height: 44,
                                                margin:
                                                    EdgeInsets.only(right: 11),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color:
                                                            Color(0xffD9D9D9),
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: CategoryPopupMenu())
                                          ])),
                                  CodiDate(),
                                  OutfitOpenPermission(),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 14),
                                    child: Divider(
                                      thickness: 8,
                                    ),
                                  ),
                                  ClothesOufit()
                                ])),
                      ),
                      EnrollButton(ctx: context)
                    ]))),
      ));
    });
  }
}

class CategoryPopupMenu extends StatefulWidget {
  CategoryPopupMenu({super.key});

  @override
  State<CategoryPopupMenu> createState() => _CategoryPopupMenuState();
}

class _CategoryPopupMenuState extends State<CategoryPopupMenu> {
  List<PopupMenuEntry<String>> getList() {
    List<PopupMenuEntry<String>> childs = [];
    childs.add(PopupMenuItem<String>(
      // 뭐 선택 됐는지
      height: 42,
      value: context.read<EnrollOutfit>().category,
      child: Container(
          width: 100.w - 32,
          alignment: Alignment.centerLeft,
          child: context.read<EnrollOutfit>().category != ''
              ? Text(context.read<EnrollOutfit>().category,
                  style: PopUpMenuSelectedTheme)
              : Text('스타일을 선택해주세요', style: PopUpMenuChildTheme)),
    ));
    childs.add(PopupMenuDivider(height: 0));

    for (int i = 0; i < 4; i++) {
      // 선택할 수 있는 리스트
      if (context.read<EnrollOutfit>().category !=
          context.read<EnrollOutfit>().categoryList[i]) {
        childs.add(PopupMenuItem<String>(
          value: context.read<EnrollOutfit>().categoryList[i],
          height: 44,
          child: Container(
              width: 100.w - 32,
              alignment: Alignment.centerLeft,
              child: Text(context.read<EnrollOutfit>().categoryList[i],
                  style: PopUpMenuSelectedTheme)),
        ));
      }
    }
    return childs;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w - 32,
      child: PopupMenuButton(
          // padding: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Color(0xffD9D9D9), width: 1),
              borderRadius: BorderRadius.circular(5)),
          offset: Offset(0, -20),
          constraints:
              BoxConstraints(maxWidth: 100.w - 32, minWidth: 100.w - 32),
          child: Container(
              width: 100.w - 32,
              padding: EdgeInsets.only(left: 16, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  context.watch<EnrollOutfit>().category != ''
                      ? Text(context.read<EnrollOutfit>().category,
                          style: PopUpMenuSelectedTheme)
                      : Text('스타일을 선택해주세요', style: PopUpMenuChildTheme),
                  Icon(FlutterRemix.arrow_down_s_line, size: 22)
                ],
              )),
          onSelected: (String selected) {
            context.read<EnrollOutfit>().changeCategory(selected);
          },
          itemBuilder: (BuildContext context) => getList()),
    );
  }
}

class SeasonPopupMenu extends StatefulWidget {
  SeasonPopupMenu({super.key});

  @override
  State<SeasonPopupMenu> createState() => _SeasonPopupMenuState();
}

class _SeasonPopupMenuState extends State<SeasonPopupMenu> {
  List<PopupMenuEntry<String>> getList() {
    List<PopupMenuEntry<String>> childs = [];
    childs.add(PopupMenuItem<String>(
      // 뭐 선택 됐는지
      height: 42,
      value: context.read<EnrollOutfit>().season,
      child: Container(
          width: (100.w - 32 - 40) / 3 + 1,
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(context.read<EnrollOutfit>().season, style: basicTextTheme),
              Icon(FlutterRemix.check_fill, size: 17)
            ],
          )),
    ));
    childs.add(PopupMenuDivider(height: 0));

    for (int i = 0; i < 4; i++) {
      // 선택할 수 있는 리스트
      if (context.read<EnrollOutfit>().season !=
          context.read<EnrollOutfit>().seasonList[i]) {
        childs.add(PopupMenuItem<String>(
          value: context.read<EnrollOutfit>().seasonList[i],
          height: 44,
          child: Container(
              width: (100.w - 32 - 40) / 3 + 1,
              alignment: Alignment.centerLeft,
              child: Text(context.read<EnrollOutfit>().seasonList[i],
                  style: basicTextTheme)),
        ));
      }
    }

    return childs;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (100.w - 32 - 40) / 3 + 1,
      child: PopupMenuButton(
          // padding: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Color(0xffD9D9D9), width: 1),
              borderRadius: BorderRadius.circular(5)),
          offset: Offset(0, -20),
          constraints: BoxConstraints(
              maxWidth: (100.w - 32 - 40) / 3 + 1,
              minWidth: (100.w - 32 - 40) / 3 + 1),
          child: Container(
              width: (100.w - 32 - 40) / 3 + 1,
              padding: EdgeInsets.only(left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(context.watch<EnrollOutfit>().season,
                      style: basicTextTheme),
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Icon(FlutterRemix.arrow_down_s_line, size: 20),
                  )
                ],
              )),
          onSelected: (String selected) {
            context.read<EnrollOutfit>().changeSeason(selected);
          },
          itemBuilder: (BuildContext context) => getList()),
    );
  }
}
