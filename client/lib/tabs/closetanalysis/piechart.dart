import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import "package:sizer/sizer.dart";

class Pie extends StatelessWidget {
  Pie({super.key});

  List dataexample = [
    // 백엔드 서버로 받아오는 데이터 예시
    ["악세사리", 58],
    ["신발", 24],
    ["아우터", 14],
    ["하의", 44],
    ["상의", 99]
  ];

  _preprocessPie(List data) { // Pie Chart에 쓸 수 있는 Map 형태로 데이터가 나옴.
    data.sort((b, a) => a[1].compareTo(b[1]));
    Map<String, double> result = {for (var v in data) v[0]: v[1].toDouble()};
    return result;
  }

  _sortList(List data) {
    data.sort((b, a) => a[1].compareTo(b[1]));
    return data;
  }

  _clothCount(List data) {
    List clothCount = [];
    for (var v in data) {
      clothCount.add(v[1]);
    }
    clothCount.sort((b, a) => a.compareTo(b));
    return clothCount;
  }

  _totalSum(List data) {
    // 옷 개수 총합 구하는 함수
    num totalSum = 0;
    for (var v in data) {
      totalSum += v[1];
    }
    return totalSum;
  }

  _percentage(List data, num totalSum) {
    // 옷이 가진 비율을 구해줌. 중요한건 List<String> 의 자료구조로 반환됨!!!!
    // dart의 경우 소수점 고정을 하는 경우 문자열로 나옴.
    List percent = [];
    for (var v in data) {
      percent.add((v[1] / totalSum * 100).toStringAsFixed(1));
    }
    return percent;
  }

  final colorList = [
    const Color(0xffDD5353),
    const Color(0xffECCA1B),
    const Color(0xff76CD4C),
    const Color(0xff1885EA),
    const Color(0xff4240b1)
  ];

  @override
  Widget build(BuildContext context) {
    num totalSum = _totalSum(dataexample);
    List sortedList = _sortList(dataexample);
    List percentage = _percentage(dataexample, totalSum);

    return Sizer(
      builder: (context, orientation, deviceType) {
        return SizedBox(
          width: 100.w-32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              PieChart(
                dataMap: _preprocessPie(dataexample),
                chartRadius: 40.w,
                colorList: colorList,
                initialAngleInDegree: 270,
                ringStrokeWidth: (30*4/9).w, // figma 상 pie chart의 반지름이 90, 두께가 40 적용. 적을수록 두께가 작음
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
                  shrinkWrap: true,
                  itemCount: sortedList.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8, right: 16),
                      child: Container(
                        color: (index % 2 == 0) ? Colors.white : Color(0xffF9F9F9),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Container(
                                      width: 16,
                                      height: 16,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: colorList[index]
                                      ),
                                    ),
                              ),
                                  SizedBox(width: 8,),
                                  Text(sortedList[index][0], style: TextStyle(fontFamily: "NotoSans", fontSize: 16, fontWeight: FontWeight.w400),),
                              Expanded(child: SizedBox()),
                              Padding(
                                padding: const EdgeInsets.only(right: 16),
                                child: Text('${percentage[index]}%', style: TextStyle(fontFamily: "NotoSans", fontWeight: FontWeight.w700, fontSize: 16),),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  })
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
