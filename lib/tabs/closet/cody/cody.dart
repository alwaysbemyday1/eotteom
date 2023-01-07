import 'package:flutter/material.dart';
import "DropDown/dropdown.dart";
import "DropDown/dropdown_date.dart";
import "DropDown/dropdown_season.dart";
import "DropDown/dropdown_temperature.dart";

class Cody extends StatefulWidget {
  Cody({super.key});

  @override
  State<Cody> createState() => _CodyState();  
}

class _CodyState extends State<Cody> {
  
  var dropdown_map = {
    "전체" : SizedBox(), // 빈칸용
    "날짜" : DropDownMonth(),
    "계절" : DropDownSeason(),
    "날씨" : DropDownTemperature()
  };
  var dropdownlist = ['전체', "날짜", '계절', '날씨'];
  String selected_dropdown = "전체"; // 전체가 default
 // Default는 '전체'
  changeDropdown (String? newValue) {
    setState(() {
      selected_dropdown = newValue!;
    });
  }

  changeDropDown_DropDown(String? value) {
    return dropdown_map[value];
  }

  // var DropDate = SingleChildScrollView(
  //   scrollDirection: Axis.horizontal,
  //   child: Row(
  //     children: [DropDownYear(), DropDownMonth()],
  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //   ),
  // );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Text('겨울'), Text('5~15'), TextButton(child: Text('필터', style: TextStyle(color: Colors.black),), onPressed: () {},)],
        )
      ]
    );
  }
}

// SizedBox(height: 20,),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               SizedBox(
//                 height: 90,
//                 width: 120,
//                 child: Dropdown(changeDropdown: changeDropdown, selected_dropdown: selected_dropdown),
//               ),
//               SizedBox(
//                 height: 90,
//                 width: 120,
//                 child: changeDropDown_DropDown(selected_dropdown),
//               ),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               SizedBox(
//                 height: 90,
//                 width: 120,
//                 child: DropDownYear(),
//               ),
//               SizedBox(
//                 height: 90,
//                 width: 120,
//                 child: DropDownMonth(),
//               )
//             ],
//           )