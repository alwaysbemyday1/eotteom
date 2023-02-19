import 'package:eotteom/provider.dart';
import 'package:eotteom/tabs/myoutfit/outfit/dropdown.dart';
import 'package:eotteom/tabs/myoutfit/outfit/filterbutton.dart';
import 'package:eotteom/tabs/myoutfit/outfit/outfit_render.dart';
import 'package:flutter/material.dart';
import "package:sizer/sizer.dart";

class Cody extends StatefulWidget {
  Cody({super.key});

  @override
  State<Cody> createState() => _CodyState();
}

class _CodyState extends State<Cody> {
  List<String> labelSelect = [];
  @override
  String selected_dropdown = "전체"; // 전체가 default
  // Default는 '전체'
  changeDropdown(String? newValue) {
    setState(() {
      selected_dropdown = newValue!;
    });
  }

  @override
  Widget build(BuildContext context) {
    changeFilter(List<String> labelSelectChanged) {
      setState(() {
        labelSelect = labelSelectChanged;
      });
    }

    var buttonStyle = ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: Colors.black))));

    var searchbuttonStyle = ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: Colors.black))),
        backgroundColor: MaterialStateProperty.all(Colors.black));

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
        return SizedBox(
          height: 200.h,
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: DropDown(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: FilterButton(changeFilter: changeFilter))
                  ],
                ),
              ],
            ),
            OutfitRender()
          ]),
        );
      },
    );
  }
}
