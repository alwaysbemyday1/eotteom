import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import "package:sizer/sizer.dart";

class Pie extends StatelessWidget {
  Pie({super.key});

  Map<String, double> dataMap = {
    "니트" : 99,
    "셔츠" : 58,
    "멘투멘" : 44,
    "반팔" : 24,
    "후드티" : 14
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
                showLegends: true,
              ),
              chartValuesOptions: const ChartValuesOptions(
                showChartValues: true,
                showChartValueBackground: false,
                showChartValuesOutside: false,
                showChartValuesInPercentage: true
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(children: [
                Text('gd')
              ],),
            )
          ],
        );
      },
    );
  }
}