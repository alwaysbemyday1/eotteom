import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'closet_appbar.dart';
import 'closet/closet.dart';
import 'Cody/cody.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyCloset extends StatelessWidget {
  const MyCloset({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FilterState(),
      child: MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ko')
      ],
      locale: Locale('ko'),
      home: DefaultTabController(
      length: 2, // 옷장, 코디
      child: Scaffold(
        appBar: appbar, // 상단 TabBar 부분
        body: TabBarView(
          children: [
            Closet(),
            Cody()
          ],
        ),
      ),
    ),
  ),
    );
}
}

class FilterState extends ChangeNotifier {
  bool datecheck = true;
  bool temperaturecheck = true;
  int nowyear = DateTime.now().year.toInt();
  var select_date;
  var hightemperature;
  var lowtemperature;

  changeDatecheck () {
    datecheck = !datecheck;
    notifyListeners();
  }

  changeTemperaturecheck () {
    temperaturecheck = !temperaturecheck;
    notifyListeners();
  }

  addYear () {
    nowyear++;
    notifyListeners();
  }

  minusYear() {
    nowyear--;
    notifyListeners();
  }

  selectDate (value) {
    select_date = value;
    notifyListeners();
    print(select_date);
  }

  setTemperature(value) {
      hightemperature = value.end.toInt();
      lowtemperature = value.start.toInt();
      notifyListeners();
  }
}


// context.watch<FilterState>().temperatures.start.toInt()


// class Cody extends StatefulWidget {
//   Cody({super.key});

//   @override
//   State<Cody> createState() => _CodyState();  
// }

// class _CodyState extends State<Cody> {
  
//   var dropdown_map = {
//     "전체" : SizedBox(), // 빈칸용
//     "날짜" : DropDownMonth(),
//     "계절" : DropDownSeason(),
//     "날씨" : DropDownTemperature()
//   };
//   var dropdownlist = ['전체', "날짜", '계절', '날씨'];
//   String selected_dropdown = "전체"; // 전체가 default
//  // Default는 '전체'
//   changeDropdown (String? newValue) {
//     setState(() {
//       selected_dropdown = newValue!;
//     });
//   }

//   changeDropDown_DropDown(String? value) {
//     return dropdown_map[value];
//   }

//   // var DropDate = SingleChildScrollView(
//   //   scrollDirection: Axis.horizontal,
//   //   child: Row(
//   //     children: [DropDownYear(), DropDownMonth()],
//   //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   //   ),
//   // );

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(height: 20,),
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
//         ]
//         );
//   }
// }

// class Dropdown extends StatelessWidget {
//   Dropdown({Key? key, this.changeDropdown, this.selected_dropdown}) : super(key: key);
//   // var dropdownlist = ['전체', '날짜', '계절', '날씨'];
//   final changeDropdown;
//   final selected_dropdown;
//   var dropdownitems = [
//     DropdownMenuItem(child: Text('전체'), value: "전체",),
//     DropdownMenuItem(child: Text('날짜'), value: "날짜",),
//     DropdownMenuItem(child: Text('계절'), value: "계절",),
//     DropdownMenuItem(child: Text('날씨'), value: "날씨",)
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonFormField(
//       decoration: InputDecoration(
//         enabledBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: Colors.black, width: 2)
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: Colors.black, width: 2),
//         ),
//         filled: false
//       ),
//       dropdownColor: Colors.white,
//       value: selected_dropdown,
//       onChanged: (newValue) {
//         changeDropdown(newValue);
//       },
//       items: dropdownitems,
//     );
//   }
// }

// class DropDownYear extends StatelessWidget {
//   DropDownYear({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var nowyear = DateTime.now().year;
//     List<int> year = List.generate(7, (int index) => nowyear.toInt() - index);
//     int selected_year = nowyear.toInt(); // 기본이 현재 해(year)
//     var buttonYear = year.map(
//       ((e) => DropdownMenuItem(
//         value: e,
//         child: Text(e.toString()),
//       ))
//     ).toList();
//     return DropdownButtonFormField(
//       decoration: InputDecoration(
//         enabledBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: Colors.black, width: 2)
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: Colors.black, width: 2)
//         ),
//         filled: false
//       ),
//       dropdownColor: Colors.white,
//       value: selected_year,
//       items: buttonYear,
//       onChanged: (index) {
//         selected_year = nowyear.toInt() - index!;
//       },
//     );
//   }
// }

// class DropDownMonth extends StatelessWidget {
//   const DropDownMonth({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var nowmonth = DateTime.now().month;
//     List<int> month = List.generate(12, (int index) => index+1);
//     int selected_month = nowmonth.toInt();
//     var buttonMonth = month.map(
//       ((e) => DropdownMenuItem(
//         value: e,
//         child: Text(e.toString()),
//       ))
//     ).toList();

//     return DropdownButtonFormField(
//       decoration: InputDecoration(
//         enabledBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: Colors.black, width: 2)
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: Colors.black, width: 2)
//         ),
//         filled: false
//       ),
//       dropdownColor: Colors.white,
//       value: selected_month,
//       items: buttonMonth,
//       onChanged: (index) {
//         selected_month = index! + 1; // index 이므로 월을 알기 위해선 1 더해주는 게 좋음
//       },
//     );
//   }
// }



// // class DropDownTemperature extends StatefulWidget {
// //   const DropDownTemperature({super.key});

// //   @override
// //   State<DropDownTemperature> createState() => _DropDownTemperatureState();
// // }

// // class _DropDownTemperatureState extends State<DropDownTemperature> {
// //   RangeValues currentRangeValues = const RangeValues(-15, 20);
// //   var colorgradient = LinearGradient(colors: [
// //     Colors.red,
// //     Colors.blue
// //   ]);
// //   @override
// //   Widget build(BuildContext context) {
    
// //     return ;
// //     )
// //   }


// // RangeSlider(
      
// //       values: currentRangeValues,
// //       max: 45,
// //       min: -30,
// //       divisions: 15, // 5도 차이로 변경됨 (75/5=15)
// //       labels: RangeLabels(
// //         currentRangeValues.start.round().toString(),
// //         currentRangeValues.end.round().toString()
// //       ),
// //       onChanged: (RangeValues values) {
// //         setState(() {
// //           currentRangeValues = values;
// //         });
// //       },
// //     );
// // BottomNavigator 부분


// class BottomBar extends StatelessWidget {
//   const BottomBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//         type: BottomNavigationBarType.fixed, // 선택된 탭에 대해 움직이는 애니메이션 없애줌
//         unselectedItemColor: Colors.grey,
//         selectedItemColor: Colors.black,
//         showUnselectedLabels: true,
//         items: [
//           BottomNavigationBarItem(
//             icon: unactive[0],
//             label: iconlabel[0],
//             activeIcon: active[0],
//           ),
//           BottomNavigationBarItem(
//             icon: unactive[1],
//             label: iconlabel[1],
//             activeIcon: active[1],
//           ),
//           BottomNavigationBarItem(
//             icon: unactive[2],
//             label: iconlabel[2],
//             activeIcon: active[2]
//           ),
//           BottomNavigationBarItem(
//             icon: unactive[3],
//             label: iconlabel[3],
//             activeIcon: active[3]
//           ),
//           BottomNavigationBarItem(
//             icon: unactive[4],
//             label: iconlabel[4],
//             activeIcon: active[4],
//           )
//         ],
//         currentIndex: 3, // 화면 연동 시킬 경우 바꿀 필요 있음! setState를 통해 바꾸기
//     );
//   }
// }

// var iconlabel = const ['모두의룩', '옷장분석', '홈', '나의옷장', '옷추가'];

// var unactive = const [
//             Icon(Icons.abc,
//               size: 30.0,
//               color: Colors.grey,
//             ),
//             Icon(Icons.bar_chart,
//             size: 30.0,
//             color: Colors.grey,),
//             Icon(Icons.home,
//               size: 30.0,
//               color: Colors.grey,
//             ),
//             Icon(Icons.person,
//             size: 30.0,
//             color: Colors.grey,),
//             Icon(Icons.person_add,
//             size: 30.0,
//             color: Colors.grey,)
//           ];

// var active = const [
//             Icon(Icons.abc,
//               size: 30.0,
//               color: Colors.black,
//             ),
//             Icon(Icons.bar_chart,
//             size: 30.0,
//             color: Colors.black,),
//             Icon(Icons.home,
//               size: 30.0,
//               color: Colors.black,
//             ),
//             Icon(Icons.person,
//             size: 30.0,
//             color: Colors.black,),
//             Icon(Icons.person_add,
//             size: 30.0,
//             color: Colors.black,)
//           ];