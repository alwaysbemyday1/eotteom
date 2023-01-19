import 'package:eotteom/tabs/closetanalysis/piechart.dart';
import 'package:flutter/material.dart';
import "package:sizer/sizer.dart";
import "dropdown.dart";

class Analysis extends StatefulWidget {
  Analysis({super.key});

  @override
  State<Analysis> createState() => _AnalysisState();
}

class _AnalysisState extends State<Analysis> {
  var selected_dropdown = "전체";

  changeDropdown(String value) {
    setState(() {
      selected_dropdown = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        final phoneWidth = 100.w - 16;
        return MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
            ),
            body: SingleChildScrollView(
                child: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: Align(
                            child: RichText(
                              text: const TextSpan(children: [
                                TextSpan(
                                    text: '임태규 ',
                                    style: TextStyle(
                                        color: Color(0xff131313),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16)),
                                TextSpan(
                                    text: "님이 좋아하는 스타일은",
                                    style: TextStyle(color: Colors.black))
                              ]),
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: Align(
                            child: const Text(
                              'OO, OO, 정핏.',
                              style: TextStyle(
                                  fontFamily: "NotoSans",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24,
                                  height: 1.3),
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                        ),
                      ]),
                  SizedBox(
                    height: 54,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          color: Color(0xffF7F7F7),
                        ),
                        height: 130,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 14,
                              ),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '키',
                                        style: TextStyle(
                                            fontFamily: "Inter",
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14.0),
                                      ),
                                      Text('176cm',
                                          style: TextStyle(
                                              fontFamily: "Inter",
                                              fontWeight: FontWeight.w700,
                                              fontSize: 18))
                                    ],
                                  ),
                                  SizedBox(width: 34),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('몸무게',
                                          style: TextStyle(
                                              fontFamily: "Inter",
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14.0)),
                                      Text(
                                        '72kg',
                                        style: TextStyle(
                                            fontFamily: "Inter",
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18))
                                ],
                              )
                            ],
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Container(
                      width: phoneWidth,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Text(
                                '내 옷장 모아보기',
                                style: TextStyle(
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: 55,
                              width: 85,
                              child: Dropdown(
                                  selected_dropdown: selected_dropdown,
                                  changeDropdown: changeDropdown),
                            )
                          ])),
                          SizedBox(height: 48,),
                          Pie(),
                ],
              ),
            )),
          ),
        );
      },
    );
  }
}
