import 'dart:convert';

import 'package:dotted_border/dotted_border.dart';
import 'package:eotteom/provider.dart';
import 'package:eotteom/style.dart';
import 'package:eotteom/tabs/mycloset/enrollclothes/enroll_clothes.dart';
import 'package:eotteom/tabs/myoutfit/enrolloufit/select_clothes_outfit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ClothesOufit extends StatefulWidget {
  ClothesOufit(
      {super.key, this.setMyClothesList, this.clothesList, this.myClothesList});
  var setMyClothesList;
  var clothesList;
  var myClothesList;

  @override
  State<ClothesOufit> createState() => _ClothesOufitState();
}

class _ClothesOufitState extends State<ClothesOufit> {
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
  List<String> bigCategoryList = ['상의', '하의', '아우터', '신발', '악세사리'];
  Map<String, List<String>> smallCategoryList1 = {
    '상의': ['니트', '맨투맨'],
    '하의': ['청바지', '치마'],
    '아우터': ['코트', '패딩'],
    '신발': ['슬리퍼', '운동화'],
    '악세사리': ['장갑', '가방']
  };
  List<String> smallCategoryList2 = [
    '맨투맨',
    '니트',
    '청바지',
    '치마',
    '코트',
    '패딩',
    '운동화',
    '슬리퍼',
    '장갑',
    '가방'
  ];

  List newClothesList = [];

  List myClothesList = [];

  getClothesList(List clothesList) {
    List<Container> childs = [];
    for (int i = 0; i < clothesList.length; i++) {
      childs.add(Container(
          width: 100.w - 32,
          height: 100,
          margin: EdgeInsets.only(bottom: 16),
          child: Row(
            children: [
              Container(
                  height: 100,
                  width: 100,
                  margin: EdgeInsets.only(right: 14),
                  child: Image.memory(
                    base64Decode(clothesList[i]['image_memory']),
                    fit: BoxFit.fill,
                    height: 100,
                    width: 100,
                  )),
              SizedBox(
                width: 100.w - 32 - 100 - 14,
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: smallCategoryList2[clothesList[i]
                                      ['minor_category']],
                                  style: enrollTitleTheme2),
                              TextSpan(
                                  text: '(' +
                                      bigCategoryList[clothesList[i]
                                          ['major_category']] +
                                      ')',
                                  style: basicTextTheme)
                            ]),
                          ),
                          SizedBox(
                            height: 20,
                            width: 20,
                            child: OutlinedButton(
                                style: ButtonStyle(
                                    padding:
                                        MaterialStateProperty.all<EdgeInsets>(
                                            EdgeInsets.fromLTRB(0, 0, 0, 0)),
                                    side: MaterialStateProperty.all(BorderSide(
                                        color: Colors.blue,
                                        width: 1.0,
                                        style: BorderStyle.none))),
                                onPressed: () {
                                  setState(() {
                                    clothesList..removeAt(i);
                                    //childs.removeAt(i);
                                  });
                                },
                                child: Icon(FlutterRemix.close_fill,
                                    size: 20, color: Color(0xff131313))),
                          )
                        ],
                      ),
                    ),
                    clothesList[i]['color'] != ''
                        ? Text('색상: ' + clothesList[i]['color'],
                            style: enrollHintTheme)
                        : Text('색상: -', style: enrollHintTheme),
                    clothesList[i]['size'] != ''
                        ? Text('사이즈: ' + clothesList[i]['size'],
                            style: enrollHintTheme)
                        : Text('사이즈: -', style: enrollHintTheme),
                    clothesList[i]['fit'] != ''
                        ? Text('핏: ' + clothesList[i]['fit'],
                            style: enrollHintTheme)
                        : Text('핏: -', style: enrollHintTheme),
                  ],
                ),
              )
            ],
          )));
    }
    return childs;
  }

  @override
  void initState() {
    setState(() {
      myClothesList = widget.myClothesList;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100.w - 32,
        height: 250 + (myClothesList.length + newClothesList.length) * 118,
        margin: EdgeInsets.fromLTRB(16, 0, 16, 12.7),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            margin: EdgeInsets.only(bottom: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '코디한 옷 정보',
                  style: enrollTitleTheme,
                ),
                OutlinedButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.fromLTRB(0, 0, 0, 0))),
                    onPressed: () async {
                      var result =
                          await Navigator.of(context, rootNavigator: true)
                              .push(MaterialPageRoute(
                                  builder: (ctx) => SelectClothes(
                                        myClothesList: myClothesList,
                                        clothesList: widget.clothesList,
                                      )));

                      if (result != null) {
                        setState(() {
                          myClothesList = result;
                        });
                        widget.setMyClothesList(result);
                      }
                    },
                    child: Container(
                      width: (100.w - 32 - 40) / 6 * 3.5 + 24,
                      height: 44,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border:
                              Border.all(color: Color(0xff131313), width: 1)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.only(right: 8),
                              child: Icon(
                                FlutterRemix.t_shirt_2_line,
                                size: 24,
                                color: Color(0xff131313),
                              )),
                          Text('옷장에서 가져오기', style: enrollTitleTheme2)
                        ],
                      ),
                    ))
              ],
            ),
          ),
          DottedBorder(
            color: Color(0xffCACACA),
            strokeWidth: 1,
            padding: EdgeInsets.all(0),
            radius: Radius.circular(5),
            child: OutlinedButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.fromLTRB(0, 0, 0, 0)),
                    side: MaterialStateProperty.all(BorderSide(
                        color: Colors.blue,
                        width: 1.0,
                        style: BorderStyle.none))),
                onPressed: () async {
                  context.read<EnrollOutfit>().croppedClothesImage =
                      await context.read<EnrollOutfit>().cropImage(
                          imageFile: context.read<EnrollOutfit>().resultImage!);
                  var result = await Navigator.of(context, rootNavigator: true)
                      .push(CupertinoPageRoute(
                          builder: (ctx) => ClothesEnroll(
                                flag: 1,
                              )));

                  if (result != null) {
                    setState(() {
                      newClothesList.add(result);
                    });
                  }
                },
                child: Container(
                  width: (100.w - 32),
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(width: 0, color: Colors.white)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          margin: EdgeInsets.only(right: 13),
                          child: Icon(
                            FlutterRemix.add_fill,
                            size: 24,
                            color: Color(0xff9B9B9B),
                          )),
                      Text('코디 사진으로 옷 등록하기',
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: "NotoSans",
                              color: Color(0xff9B9B9B),
                              fontWeight: FontWeight.w700,
                              height: 1.3)),
                    ],
                  ),
                )),
          ),
          Container(
            margin: EdgeInsets.only(top: 16, bottom: 16),
            child: Text(
              '새로 등록할 옷',
              style: enrollTitleTheme2,
            ),
          ),
          newClothesList.length != 0
              ? Column(
                  children: getClothesList(newClothesList),
                )
              : SizedBox(height: 0, width: 0),
          Container(
              width: 100.w - 32,
              margin: EdgeInsets.only(bottom: 16),
              child: Divider(
                height: 0,
                thickness: 1,
                color: Color(0xffCACACA),
              )),
          Container(
            margin: EdgeInsets.only(bottom: 16),
            child: Text(
              '옷장에 있는 옷',
              style: enrollTitleTheme2,
            ),
          ),
          myClothesList.length != 0
              ? Column(
                  children: getClothesList(myClothesList),
                )
              : SizedBox(height: 0, width: 0),
        ]));
  }
}
