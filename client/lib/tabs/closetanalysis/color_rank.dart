import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ColorRank extends StatelessWidget {
  ColorRank({super.key});

  var phoneWidth = 100.w - 32; // 양 옆 16pixel 뺌

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Container(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: const TextSpan(children: [
                  TextSpan(
                      text: '상의 ',
                      style: TextStyle(
                          color: Color(0xff131313),
                          fontWeight: FontWeight.w700,
                          fontSize: 16)),
                  TextSpan(
                      text: "중에서 가장 많은 색깔은",
                      style: TextStyle(color: Colors.black))
                ]),
              ),
              const Text(
                '검정, 그레이, 아이보리.',
                style: TextStyle(
                    fontFamily: "NotoSans",
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    height: 1.3),
              ),
              const SizedBox(
                height: 23,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: (phoneWidth - 16) / 3,
                    height: (phoneWidth - 16) / 3,
                    decoration: BoxDecoration(
                      color: const Color(0xff131313),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 9, top: 3),
                          child: const Text(
                            '1',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 22,
                                fontFamily: "Inter"),
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        // ignore: prefer_const_constructors
                        Padding(
                          padding: const EdgeInsets.only(right: 9),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: SizedBox(
                              child: Text(
                                '검은색',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 22,
                                    fontFamily: "Inter"),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 9),
                          child: Align(
                            child: Text('24',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 22,
                                    fontFamily: "Inter")),
                            alignment: Alignment.centerRight,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: (phoneWidth - 16) / 3,
                    height: (phoneWidth - 16) / 3,
                    decoration: BoxDecoration(
                      color: const Color(0xffBEBEBE),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 9, top: 3),
                          child: Text(
                            '2',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 22,
                                fontFamily: "Inter"),
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        // ignore: prefer_const_constructors
                        Padding(
                          padding: const EdgeInsets.only(right: 9),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: SizedBox(
                              child: Text(
                                '그레이',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 22,
                                    fontFamily: "Inter"),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 9),
                          child: Align(
                            child: Text('23',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 22,
                                    fontFamily: "Inter")),
                            alignment: Alignment.centerRight,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                      width: (phoneWidth - 16) / 3,
                      height: (phoneWidth - 16) / 3,
                      decoration: BoxDecoration(
                        color: const Color(0xffECE6CC),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 9, top: 3),
                            child: Text(
                              '3',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 22,
                                  fontFamily: "Inter"),
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          // ignore: prefer_const_constructors
                          Padding(
                            padding: const EdgeInsets.only(right: 9),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: SizedBox(
                                child: Text(
                                  '아이보리',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 22,
                                      fontFamily: "Inter"),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 9),
                            child: Align(
                              child: Text('22',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 22,
                                      fontFamily: "Inter")),
                              alignment: Alignment.centerRight,
                            ),
                          )
                        ],
                      )),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32, right: 24),
                child: Container(
                  width: 100.w - 56,
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "4",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            fontFamily: "NotoSans"),
                      ),
                      SizedBox(
                        width: 23,
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      SizedBox(
                        width: 24,
                      ),
                      Text(
                        '파랑',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            fontFamily: "NotoSans"),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 13),
                        child: Align(
                          child: Text(
                            '21',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                fontFamily: "NotoSans",
                                color: Color(0xff777777)),
                          ),
                          alignment: Alignment.centerRight,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32, right: 24),
                child: Container(
                  color: Color(0xffF9F9F9),
                  width: 100.w - 56,
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "5",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            fontFamily: "NotoSans"),
                      ),
                      SizedBox(
                        width: 23,
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      SizedBox(
                        width: 24,
                      ),
                      Text(
                        '빨강',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            fontFamily: "NotoSans"),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 13),
                        child: Align(
                          child: Text(
                            '20',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                fontFamily: "NotoSans",
                                color: Color(0xff777777)),
                          ),
                          alignment: Alignment.centerRight,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
