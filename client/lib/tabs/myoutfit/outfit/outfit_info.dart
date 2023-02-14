import 'dart:convert';

import "package:flutter/material.dart";
import "package:sizer/sizer.dart";
import "package:eotteom/style.dart";
import "package:flutter_remix/flutter_remix.dart";

class OutfitInfo extends StatelessWidget {
  OutfitInfo({Key? key, this.jsonBody, this.index}) : super(key: key);
  var jsonBody;
  final index;
  @override
  Widget build(BuildContext context) {
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
                        SizedBox(
                          height: 60.w,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
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
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(5.0)),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 11,
                                      ),
                                      Text(
                                        '상의 > 후디',
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
                                            '색상 : 핑크',
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
}
