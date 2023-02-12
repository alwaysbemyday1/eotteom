import 'package:eotteom/tabs/closetanalysis/getanalysis.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import "package:sizer/sizer.dart";
import "package:provider/provider.dart";
import "package:eotteom/provider.dart";

class Pie extends StatefulWidget {
  Pie({super.key});

  @override
  State<Pie> createState() => _PieState();
}

class _PieState extends State<Pie> {
  // _preprocessPie(List data) {
  final colorList = [
    const Color(0xffD62828),
    const Color(0xffF77F00),
    const Color(0xffFCBF49),
    const Color(0xffEAE2B7),
    const Color(0xff1C9788),
    const Color(0xff003949)
  ];

  Map<String, String> _categoryMap = {
    "top": "상의",
    "bottom": "하의",
    "outer": "아우터",
    "shoes": "신발",
    "accessary": "악세사리",
    "onepiece": "원피스"
  };

  @override
  Widget build(BuildContext context) {
    String userId = context.watch<UserProvider>().userId;
    String tokenAccess = context.watch<UserProvider>().tokenAccess;
    String maxCategory = context
        .watch<AnalysisProvider>()
        .maxCategory(context.read<AnalysisProvider>().dataexample);
    List<String> datakeys =
        context.read<AnalysisProvider>().dataexample.keys.toList();
    List<String> categories = context.read<AnalysisProvider>().categories;

    return Sizer(
      builder: (context, orientation, deviceType) {
        return SizedBox(
          width: 100.w - 32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: ((context, index) {
                      return TextButton(
                        child: Text(
                          categories[index],
                          style: TextStyle(
                            fontSize: 16,
                            color: const Color(0xff151515),
                            fontFamily: "NotoSans",
                            decoration: context
                                    .watch<AnalysisProvider>()
                                    .categoryPressed[index]
                                ? TextDecoration.underline
                                : TextDecoration.none,
                            decorationThickness: 2,
                          ),
                        ),
                        onPressed: () {
                          context.read<AnalysisProvider>().changePressed(index);
                        },
                      );
                    }),
                  )),
              FutureBuilder(
                future: requestGetApi(userId, tokenAccess),
                builder: (context, snapshot) {
                  if (snapshot.hasData == false) {
                    return Text("데이터가 없습니다");
                  } else {
                    var jsbody = snapshot.data as Map<dynamic, dynamic>;
                    List<String> percentage = context
                        .watch<AnalysisProvider>()
                        .percentage(
                            jsbody['category_count'], jsbody['total_count']);
                    List<int> counts = getCount(jsbody['category_count']);
                    return Column(
                      children: [
                        SizedBox(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 16),
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
                                              text: context
                                                      .read<AnalysisProvider>()
                                                      .categories[
                                                  context
                                                      .read<AnalysisProvider>()
                                                      .categoryState],
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 16),
                                        child: RichText(
                                          text: TextSpan(children: [
                                            TextSpan(
                                              text: _categoryMap[
                                                  jsbody['category_count'][0]
                                                      ['major_category']],
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
                                              text: "${percentage[0]}% ",
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
                        PieChart(
                          dataMap: getpiechartMap(jsbody['category_count']),
                          chartRadius: 40.w,
                          colorList: colorList,
                          initialAngleInDegree: 270,
                          ringStrokeWidth: (30 * 4 / 9)
                              .w, // figma 상 pie chart의 반지름이 90, 두께가 40 적용. 적을수록 두께가 작음
                          chartType: ChartType.ring,
                          legendOptions: const LegendOptions(
                            showLegendsInRow: true,
                            legendPosition: LegendPosition.bottom,
                            showLegends: false,
                          ),
                          chartValuesOptions: const ChartValuesOptions(
                              showChartValues: false,
                              showChartValueBackground: false,
                              showChartValuesOutside: false,
                              showChartValuesInPercentage: false),
                        ),
                        const SizedBox(
                          height: 44,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16, right: 0),
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: percentage.length,
                              itemBuilder: ((context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.only(top: 8, right: 16),
                                  child: Container(
                                    color: (index % 2 == 0)
                                        ? Color(0xffFFFFFF)
                                        : Color(0xffF9F9F9),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, bottom: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 16),
                                            child: Container(
                                              width: 16,
                                              height: 16,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: colorList[index]),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            datakeys[index],
                                            style: TextStyle(
                                                fontFamily: "NotoSans",
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Text(
                                            " (${counts[index]}개)",
                                            style: const TextStyle(
                                                color: Color(0xff9B9B9B),
                                                fontFamily: "NotoSans",
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Expanded(child: SizedBox()),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 16),
                                            child: Text(
                                              '${percentage[index]}%',
                                              style: TextStyle(
                                                  fontFamily: "NotoSans",
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 16),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              })),
                        )
                      ],
                    );
                  }
                },
              ), // FutureBuilder 끝!!
            ],
          ),
        );
      },
    );
  }
}
