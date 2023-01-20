import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import "package:sizer/sizer.dart";

class Pie extends StatelessWidget {
  Pie({super.key});

  Map<String, double> dataMap = {
    "니트": 99,
    "셔츠": 58,
    "멘투멘": 44,
    "반팔": 24,
    "후드티": 14
  };

  final colorList = [
    const Color(0xffDD5353),
    const Color(0xffECCA1B),
    const Color(0xff76CD4C),
    const Color(0xff1885EA),
    const Color(0xff4240b1)
  ];

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Column(
          children: [
            PieChart(
              dataMap: dataMap,
              chartRadius: 40.w,
              colorList: colorList,
              initialAngleInDegree: 270,
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
            SizedBox(
              height: 44,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: colorList[0]),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '니트',
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: 0.9),
                      ),
                      Text(
                        '99',
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: colorList[1]),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '셔츠',
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: 0.9),
                      ),
                      Text(
                        '58',
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: colorList[2]),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '맨투맨',
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: 0.9),
                      ),
                      Text(
                        '44',
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: colorList[3]),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '반팔',
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: 0.9),
                      ),
                      Text(
                        '24',
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: colorList[4]),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '후드티',
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: 0.9),
                      ),
                      Text(
                        '14',
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}