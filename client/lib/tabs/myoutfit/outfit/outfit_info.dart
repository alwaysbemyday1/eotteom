import 'dart:convert';

import 'package:eotteom/provider.dart';
import "package:flutter/material.dart";
import "package:sizer/sizer.dart";
import "package:eotteom/style.dart";
import "package:flutter_remix/flutter_remix.dart";
import "package:provider/provider.dart";
import "package:http/http.dart" as http;

class OutfitInfo extends StatelessWidget {
  OutfitInfo({Key? key, this.jsonBody, this.index}) : super(key: key);
  var jsonBody;
  final index;
  @override
  Widget build(BuildContext context) {
    Map<String, String> engtokrMap = {
    "black" : "검정",
    "darkgrey" : "다크그레이",
    "grey" : "회색",
    "white" : "흰색",
    "ivory" : "아이보리",
    "beige" : "베이지",
    "red" : "빨강",
    "pink" : "핑크",
    "hotpink" : "핫핑크",
    "brown" : "갈색",
    "camel" : "카멜",
    "orange" : "오렌지",
    "yellow" : "노란색",
    "olivegreen" : "올리브그린",
    "olive" : "올리브",
    "darkgreen" : "다크그린",
    "green" : "녹색",
    "blue" : "파란색",
    "lightblue" : "라이트블루",
    "navy" : "네이비",
    "purple" : "보라색",
    "skyblue" : "스카이블루"
  };
    String tokenAccess = context.watch<UserProvider>().tokenAccess;
    List<Padding> otheroutfitlist = _getotherOutfitlist(jsonBody, index);
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          backgroundColor: Color(0xffF5F5F5),
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Color(0xffF5F5F5),
            iconTheme: IconThemeData(color: Color(0xff151515)),
          ),
          body: SingleChildScrollView(
            child: SizedBox(
              height: 170.h,
              width: 100.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 16, left: 16, right: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/example/cloth1.jpg"),
                                                fit: BoxFit.fill)),
                                      ),
                                      SizedBox(
                                        width: 14,
                                      ),
                                      Text(
                                        '임태규',
                                        style: basicTextTheme2,
                                      ),
                                    ],
                                  ),
                                  Icon(FlutterRemix.more_2_fill)
                                ],
                              ),
                              SizedBox(
                                height: 14,
                              ),
                              Container(
                                width: 100.w - 32,
                                height: (100.w - 32) * (6 / 5),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: Image.memory(base64Decode(
                                                jsonBody['results'][index]
                                                    ["image_memory"]))
                                            .image,
                                        fit: BoxFit.fill)),
                              ),
                              SizedBox(
                                height: 11,
                              ),
                              Row(
                                children: [
                                  Text(
                                    '${jsonBody['results'][index]["name"]}',
                                    style: basicTextTheme2,
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    '#${jsonBody['results'][index]["season"]}',
                                    style: basicTextTheme2,
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    '#${jsonBody['results'][index]["style"]}룩',
                                    style: basicTextTheme2,
                                  ),
                                ],
                              ),
                              Text(
                                '2022. 1. 31 화',
                                style: enrollHintTheme,
                              ),
                              SizedBox(
                                height: 28,
                              ),
                            ],
                          )),
                    ],
                  ),
                  Container(
                    width: 100.w,
                    height: 8,
                    color: Color(0xffF8F8F8),
                  ),
                  SizedBox(
                    height: 26,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '코디 정보',
                          style: enrollTitleTheme,
                        ),
                        SizedBox(
                          height: 13,
                        ),
                        FutureBuilder(
                          future: _getoutfitClothes(tokenAccess, index),
                          builder: ((context, snapshot) {
                            if (snapshot.hasData == false) {
                              return Text('운영진 문의 해주세요');
                            } else {
                              List outfitclothesjson = snapshot.data["results"] as List;
                              return SizedBox(
                            height: 60.w,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: outfitclothesjson.length,
                                itemBuilder: ((context, idx) {
                                  return SizedBox(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8),
                                          child: Container(
                                            height: 30.75.w,
                                            width: 25.6.w,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: Image.memory(base64Decode(outfitclothesjson[idx]["image_memory"])).image
                                              ),
                                                borderRadius:
                                                    BorderRadius.circular(5.0)),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 11,
                                        ),
                                        Text(
                                          '${outfitclothesjson[idx]["major_category"]["name_ko"]} > ${outfitclothesjson[idx]["minor_category"]["name_ko"]}',
                                          style: enrollTitleTheme2,
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '색상 : ${engtokrMap[outfitclothesjson[idx]["color"]]}',
                                              style: enrollHintTheme,
                                            ),
                                            Text(
                                              '사이즈 : M',
                                              style: enrollHintTheme,
                                            ),
                                            Text(
                                              '핏 : 레귤러핏',
                                              style: enrollHintTheme,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                })),
                          );
                            }
                          })
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 100.w,
                    height: 8,
                    color: Color(0xffF8F8F8),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '다른 내 코디 둘러보기',
                          style: enrollTitleTheme2,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        SizedBox(
                          height: 30.75
                              .w, // ListView.builder는 기본적으로 요소가 builder 안에 꽉 차도록 됨.
                          child: ListView(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            children: otheroutfitlist,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  _getotherOutfitlist(var jsonBody, var index) {
    List<Padding> otheroutfitlist = [];
    for (int i = 0; i < jsonBody["results"].length; i++) {
      if (i != index) {
        otheroutfitlist.add(Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Container(
            height: 30.75.w,
            width: 25.6.w,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: Image.memory(base64Decode(
                            jsonBody["results"][i]["image_memory"]))
                        .image),
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ));
      }
    }
    return otheroutfitlist;
  }

  Future _getoutfitClothes(String tokenAccess, int index) async {
    String url = "http://127.0.0.1:8000/api/outfits/${index+1}/clothes"; // id는 jsonBody index에 +1 더해줘야됨.
    http.Response response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${tokenAccess}',
    });

    var outfitjson = jsonDecode(utf8.decode(response.bodyBytes));    
    return outfitjson;
  }
}
