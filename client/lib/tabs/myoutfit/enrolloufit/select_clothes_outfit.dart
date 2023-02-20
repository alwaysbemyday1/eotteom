import 'dart:io';

import 'package:eotteom/model/clothes_model.dart';
import 'package:eotteom/provider.dart';
import 'package:eotteom/style.dart';
import 'package:eotteom/tabs/mycloset/closet/closet_select.dart';
import 'package:eotteom/tabs/mycloset/closet/cloth_render.dart';
import 'package:eotteom/tabs/mycloset/closet/dropdowncloset.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'clothes_list_outfit.dart';

class SelectClothes extends StatefulWidget {
  SelectClothes({super.key, this.addMyClothes, this.removeMyClothes});

  var addMyClothes;
  var removeMyClothes;

  @override
  State<SelectClothes> createState() => _SelectClothesState();
}

class _SelectClothesState extends State<SelectClothes> {
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
  String bigCategory = '상의';
  String smallCategory = '니트';
  var clothesList = [];

  Future getMyOutfitList() async {
    http.Response response = await http.get(
        Uri.parse(
            'http://127.0.0.1:8000/api/clothes/list/${context.read<UserProvider>().userId}/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${context.read<UserProvider>().tokenAccess}',
        });

    var tmpClothesList = jsonDecode(response.body);
    clothesList = tmpClothesList['results'];

    for (int i = 0; i < clothesList.length; i++) {}
    return clothesList;
  }

  var filteredList = [];
  getFilteredList(bigCategory, smallCategory) {
    filteredList = [];

    for (int i = 0; i < clothesList.length; i++) {
      if (smallCategoryList2[clothesList[i]['minor_category'] - 1] ==
          smallCategory) {
        filteredList.add(clothesList[i]);
      }
    }

    return filteredList;
  }

  List selectedList = [];
  selectClothes(clothes) {
    setState(() {
      selectedList.add(clothes);
    });
    widget.addMyClothes(clothes);
  }

  removeClothes(index) {
    setState(() {
      selectedList.removeAt(index);
    });
    widget.removeMyClothes(index);
  }

  getSelectedList() {
    List<Container> childs = [];
    for (int i = 0; i < selectedList.length; i++) {
      childs.add(Container(
          margin: EdgeInsets.only(left: 16),
          alignment: Alignment.center,
          height: 130,
          width: 84,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  child: Text(
                      bigCategoryList[selectedList[i]['major_category']],
                      style: basicTextTheme)),
              Container(
                height: 90,
                width: 90,
                margin: EdgeInsets.only(bottom: 3),
                child: Stack(children: [
                  Container(
                      width: 80,
                      height: 80,
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Image.memory(
                        base64Decode(selectedList[i]['image_memory']),
                        fit: BoxFit.fill,
                      )),
                  Container(
                    height: 20,
                    width: 20,
                    margin: EdgeInsets.only(left: 70, bottom: 0),
                    child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          removeClothes(i);
                        },
                        icon: Icon(FlutterRemix.close_circle_fill,
                            size: 20, color: Color(0xff9B9B9B))),
                  ),
                ]),
              ),
              Container(
                  child: Text(
                      smallCategoryList2[selectedList[i]['minor_category']],
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "NotoSans",
                          color: Color(0xff131313),
                          fontWeight: FontWeight.w700,
                          height: 1.3))),
            ],
          )));
    }
    return childs;
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                elevation: 0.0,
                backgroundColor: Colors.white,
                title: const Text(
                  '코디한 옷을 모두 선택해주세요',
                  style: TextStyle(
                    fontFamily: "NotoSans",
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                ),
                centerTitle: true,
                leading: Material(
                  color: Colors.white,
                  child: IconButton(
                    icon: Icon(
                      FlutterRemix.close_fill,
                      size: 30,
                      color: Color(0xff131313),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                )),
            body: SafeArea(
              right: false,
              left: false,
              top: false,
              bottom: false,
              child: Sizer(
                builder: (ctx, orientation, deviceType) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 18),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: DropDownCloset(),
                        ),
                      ),
                      SizedBox(
                        // 큰 카테고리
                        height: 40,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: bigCategoryList.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, right: 8),
                                child: TextButton(
                                  child: Text(
                                    bigCategoryList[index],
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xff151515),
                                        decoration: bigCategory ==
                                                bigCategoryList[index]
                                            ? TextDecoration.underline
                                            : TextDecoration.none,
                                        decorationThickness: 2,
                                        fontSize: 16,
                                        fontFamily: "NotoSans"),
                                  ),
                                  onPressed: () {
                                    // 배포후 카테고리 확정나면 수정 필요
                                    setState(() {
                                      bigCategory = bigCategoryList[index];
                                      smallCategory =
                                          smallCategoryList2[2 * index];
                                    });
                                  },
                                ),
                              );
                            }),
                      ),
                      SizedBox(
                        // 작은 카테고리
                        height: 35,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: smallCategoryList1[bigCategory]!.length,
                            itemBuilder: ((context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, right: 8),
                                child: TextButton(
                                  child: Text(
                                    smallCategoryList1[bigCategory]![index],
                                    style: TextStyle(
                                        decoration: smallCategoryList1[
                                                    bigCategory]![index] ==
                                                smallCategory
                                            ? TextDecoration.underline
                                            : TextDecoration.none,
                                        decorationThickness: 2,
                                        color: Color(0xff151515),
                                        fontSize: 16,
                                        fontWeight: smallCategoryList1[
                                                    bigCategory]![index] ==
                                                smallCategory
                                            ? FontWeight.w700
                                            : FontWeight.w400),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      smallCategory = smallCategoryList1[
                                          bigCategory]![index];
                                    });
                                  },
                                ),
                              );
                            })),
                      ),
                      Expanded(
                        child:
                            Sizer(builder: ((context, orientation, deviceType) {
                          return SizedBox(
                            width: 100.w,
                            child: FutureBuilder(
                                future: getMyOutfitList(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData == false) {
                                    return CupertinoActivityIndicator();
                                  } else {
                                    getFilteredList(bigCategory, smallCategory);
                                    return GridView.builder(
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3,
                                                mainAxisSpacing: 8,
                                                crossAxisSpacing: 8),
                                        itemCount: filteredList.length,
                                        itemBuilder: ((context, index) {
                                          return Stack(
                                            children: [
                                              InkWell(
                                                child: Container(
                                                    width: (100.w - 48) / 3,
                                                    height: (100.w - 48) / 3,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                    ),
                                                    child: Image.memory(
                                                      base64Decode(
                                                          filteredList[index]
                                                              ['image_memory']),
                                                      fit: BoxFit.fill,
                                                    )),
                                                onTap: () {
                                                  selectClothes(
                                                      filteredList[index]);
                                                },
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 7, right: 7),
                                                child: Align(
                                                  alignment: Alignment.topRight,
                                                  child: IconButton(
                                                    padding: EdgeInsets.zero,
                                                    constraints:
                                                        BoxConstraints(),
                                                    // icon: clothesList[index]['likes']
                                                    //     ? Icon(Icons.favorite)
                                                    //     : Icon(Icons.favorite_border),
                                                    icon: Icon(
                                                        Icons.favorite_border),
                                                    color: Color(0xffFFFFFF),
                                                    onPressed: () {},
                                                    iconSize: (100.w - 48) /
                                                        3 *
                                                        (20 / 109),
                                                  ),
                                                ),
                                              )
                                            ],
                                          );
                                        }));
                                  }
                                }),
                          );
                        })),
                      ),
                      Container(
                          height: 300,
                          alignment: Alignment.center,
                          padding: EdgeInsets.fromLTRB(0, 16, 0, 32),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 1,
                                    spreadRadius: 0)
                              ]),
                          child: Column(children: [
                            Container(
                              margin: EdgeInsets.only(
                                  left: 16, right: 16, bottom: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '선택한 옷',
                                    style: basicTextTheme2,
                                  ),
                                  Text(selectedList.length.toString(),
                                      style: enrollTitleTheme2)
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 130,
                              width: double.infinity,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: selectedList.length != 0
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: getSelectedList())
                                    : SizedBox(height: 0),
                              ),
                            ),
                            selectedList.length != 0
                                ? Container(
                                    width: 100.w - 32,
                                    height: 44,
                                    margin: EdgeInsets.only(top: 37),
                                    child: CupertinoButton(
                                        padding: EdgeInsets.all(0),
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(5),
                                        child: Text('선택',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white)),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        }),
                                  )
                                : Container(
                                    width: 100.w - 32,
                                    height: 44,
                                    margin: EdgeInsets.only(top: 37),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.grey),
                                    alignment: Alignment.center,
                                    child: Text('선택',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white)))
                          ]))
                    ],
                  );
                },
              ),
            )),
      );
    });
  }
}
