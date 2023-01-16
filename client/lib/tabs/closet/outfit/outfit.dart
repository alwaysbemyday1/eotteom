import 'package:eotteom/tabs/closet/outfit/checkbox.dart';
import 'package:eotteom/tabs/closet/mycloset.dart';
import 'package:flutter/material.dart';
import "daterangepicker.dart";
import "temperaturepicker.dart";
import "package:provider/provider.dart";
import "package:sizer/sizer.dart";

class Cody extends StatefulWidget {
  Cody({super.key});

  @override
  State<Cody> createState() => _CodyState();
}

class _CodyState extends State<Cody> {
  @override
  var dropdownlist = ['전체', "날짜", '계절', '날씨'];
  String selected_dropdown = "전체"; // 전체가 default
  // Default는 '전체'
  changeDropdown(String? newValue) {
    setState(() {
      selected_dropdown = newValue!;
    });
  }

  @override
  Widget build(BuildContext context) {
    var buttonStyle = ButtonStyle(
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: const Color(0xff131313))
        )
      )
    );

    var searchbuttonStyle = ButtonStyle(
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: const Color(0xff131313))
        )
      ),
      backgroundColor: MaterialStateProperty.all(const Color(0xff131313))
    );

    bool dateCheck = true;
    bool temperatureCheck = true;
    int selectyear = 2023;

    changeDate(value) {
      setState(() {
        dateCheck = value;
        print(dateCheck);
      });
    }

    changeTemperature(value) {
      setState(() {
        temperatureCheck = value;
        print(temperatureCheck);
      });
    }
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                '필터를 걸어 날짜, 기온별로 코디를 나눠보세요!',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              ),
              TextButton(
                style: buttonStyle,
                child: Text(
                  '필터',
                  style: TextStyle(
                      color: Color(0xff131313), fontWeight: FontWeight.bold),

                ),
                onPressed: () {
                  showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      isScrollControlled: true,
                      context: context,
                      builder: ((context) => DraggableScrollableSheet(
                            expand: false,
                            builder: ((context, scrollController) =>
                                SingleChildScrollView(
                                  controller: scrollController,
                                  child: SizedBox(
                                    height: 140.h,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 30, top: 27),
                                              child: Text(
                                                '필터',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 18),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 32, top: 32),
                                              child: IconButton(
                                                icon:
                                                    Icon(Icons.close, size: 16),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 23,
                                        ),
                                        Divider(
                                          thickness: 1,
                                          color: Color(0xffCACACA),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, right: 20),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              CheckboxWeather(),
                                              IconButton(
                                                icon: Icon(Icons.refresh),
                                                onPressed: () {
                                                  setState(() {
                                                    context
                                                        .read<FilterState>()
                                                        .resetFilter();
                                                  });
                                                },
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, right: 20),
                                          child: MonthRangePick(),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 24, right: 24),
                                          child: Divider(
                                            thickness: 1,
                                            color: Color(0xffCACACA),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: CheckboxTemperature(),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, right: 20),
                                          child: TemperaturePicker(),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 24, top: 38),
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: TextButton(
                                              style: TextButton.styleFrom(
                                                  backgroundColor: Colors.black,
                                                  fixedSize:
                                                      const Size(156, 44),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              22))),
                                              onPressed: () {},

                                              /// django 서버로 조건에 맞게 데이터 전송하는 비동기함수 구현 예정
                                              child: Text(
                                                '검색',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )),
                          )));
                },
              )
            ],
          )
        ]);
      },
    );
  }
}

  // Text('${context.watch<FilterState>().lowtemperature.toString()}, ${context.watch<FilterState>().hightemperature.toString()}')
// SizedBox(
//                     height: MediaQuery.of(context).size.height*0.9,
//                     child: Column(
//                       children: [
//                         Row(
//                           children: [
//                             Text('필터'), IconButton(icon: Icon(Icons.exit_to_app), onPressed: () {},),
//                             ],
//                           ),
//                           CheckboxWeather(),
//                           MonthRangePick(),
//                           CheckboxTemperature(),
//                           TemperaturePicker(),
//                       ],
//                     ),
//                   );