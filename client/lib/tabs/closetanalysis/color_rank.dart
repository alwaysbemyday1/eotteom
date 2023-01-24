import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class ColorRank extends StatelessWidget {
  ColorRank({super.key});

  var phoneWidth = 100.w - 32; // 양 옆 16pixel 뺌

  List dataexample = [
    ["검정", 24, "131313"],
    ["빨강", 20, "D33030"],
    ["파랑", 21, "3372EC"],
    ["그레이", 23, "BEBEBE"],
    ["아이보리", 22, "ECE6CC"]
  ];

  _sortList(List data) {
    data.sort((b, a) => a[1].compareTo(b[1]));
    return data;
  }

  Color _colorFromHex(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }

  @override
  Widget build(BuildContext context) {
    List colorlist = _sortList(dataexample);
    List top =
        (colorlist.length > 2) ? colorlist.sublist(0, 3) : colorlist.sublist(0);
    List other = (colorlist.length > 3) ? colorlist.sublist(3) : [];

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
              SizedBox(
                height: 40,
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: top.length,
                    itemBuilder: ((context, index) {
                      return Text("${top[index][0]} / ",
                          style: TextStyle(
                              fontFamily: "NotoSans",
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                              height: 1.3));
                    })),
              ),
              const SizedBox(
                height: 23,
              ),
              SizedBox(
                height: (phoneWidth - 16) / 3,
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: top.length,
                    itemBuilder: (((context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Container(
                          width: (phoneWidth - 16) / 3,
                          height: (phoneWidth - 16) / 3,
                          decoration: BoxDecoration(
                            color: _colorFromHex(top[index][2]),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 9, top: 3),
                                child: Text(
                                  '${index + 1}',
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
                                      '${top[index][0]}',
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
                                  child: Text('${top[index][1]}',
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
                      );
                    }))),
              ),
              SizedBox(
                height: 25,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: other.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 32, right: 24, bottom: 16),
                    child: Container(
                      color: (index % 2 == 0) ? Colors.white : Color(0xffF9F9F9),
                      width: 100.w - 56,
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "${index + 4}",
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
                                color: _colorFromHex(other[index][2]),
                                borderRadius: BorderRadius.circular(5.0)),
                          ),
                          SizedBox(
                            width: 24,
                          ),
                          Text(
                            '${other[index][0]}',
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
                                '${other[index][1]}',
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
                  );
                }),
              ),
              SizedBox(
                height: 40,
              )
            ],
          ),
        );
      },
    );
  }
}

// Expanded(
//                 child: ListView.builder(
//                 itemCount: other.length,
//                 itemBuilder: ((context, index) {
//                   return Padding(
//                 padding: const EdgeInsets.only(left: 32, right: 24),
//                 child: Container(
//                   width: 100.w - 56,
//                   height: 40,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Text(
//                         "${index+4}",
//                         style: TextStyle(
//                             fontWeight: FontWeight.w400,
//                             fontSize: 16,
//                             fontFamily: "NotoSans"),
//                       ),
//                       SizedBox(
//                         width: 23,
//                       ),
//                       Container(
//                         width: 40,
//                         height: 40,
//                         decoration: BoxDecoration(
//                             color: _colorFromHex(other[index][2]),
//                             borderRadius: BorderRadius.circular(5.0)),
//                       ),
//                       SizedBox(
//                         width: 24,
//                       ),
//                       Text(
//                         '${other[index][0]}',
//                         style: TextStyle(
//                             fontWeight: FontWeight.w400,
//                             fontSize: 16,
//                             fontFamily: "NotoSans"),
//                       ),
//                       Spacer(),
//                       Padding(
//                         padding: const EdgeInsets.only(right: 13),
//                         child: Align(
//                           child: Text(
//                             '${other[index][1]}',
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 16,
//                                 fontFamily: "NotoSans",
//                                 color: Color(0xff777777)),
//                           ),
//                           alignment: Alignment.centerRight,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//                 }),
//               )
//               ),