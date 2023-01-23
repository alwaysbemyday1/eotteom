import 'package:eotteom/tabs/closetanalysis/piechart.dart';
import 'package:flutter/material.dart';
import "package:sizer/sizer.dart";
import "color_rank.dart";

class Analysis extends StatefulWidget {
  Analysis({super.key});

  @override
  State<Analysis> createState() => _AnalysisState();
}

class _AnalysisState extends State<Analysis> {
  var selected_dropdown = "전체";

  final _categoryPressed = [true, false, false, false, false, false, false];
  final _categories = ['옷장전체', '상의', '하의', '아우터', '신발', '악세사리', '원피스'];

  int _categoryState = 0;

  changePressed(int index) {
    setState(() {
      for (int i = 0; i < _categoryPressed.length; i++) {
        if (i == index) {
          _categoryPressed[i] = true;
        } else {
          _categoryPressed[i] = false;
        }
        _categoryState = index;
      }
    });
  }

  var analysisScroll = ScrollController();

  changeDropdown(String value) {
    setState(() {
      selected_dropdown = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        final phoneWidth = 100.w - 32;
        return MaterialApp(
          home: Scaffold(
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
                                padding:
                                    const EdgeInsets.only(left: 16, right: 16),
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
                                          style: TextStyle(color: Colors.white))
                                    ]),
                                  ),
                                  alignment: Alignment.centerLeft,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 16, right: 16),
                                child: Align(
                                  child: const Text(
                                    'OO, OO, 레귤러핏.',
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
                                padding:
                                    const EdgeInsets.only(left: 16, right: 16),
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
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14.0),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text('50000 원',
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
                                                        fontFamily: "Inter",
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 14.0),
                                                  ),
                                                  Text('레귤러핏',
                                                      style: TextStyle(
                                                          fontFamily: "Inter",
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
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                              child: Text(
                                _categories[0],
                                style: TextStyle(
                                    color: _categoryPressed[0]
                                        ? Colors.white
                                        : Color(0xff9B9B9B),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),
                              ),
                              onPressed: () {
                                changePressed(0);
                              },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      _categoryPressed[0]
                                          ? Colors.black
                                          : Colors.white)),
                            ),
                            TextButton(
                              child: Text(
                                _categories[1],
                                style: TextStyle(
                                    color: _categoryPressed[1]
                                        ? Colors.white
                                        : Color(0xff9B9B9B),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),
                              ),
                              onPressed: () {
                                changePressed(1);
                              },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      _categoryPressed[1]
                                          ? Colors.black
                                          : Colors.white)),
                            ),
                            TextButton(
                              child: Text(
                                _categories[2],
                                style: TextStyle(
                                    color: _categoryPressed[2]
                                        ? Colors.white
                                        : Color(0xff9B9B9B),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),
                              ),
                              onPressed: () {
                                changePressed(2);
                              },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      _categoryPressed[2]
                                          ? Colors.black
                                          : Colors.white)),
                            ),
                            TextButton(
                              child: Text(
                                _categories[3],
                                style: TextStyle(
                                    color: _categoryPressed[3]
                                        ? Colors.white
                                        : Color(0xff9B9B9B),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),
                              ),
                              onPressed: () {
                                changePressed(3);
                              },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      _categoryPressed[3]
                                          ? Colors.black
                                          : Colors.white)),
                            ),
                            TextButton(
                              child: Text(
                                _categories[4],
                                style: TextStyle(
                                    color: _categoryPressed[4]
                                        ? Colors.white
                                        : Color(0xff9B9B9B),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),
                              ),
                              onPressed: () {
                                changePressed(4);
                              },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      _categoryPressed[4]
                                          ? Colors.black
                                          : Colors.white)),
                            ),
                            TextButton(
                              child: Text(
                                _categories[5],
                                style: TextStyle(
                                    color: _categoryPressed[5]
                                        ? Colors.white
                                        : Color(0xff9B9B9B),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),
                              ),
                              onPressed: () {
                                changePressed(5);
                              },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      _categoryPressed[5]
                                          ? Colors.black
                                          : Colors.white)),
                            ),
                            TextButton(
                              child: Text(
                                _categories[6],
                                style: TextStyle(
                                    color: _categoryPressed[6]
                                        ? Colors.white
                                        : Color(0xff9B9B9B),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),
                              ),
                              onPressed: () {
                                changePressed(6);
                              },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      _categoryPressed[6]
                                          ? Colors.black
                                          : Colors.white)),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text: '내 ',
                                              style: TextStyle(
                                                  color: Color(0xff131313),
                                                  fontFamily: "NotoSans",
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 20)),
                                          TextSpan(
                                            text: "옷장 전체",
                                            style: TextStyle(
                                                color: Color(0xff131313),
                                                fontFamily: "NotoSans",
                                                fontWeight: FontWeight.w700,
                                                fontSize: 20),
                                          ),
                                          TextSpan(
                                              text: "에서는",
                                              style: TextStyle(
                                                  color: Color(0xff131313),
                                                  fontFamily: "NotoSans",
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 20))
                                        ]),
                                      ),
                                    ),
                                  ]),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                            text: "상의 ",
                                            style: TextStyle(
                                                color: Color(0xff131313),
                                                fontFamily: "NotoSans",
                                                fontWeight: FontWeight.w700,
                                                fontSize: 20),
                                          ),
                                          TextSpan(
                                              text: "이(가) ",
                                              style: TextStyle(
                                                  color: Color(0xff131313),
                                                  fontFamily: "NotoSans",
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 20)),
                                          TextSpan(
                                            text: "32% ",
                                            style: TextStyle(
                                                color: Color(0xff131313),
                                                fontFamily: "NotoSans",
                                                fontWeight: FontWeight.w700,
                                                fontSize: 20),
                                          ),
                                          TextSpan(
                                              text: "로 가장 많아요.",
                                              style: TextStyle(
                                                  color: Color(0xff131313),
                                                  fontFamily: "NotoSans",
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 20))
                                        ]),
                                      ),
                                    ),
                                  ])
                            ],
                          )),
                      SizedBox(
                        height: 48,
                      ),
                      Pie(),
                      SizedBox(
                        height: 51,
                      ),
                      ColorRank(),
                    ],
                  ),
                )),
          ),
        );
      },
    );
  }
}
