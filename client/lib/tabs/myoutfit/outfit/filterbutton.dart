import "package:flutter/material.dart";
import "package:eotteom/tabs/myoutfit/outfit/checkbox.dart";
import "package:eotteom/provider.dart";
import 'package:eotteom/tabs/myoutfit/outfit/seasonlabel.dart';
import 'package:sizer/sizer.dart';
import "daterangepicker.dart";
import "package:provider/provider.dart";
import "package:eotteom/tabs/myoutfit/outfit/outfitlabel.dart";

var buttonStyle = ButtonStyle(
    shape: MaterialStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
        side: BorderSide(color: Colors.black))));

var searchbuttonStyle = ButtonStyle(
    shape: MaterialStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
        side: BorderSide(color: Colors.black))),
    backgroundColor: MaterialStateProperty.all(Colors.black));

class FilterButton extends StatefulWidget {
  const FilterButton({super.key});

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return TextButton(
      style: buttonStyle,
      child: Text(
        '필터',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        showModalBottomSheet(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            isScrollControlled: true,
            context: context,
            builder: ((context) => DraggableScrollableSheet(
                  expand: false,
                  builder: ((context, scrollController) => SizedBox(
                        height: 160.h,
                        child: SingleChildScrollView(
                          controller: scrollController,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
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
                                      icon: Icon(Icons.close, size: 16),
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
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CheckboxLabel(),
                                    IconButton(
                                      icon: Icon(Icons.refresh),
                                      onPressed: () {
                                        setState(() {
                                          context
                                              .read<FilterProvider>()
                                              .resetFilter();
                                        });
                                      },
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 24, right: 24),
                                child: Align(
                                  child: OutfitLabel(),
                                  alignment: Alignment.center,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 24, right: 24),
                                child: Divider(
                                  thickness: 1,
                                  color: Color(0xffCACACA),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CheckboxWeather(),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: MonthRangePick(),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 24, right: 24),
                                child: Divider(
                                  thickness: 1,
                                  color: Color(0xffCACACA),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: CheckboxTemperature(),
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.only(
                              //       left: 20, right: 20),
                              //   child: TemperaturePicker(),
                              // ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 24, right: 24),
                                child: Align(
                                  child: SeasonLabel(),
                                  alignment: Alignment.center,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 24, top: 38),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        fixedSize: const Size(156, 44),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(22))),
                                    onPressed: () {},

                                    /// django 서버로 조건에 맞게 데이터 전송하는 비동기함수 구현 예정
                                    child: Text(
                                      '검색',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
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
    );
    },);
  }
}