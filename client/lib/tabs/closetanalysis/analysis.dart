import 'package:eotteom/tabs/closetanalysis/piechart.dart';
import 'package:flutter/material.dart';
import "package:sizer/sizer.dart";
import "color_rank.dart";

import "package:provider/provider.dart";

class Analysis extends StatefulWidget {
  Analysis({super.key});

  @override
  State<Analysis> createState() => _AnalysisState();
}

class _AnalysisState extends State<Analysis> {
  var selected_dropdown = "전체";

  var analysisScroll = ScrollController();

  changeDropdown(String value) {
    setState(() {
      selected_dropdown = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => AnalysisProvider()),
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: const Color(0xff131313),
                elevation: 0.0,
              ),
              body: SingleChildScrollView(
                  controller: analysisScroll,
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          color: Color(0xff131313),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16, right: 16),
                                  child: Align(
                                    child: RichText(
                                      text: const TextSpan(children: [
                                        TextSpan(
                                            text: '임태규 ',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 16)),
                                        TextSpan(
                                            text: "님이 좋아하는 스타일은",
                                            style:
                                                TextStyle(color: Colors.white))
                                      ]),
                                    ),
                                    alignment: Alignment.centerLeft,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16, right: 16),
                                  child: Align(
                                    child: Text(
                                      'OO, OO, ${context.read<AnalysisProvider>().consumerInformation["mostpick"]}.',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "NotoSans",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 24,
                                          height: 1.3),
                                    ),
                                    alignment: Alignment.centerLeft,
                                  ),
                                ),
                                SizedBox(
                                  height: 54,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16, right: 16),
                                  child: Container(
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        color: Color(0xffF7F7F7),
                                      ),
                                      height: 130,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 16.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 14,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '한벌 당 평균 소비 가격',
                                                  style: TextStyle(
                                                      fontFamily: "Inter",
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14.0),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                    '${context.read<AnalysisProvider>().consumerInformation["average"]} 원',
                                                    style: TextStyle(
                                                        fontFamily: "Inter",
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 18))
                                              ],
                                            ),
                                            SizedBox(
                                              height: 16,
                                            ),
                                            Row(
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '옷장에서 가장 많은 핏',
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "NotoSans",
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 14.0),
                                                    ),
                                                    Text(
                                                        '${context.read<AnalysisProvider>().consumerInformation["mostpick"]}',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "NotoSans",
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 18))
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                                SizedBox(
                                  height: 32,
                                ),
                              ]),
                        ),
                        Pie(),
                        SizedBox(
                          height: 51,
                        ),
                        ColorRank(),
                      ],
                    ),
                  )),
            );
        },
      ),
    );
  }
}

class AnalysisProvider extends ChangeNotifier {
  List<bool> categoryPressed = [true, false, false, false, false, false, false];
  List<String> categories = ['옷장전체', '상의', '하의', '아우터', '신발', '악세사리', '원피스'];

  int categoryState = 0;

  Map<String, Color> palette = {
    "빨강" : const Color(0xffD33030),
    "주황" : const Color(0xffF38535),
    "노랑" : const Color(0xffEAEE19),
    "초록" : const Color(0xff6AE431),
    "하늘" : const Color(0xff73BCFF),
    "파랑" : const Color(0xff3372EC),
    "보라" : const Color(0xff9C33DC),
    "갈색" : const Color(0xffA16464),
    "하얀색" : const Color(0xffFFFFFF),
    "그레이" : const Color(0xff949494),
    "검정" : const Color(0xff151515),
    "아이보리" : const Color(0xffFCF6EE)
  };

  changePressed(int index) {
    for (int i = 0; i < categoryPressed.length; i++) {
      if (i == index) {
        categoryPressed[i] = true;
        notifyListeners();
      } else {
        categoryPressed[i] = false;
        notifyListeners();
      }
    }
    categoryState = index;
    notifyListeners();
  }

  Map<String, double> dataexample = {
    "상의": 99,
    "악세사리": 58,
    "하의": 44,
    "신발": 24,
    "아우터": 14
  };

  List colordataexample = [
    ["검정", 24],
    ["빨강", 20],
    ["파랑", 21],
    ["그레이", 23],
    ["아이보리", 22]
  ];

  Map consumerInformation = {"average": 50000, "mostpick": "레귤러핏"};

  maxCategory(Map data) {
    String a = data.keys.toList()[0];
    return a;
  }

  maxCount(Map data) {
    return data[maxCategory(data)];
  }

  totalSum(Map data) {
    // 옷 개수 총합 구하는 함수
    num totalSum = 0;
    data.forEach((_, v) => totalSum += v);
    return totalSum;
  }

  percentage(Map data, num totalSum) {
    // 옷이 가진 비율을 구해줌. 중요한건 List<String> 의 자료구조로 반환됨!!!!
    // dart의 경우 소수점 고정을 하는 경우 문자열로 나옴.
    List<String> percent = [];
    data.forEach(
        (_, v) => percent.add((v / totalSum * 100).toStringAsFixed(1)));
    return percent;
  }
}


                        // SingleChildScrollView(
                        //   scrollDirection: Axis.horizontal,
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //     children: [
                        //       TextButton(
                        //         child: Text(
                        //           _categories[0],
                        //           style: TextStyle(
                        //               color: _categoryPressed[0]
                        //                   ? Colors.white
                        //                   : Color(0xff9B9B9B),
                        //               fontWeight: FontWeight.w400,
                        //               fontSize: 14),
                        //         ),
                        //         onPressed: () {
                        //           changePressed(0);
                        //         },
                        //         style: ButtonStyle(
                        //             backgroundColor: MaterialStateProperty.all(
                        //                 _categoryPressed[0]
                        //                     ? Colors.black
                        //                     : Colors.white)),
                        //       ),
                        //       TextButton(
                        //         child: Text(
                        //           _categories[1],
                        //           style: TextStyle(
                        //               color: _categoryPressed[1]
                        //                   ? Colors.white
                        //                   : Color(0xff9B9B9B),
                        //               fontWeight: FontWeight.w400,
                        //               fontSize: 14),
                        //         ),
                        //         onPressed: () {
                        //           changePressed(1);
                        //         },
                        //         style: ButtonStyle(
                        //             backgroundColor: MaterialStateProperty.all(
                        //                 _categoryPressed[1]
                        //                     ? Colors.black
                        //                     : Colors.white)),
                        //       ),
                        //       TextButton(
                        //         child: Text(
                        //           _categories[2],
                        //           style: TextStyle(
                        //               color: _categoryPressed[2]
                        //                   ? Colors.white
                        //                   : Color(0xff9B9B9B),
                        //               fontWeight: FontWeight.w400,
                        //               fontSize: 14),
                        //         ),
                        //         onPressed: () {
                        //           changePressed(2);
                        //         },
                        //         style: ButtonStyle(
                        //             backgroundColor: MaterialStateProperty.all(
                        //                 _categoryPressed[2]
                        //                     ? Colors.black
                        //                     : Colors.white)),
                        //       ),
                        //       TextButton(
                        //         child: Text(
                        //           _categories[3],
                        //           style: TextStyle(
                        //               color: _categoryPressed[3]
                        //                   ? Colors.white
                        //                   : Color(0xff9B9B9B),
                        //               fontWeight: FontWeight.w400,
                        //               fontSize: 14),
                        //         ),
                        //         onPressed: () {
                        //           changePressed(3);
                        //         },
                        //         style: ButtonStyle(
                        //             backgroundColor: MaterialStateProperty.all(
                        //                 _categoryPressed[3]
                        //                     ? Colors.black
                        //                     : Colors.white)),
                        //       ),
                        //       TextButton(
                        //         child: Text(
                        //           _categories[4],
                        //           style: TextStyle(
                        //               color: _categoryPressed[4]
                        //                   ? Colors.white
                        //                   : Color(0xff9B9B9B),
                        //               fontWeight: FontWeight.w400,
                        //               fontSize: 14),
                        //         ),
                        //         onPressed: () {
                        //           changePressed(4);
                        //         },
                        //         style: ButtonStyle(
                        //             backgroundColor: MaterialStateProperty.all(
                        //                 _categoryPressed[4]
                        //                     ? Colors.black
                        //                     : Colors.white)),
                        //       ),
                        //       TextButton(
                        //         child: Text(
                        //           _categories[5],
                        //           style: TextStyle(
                        //               color: _categoryPressed[5]
                        //                   ? Colors.white
                        //                   : Color(0xff9B9B9B),
                        //               fontWeight: FontWeight.w400,
                        //               fontSize: 14),
                        //         ),
                        //         onPressed: () {
                        //           changePressed(5);
                        //         },
                        //         style: ButtonStyle(
                        //             backgroundColor: MaterialStateProperty.all(
                        //                 _categoryPressed[5]
                        //                     ? Colors.black
                        //                     : Colors.white)),
                        //       ),
                        //       TextButton(
                        //         child: Text(
                        //           _categories[6],
                        //           style: TextStyle(
                        //               color: _categoryPressed[6]
                        //                   ? Colors.white
                        //                   : Color(0xff9B9B9B),
                        //               fontWeight: FontWeight.w400,
                        //               fontSize: 14),
                        //         ),
                        //         onPressed: () {
                        //           changePressed(6);
                        //         },
                        //         style: ButtonStyle(
                        //             backgroundColor: MaterialStateProperty.all(
                        //                 _categoryPressed[6]
                        //                     ? Colors.black
                        //                     : Colors.white)),
                        //       )
                        //     ],
                        //   ),
                        // )