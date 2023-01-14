import 'package:eotteom/signin.dart';
import 'package:eotteom/tabs/closet/outfit/checkbox.dart';
import 'package:eotteom/tabs/closet/mycloset.dart';
import 'package:flutter/material.dart';
import "daterangepicker.dart";
import "temperaturepicker.dart";
import "package:provider/provider.dart";

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
  changeDropdown (String? newValue) {
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
          side: BorderSide(color: Colors.black)
        )
      )
    );

    var searchbuttonStyle = ButtonStyle(
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.black)
        )
      ),
      backgroundColor: MaterialStateProperty.all(Colors.black)
    );

    bool dateCheck = true;
    bool temperatureCheck = true;
    int selectyear = 2023;

    
    

    changeDate (value) {
        setState(() {
          dateCheck = value;
          print(dateCheck);
        });
    }

    changeTemperature (value) {
        setState(() {
          temperatureCheck = value;
          print(temperatureCheck);
        });
      
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [TextButton(child: Text('유저이름 들어갈자리'),
            onPressed: (){
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => SigninPage())
              );
            },
          ), TextButton(
            style: buttonStyle,
            child: Text('필터', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),), 
            onPressed: () {
              showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)
                ),
                isScrollControlled: true,
                context: context, 
                builder: ((context) => DraggableScrollableSheet(
                  expand: false,
                  builder: ((context, scrollController) => SingleChildScrollView(
                    controller: scrollController,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Text('필터', style: TextStyle(fontWeight: FontWeight.bold),),
                              ), IconButton(icon: Icon(Icons.close), onPressed: () {
                                Navigator.pop(context);
                              },),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20, right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CheckboxWeather(),
                                  IconButton(icon: Icon(Icons.refresh), onPressed: () {
                                    setState(() {
                                      context.read<FilterState>().resetFilter();
                                    });
                                  },)
                                ],
                              ),
                            ),
                            Divider(),
                            Padding(
                              padding: const EdgeInsets.only(left: 20, right: 20),
                              child: MonthRangePick(),
                            ),
                            Divider(),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: CheckboxTemperature(),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20, right: 20),
                              child: TemperaturePicker(),
                            ),
                            TextButton(
                              style: searchbuttonStyle,
                              onPressed: () {}, /// django 서버로 조건에 맞게 데이터 전송하는 비동기함수 구현 예정
                              child: Text('검색',
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                        ],
                      ),
                    ),
                  )),
                )));
            },)],
          )
        ]
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