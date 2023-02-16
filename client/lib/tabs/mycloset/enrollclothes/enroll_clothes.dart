import 'dart:ffi';

import 'package:eotteom/provider.dart';
import 'package:eotteom/style.dart';
import 'package:eotteom/tabs/mycloset/enrollclothes/name_clothes.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';
import 'brand_clothes.dart';
import 'category_clothes.dart';
import 'enrollbutton_clothes.dart';
import 'fit_clothes.dart';
import 'picture_clothes.dart';
import 'color_clothes.dart';
import 'size_clothes.dart';

import 'price_clothes.dart';

class ClothesEnroll extends StatefulWidget {
  ClothesEnroll({super.key, required this.flag});

  int flag; // 0이면 그냥 등록, 1이면 코디에서 등록

  @override
  State<ClothesEnroll> createState() => _ClothesEnrollState();
}

class _ClothesEnrollState extends State<ClothesEnroll> {
  @override
  void initState() {
    context.read<EnrollClothes>().initEnrollClothes();

    super.initState();
  }

  var color = -1;
  var colorList = [
    '블랙',
    '다크그레이',
    '그레이',
    '화이트',
    '아이보리',
    '베이지',
    '레드',
    '핑크',
    '핫핑크',
    '브라운',
    '카멜',
    '오렌지',
    '옐로우',
    '올리브그린',
    '올리브',
    '다크그린',
    '그린',
    '스카이블루',
    '블루',
    '라이트블루',
    '네이비',
    '퍼플',
  ];
  var hexColorList = [
    [0xff131313],
    [0xff676B71],
    [0xff9F9F9F, 0xffE2E2E2],
    [0xffFFFFFF],
    [0xffFCF6EE],
    [0xffF0DBBC],
    [0xffAE1930, 0xffE92311],
    [0xffF5B4A8],
    [0xffE42493],
    [0xff843215],
    [0xffD7A24F],
    [0xffF86A1B],
    [0xffF6E431],
    [0xffCAC031],
    [0xff6D6C3C],
    [0xff1B4221],
    [0xff5AC13C],
    [0xff58C0E7],
    [0xff2410DC],
    [0xffC9DEEF, 0xffA0CAF6],
    [0xff1C2F57, 0xff4360BE],
    [0xff861CB2],
  ];
  List<Widget> getColorList(int offset) {
    List<Widget> childs = [];
    var line = offset;
    for (int i = line * 6; i < 6 + line * 6; i++) {
      childs.add(CupertinoButton(
          padding: EdgeInsets.all(0),
          child: hexColorList[i].length != 2
              ? Container(
                  margin: EdgeInsets.only(right: i % 6 == 5 ? 0 : 8),
                  height: (100.w - 32 - 45) / 6,
                  width: (100.w - 32 - 45) / 6,
                  decoration: BoxDecoration(
                    color: Color(int.parse(hexColorList[i][0].toString())),
                    border: Border.all(width: 1, color: Color(0xffCACACA)),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: color == i ? Icon(CupertinoIcons.check_mark) : null)
              : Container(
                  margin: EdgeInsets.only(right: i % 6 == 5 ? 0 : 8),
                  height: (100.w - 32 - 45) / 6,
                  width: (100.w - 32 - 45) / 6,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Color(0xffCACACA)),
                    borderRadius: BorderRadius.circular(5),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(int.parse(hexColorList[i][1].toString())),
                        Color(int.parse(hexColorList[i][0].toString())),
                      ],
                    ),
                  )),
          onPressed: () {
            setState(() {
              color = i;
              line = 0;
              context.read<EnrollClothes>().color = colorList[color];
            });
          }));
      if (colorList.length == (i + 1)) {
        break;
      }
    }

    return childs;
  }

  String fit = '';
  List<String> fitList = ['슬림핏', '레귤러핏', '오버핏'];
  changeFit(newFit) {
    setState(() {
      fit = newFit;
    });
  }

  List<Widget> getFitList() {
    List<Widget> childs = [];
    for (int i = 0; i < fitList.length; i++) {
      childs.add(CupertinoButton(
          padding: EdgeInsets.all(0),
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: i % 3 == 2 ? 0 : 9),
            height: (100.w - 32 - 45) / 6,
            width: (100.w - 32 - 18) / 3,
            decoration: BoxDecoration(
                color: Color(0xffFFFFFF),
                border: Border.all(
                    width: 1,
                    color: fit != fitList[i]
                        ? Color(0xffCACACA)
                        : Color(0xff131313)),
                borderRadius: BorderRadius.circular(5)),
            child: Text(fitList[i],
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: "NotoSans",
                    color: fit != fitList[i]
                        ? Color(0xff9B9B9B)
                        : Color(0xff131313),
                    fontWeight: FontWeight.w400,
                    height: 1.3)),
          ),
          onPressed: () {
            changeFit(fitList[i]);

            // context.read<EnrollClothes>().changeFit(fitList[i]);
          }));
    }

    return childs;
  }

  String size = '';
  var sizeList = ['XS', 'S', 'M', 'L', 'XL', 'XXL'];
  changeSize(newSize) {
    setState(() {
      size = newSize;
    });
  }

  List<Widget> getSizeList() {
    List<Widget> childs = [];
    for (int i = 0; i < 6; i++) {
      childs.add(CupertinoButton(
          padding: EdgeInsets.all(0),
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: i % 6 == 5 ? 0 : 9),
            height: (100.w - 32 - 45) / 6,
            width: (100.w - 32 - 45) / 6,
            decoration: BoxDecoration(
                color: Color(0xffFFFFFF),
                border: Border.all(
                    width: 1,
                    color: size != sizeList[i]
                        ? Color(0xffCACACA)
                        : Color(0xff131313)),
                borderRadius: BorderRadius.circular(5)),
            child: Text(sizeList[i],
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: "NotoSans",
                    color: size != sizeList[i]
                        ? Color(0xff9B9B9B)
                        : Color(0xff131313),
                    fontWeight: FontWeight.w400,
                    height: 1.3)),
          ),
          onPressed: () {
            changeSize(sizeList[i]);
            context.read<EnrollClothes>().changeSize(sizeList[i]);
          }));
    }

    return childs;
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
                                  Container(
                                      margin:
                                          EdgeInsets.fromLTRB(16, 27, 0, 24),
                                      child: Text('기본정보',
                                          style: enrollTitleTheme)),
                                  Picture(),
                                  Container(
                                      margin:
                                          EdgeInsets.fromLTRB(16, 0, 16, 32),
                                      width: 100.w - 32,
                                      height: 18 * 1.3 + 8 + 14 * 1.3 + 8 + 44,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              height: 18 * 1.3,
                                              width: 100.2 - 32,
                                              margin:
                                                  EdgeInsets.only(bottom: 8),
                                              child: Text('카테고리',
                                                  style: enrollTitleTheme)),
                                          Container(
                                            height: 14 * 1.3,
                                            width: 100.w - 32,
                                            margin: EdgeInsets.only(bottom: 8),
                                            child: Row(children: [
                                              Container(
                                                  height: 14 * 1.3,
                                                  width: (100.w - 32 - 40) / 6,
                                                  margin: EdgeInsets.only(
                                                      right: (100.w - 32 - 40) /
                                                              3 +
                                                          24 +
                                                          (100.w - 32 - 40) /
                                                              18),
                                                  child: Text('대분류',
                                                      style: basicTextTheme)),
                                              Container(
                                                  height: 14 * 1.3,
                                                  width: (100.w - 32 - 40) / 6,
                                                  child: Text('중분류',
                                                      style: basicTextTheme))
                                            ]),
                                          ),
                                          Container(
                                            height: 44,
                                            width: 100.w - 32,
                                            child: Row(children: [
                                              Container(
                                                  alignment: Alignment.center,
                                                  width: (100.w - 32 - 46) / 2,
                                                  height: 44,
                                                  margin: EdgeInsets.only(
                                                      right: 11),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color:
                                                              Color(0xffD9D9D9),
                                                          width: 1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: PopupMenu(
                                                    flag: true,
                                                    categoryList: context
                                                        .watch<EnrollClothes>()
                                                        .bigCategoryList,
                                                  )),
                                              Container(
                                                  alignment: Alignment.center,
                                                  margin: EdgeInsets.only(
                                                      right: 11),
                                                  child: Icon(
                                                    FlutterRemix
                                                        .arrow_drop_right_line,
                                                    size: 24,
                                                  )),
                                              Container(
                                                  width: (100.w - 32 - 46) / 2,
                                                  height: 44,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color:
                                                              Color(0xffD9D9D9),
                                                          width: 1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: PopupMenu(
                                                    flag: false,
                                                    categoryList: context
                                                                .watch<
                                                                    EnrollClothes>()
                                                                .bigCategory !=
                                                            '선택해주세요'
                                                        ? context
                                                                .watch<
                                                                    EnrollClothes>()
                                                                .smallCategoryList[
                                                            context
                                                                .watch<
                                                                    EnrollClothes>()
                                                                .bigCategoryNum]
                                                        : ['대분류를 먼저 선택해주세요'],
                                                  ))
                                            ]),
                                          )
                                        ],
                                      )),
                                  Container(
                                    height: 8,
                                    width: 100.w,
                                    margin: EdgeInsets.only(bottom: 26),
                                    color: Color(0xffF8F8F8),
                                  ),
                                  Container(
                                      margin: EdgeInsets.fromLTRB(16, 0, 0, 24),
                                      child: Text('세부정보',
                                          style: enrollTitleTheme)),
                                  // Color
                                  Container(
                                      height: ((100.w - 32 - 45) / 6) * 4 +
                                          24 +
                                          (100.w - 32 - 45) / 6 * 1.2 +
                                          16 +
                                          14 +
                                          16 * 1.3 +
                                          1,
                                      width: 100.w - 32,
                                      margin:
                                          EdgeInsets.fromLTRB(16, 0, 16, 28),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              height: 16 * 1.3,
                                              width: 100.w - 32,
                                              margin: EdgeInsets.only(
                                                  bottom: 14, right: 16),
                                              child: Text(
                                                '색상',
                                                style: enrollTitleTheme2,
                                              )),
                                          Container(
                                            height: (100.w - 32 - 45) / 6 * 1.2,
                                            width: 100.w - 32,
                                            margin: EdgeInsets.only(bottom: 16),
                                            child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  color == -1
                                                      ? Container(
                                                          margin: EdgeInsets.only(
                                                              right: 16),
                                                          height: (100.w - 32 - 45) /
                                                              6 *
                                                              1.2,
                                                          width: (100.w - 32 - 45) /
                                                              6 *
                                                              1.2,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                      5),
                                                              color: Color(
                                                                  0xffCACACA)),
                                                          child: Icon(
                                                            CupertinoIcons
                                                                .question,
                                                            size: 15,
                                                            color: Color(
                                                                0xffFFFFFF),
                                                          ))
                                                      : Container(
                                                          height:
                                                              (100.w - 32 - 45) /
                                                                  6 *
                                                                  1.2,
                                                          width: (100.w - 32 - 45) /
                                                              6 *
                                                              1.2,
                                                          margin: EdgeInsets.only(
                                                              right: 16),
                                                          decoration:
                                                              BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                  gradient: LinearGradient(
                                                                      begin: Alignment
                                                                          .topCenter,
                                                                      end: Alignment
                                                                          .bottomCenter,
                                                                      colors: [
                                                                        hexColorList[color].length !=
                                                                                2
                                                                            ? Color(int.parse(hexColorList[color][0].toString()))
                                                                            : Color(int.parse(hexColorList[color][1].toString())),
                                                                        Color(int.parse(
                                                                            hexColorList[color][0].toString())),
                                                                      ])),
                                                          child: null),
                                                  Container(
                                                      height: 44,
                                                      width: 100.w -
                                                          48 -
                                                          (100.w - 32 - 45) /
                                                              6 *
                                                              1.2,
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      padding: EdgeInsets.only(
                                                          left: 15),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  5),
                                                          border: Border.all(
                                                              color: Color(
                                                                  0xffD9D9D9),
                                                              width: 1)),
                                                      child: Text(
                                                          color != -1
                                                              ? colorList[color]
                                                              : '무슨 색상인가요?',
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontFamily:
                                                                  "NotoSans",
                                                              color: color != 100
                                                                  ? Color(0xff131313)
                                                                  : Color(0xff9B9B9B),
                                                              fontWeight: FontWeight.w400,
                                                              height: 1.3)))
                                                ]),
                                          ),
                                          Container(
                                              width: 100.w - 32,
                                              height: (100.w - 32 - 45) / 6,
                                              margin:
                                                  EdgeInsets.only(bottom: 8),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: getColorList(0))),
                                          Container(
                                              width: 100.w - 32,
                                              height: (100.w - 32 - 45) / 6,
                                              margin:
                                                  EdgeInsets.only(bottom: 8),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: getColorList(1))),
                                          Container(
                                              width: 100.w - 32,
                                              height: (100.w - 32 - 45) / 6,
                                              margin:
                                                  EdgeInsets.only(bottom: 8),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: getColorList(2))),
                                          Container(
                                              width: 100.w - 32,
                                              height: (100.w - 32 - 45) / 6,
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: getColorList(3))),
                                        ],
                                      )),
                                  Price(),
                                  Brand(),
                                  // Size
                                  Container(
                                      height: 16 * 1.3 +
                                          13 +
                                          (100.w - 32 - 45) / 6 +
                                          1,
                                      width: 100.w - 32,
                                      margin:
                                          EdgeInsets.fromLTRB(16, 0, 16, 28),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                                height: 16 * 1.3,
                                                width: 100.w - 32,
                                                margin: EdgeInsets.fromLTRB(
                                                    0, 0, 0, 13),
                                                child: Text(
                                                  '사이즈',
                                                  style: enrollTitleTheme2,
                                                )),
                                            Container(
                                              width: 100.w - 32,
                                              height: (100.w - 32 - 45) / 6,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: getSizeList(),
                                              ),
                                            )
                                          ])),
                                  // Fit
                                  Container(
                                      height: 16 * 1.3 +
                                          13 +
                                          (100.w - 32 - 45) / 6 +
                                          1,
                                      width: 100.w - 32,
                                      constraints: BoxConstraints(
                                          minHeight: 16 * 1.3 +
                                              13 +
                                              (100.w - 32 - 45) / 6 +
                                              1,
                                          minWidth: 100.w - 32),
                                      margin:
                                          EdgeInsets.fromLTRB(16, 0, 16, 28),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                                height: 16 * 1.3,
                                                width: 100.w - 32,
                                                margin: EdgeInsets.fromLTRB(
                                                    0, 0, 0, 13),
                                                child: Text(
                                                  '핏',
                                                  style: enrollTitleTheme2,
                                                )),
                                            Container(
                                              height: (100.w - 32 - 45) / 6,
                                              width: 100.w - 32,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: getFitList(),
                                              ),
                                            )
                                          ])),
                                  ClothesName()
                                ])),
                      ),
                      EnrollButton(ctx: context),
                    ],
                  ),
                ),
              )));
    });
  }
}

class PopupMenu extends StatefulWidget {
  PopupMenu({super.key, this.flag, this.categoryList});

  var flag; // true is big, false is small
  var categoryList;

  @override
  State<PopupMenu> createState() => _PopupMenuState();
}

class _PopupMenuState extends State<PopupMenu> {
  List<PopupMenuEntry<String>> getList() {
    List<PopupMenuEntry<String>> childs = [];
    childs.add(PopupMenuItem<String>(
      // 뭐 선택 됐는지
      height: 42,
      value: widget.flag == true
          ? context.read<EnrollClothes>().bigCategory
          : context.read<EnrollClothes>().smallCategory,
      child: Container(
          height: 44,
          width: (100.w - 32 - 46) / 2,
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  widget.flag == true
                      ? context.read<EnrollClothes>().bigCategory
                      : context.read<EnrollClothes>().smallCategory,
                  style: basicTextTheme),
              Icon(FlutterRemix.check_fill, size: 17)
            ],
          )),
    ));
    childs.add(PopupMenuDivider(height: 0));

    for (int i = 0; i < (widget.categoryList).length; i++) {
      // 선택할 수 있는 리스트
      if ((widget.flag == true
              ? context.read<EnrollClothes>().bigCategory
              : context.read<EnrollClothes>().smallCategory) !=
          widget.categoryList[i]) {
        childs.add(PopupMenuItem<String>(
          value: i.toString(),
          height: 44,
          child: Container(
              height: 44,
              width: (100.w - 32 - 46) / 2,
              alignment: Alignment.centerLeft,
              child: Text(widget.categoryList[i], style: basicTextTheme)),
        ));
      }
    }

    return childs;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (100.w - 32 - 41) / 2,
      height: 20,
      child: PopupMenuButton(
          padding: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Color(0xffD9D9D9), width: 1),
              borderRadius: BorderRadius.circular(5)),
          offset: Offset(0, -18),
          constraints: BoxConstraints(
              maxWidth: (100.w - 32 - 46) / 2, minWidth: (100.w - 32 - 46) / 2),
          child: Container(
              height: 20,
              width: (100.w - 32 - 46) / 2,
              padding: EdgeInsets.only(left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      widget.flag == true
                          ? context.read<EnrollClothes>().bigCategory
                          : context.read<EnrollClothes>().smallCategory,
                      style: basicTextTheme),
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Icon(FlutterRemix.arrow_down_s_line, size: 20),
                  )
                ],
              )),
          onSelected: (String categoryNum) {
            if (widget.flag == true) {
              if (widget.categoryList[int.parse(categoryNum)] !=
                  context.read<EnrollClothes>().bigCategory) {
                context
                    .read<EnrollClothes>()
                    .changeBigCategory(int.parse(categoryNum));
              }
            } else {
              if (widget.categoryList[int.parse(categoryNum)] !=
                  context.read<EnrollClothes>().smallCategory) {
                context
                    .read<EnrollClothes>()
                    .changeSmallCategory(int.parse(categoryNum));
              }
            }
          },
          itemBuilder: (BuildContext context) => getList()),
    );
  }
}
