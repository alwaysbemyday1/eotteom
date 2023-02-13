import 'dart:convert';

import 'package:eotteom/tabs/closetanalysis/getanalysis.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import "package:provider/provider.dart";
import "package:eotteom/provider.dart";

class ColorRank extends StatefulWidget {
  ColorRank({super.key});

  @override
  State<ColorRank> createState() => _ColorRankState();
}

class _ColorRankState extends State<ColorRank> {
  var phoneWidth = 100.w - 32;
  // 양 옆 16pixel 뺌
  _sortList(List data) {
    data.sort((b, a) => a['count'].compareTo(b['count']));
    return data;
  }
  @override
  Widget build(BuildContext context) {
    String userId = context.watch<UserProvider>().userId;
    String tokenAccess = context.watch<UserProvider>().tokenAccess;
    return FutureBuilder(
      future: requestGetApi(userId, tokenAccess),
      builder: (context, snapshot) {
        if (snapshot.hasData == false) {
          return const SizedBox();
        } else {
          var jsbody = snapshot.data as Map<dynamic, dynamic>;
          List colorCount = _sortList(jsbody['color_count']);
          List top = (colorCount.length > 2)
              ? colorCount.sublist(0, 3)
              : colorCount.sublist(0);
          List other = (colorCount.length > 3) ? colorCount.sublist(3) : [];
          num total = totalCountColor(top);
          return Sizer(
            builder: (context, orientation, deviceType) {
              return Container(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: context.read<AnalysisProvider>().categories[
                                context
                                    .read<AnalysisProvider>()
                                    .categoryState], // 내 상의
                            style: const TextStyle(
                                color: Color(0xff131313),
                                fontWeight: FontWeight.w700,
                                fontSize: 16)),
                        const TextSpan(
                            text: "중에서 가장 많은 색깔은",
                            style: TextStyle(color: Colors.black))
                      ]),
                    ),
                    SizedBox(
                      height: 40,
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: top.length, // 상위 3개 부분
                          itemBuilder: ((context, index) {
                            return Text(
                                "#${context.watch<AnalysisProvider>().engtokrMap[top[index]["color"]]} ",
                                style: const TextStyle(
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
                                decoration: context
                                        .read<AnalysisProvider>()
                                        .palette[top[index]["color"]] is Color
                                    ? BoxDecoration(
                                        color: context
                                            .read<AnalysisProvider>()
                                            .palette[top[index]["color"]],
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      )
                                    : BoxDecoration(
                                        gradient: context
                                            .read<AnalysisProvider>()
                                            .palette[top[index]["color"]],
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 9, top: 3),
                                      child: Text(
                                        '${index + 1}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 22,
                                            fontFamily: "NotoSans"),
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
                                            '${context.watch<AnalysisProvider>().engtokrMap[top[index]["color"]]}',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 22,
                                                fontFamily: "NotoSans"),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 9),
                                      child: Align(
                                        child: Text('${(top[index]["count"]/total.toInt()*100).toStringAsFixed(1)}%',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 22,
                                                fontFamily: "NotoSans")),
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
                          padding: const EdgeInsets.only(
                              left: 32, right: 24, bottom: 16),
                          child: Container(
                            color: (index % 2 == 0)
                                ? Colors.white
                                : const Color(0xffF9F9F9),
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
                                  decoration: context
                                          .read<AnalysisProvider>()
                                          .palette[other[index]["color"]] is Color ? BoxDecoration(
                                      color: context
                                          .read<AnalysisProvider>()
                                          .palette[other[index]["color"]],
                                      borderRadius: BorderRadius.circular(5.0)) : BoxDecoration(
                                      gradient: context
                                          .read<AnalysisProvider>()
                                          .palette[other[index]["color"]],
                                      borderRadius: BorderRadius.circular(5.0)),
                                ),
                                SizedBox(
                                  width: 24,
                                ),
                                Text(
                                  '${context.watch<AnalysisProvider>().engtokrMap[other[index]["color"]]}',
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
                                      '${other[index]["count"]}',
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