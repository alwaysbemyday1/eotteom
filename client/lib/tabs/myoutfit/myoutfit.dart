import "package:eotteom/tabs/myoutfit/outfit/outfit.dart";
import 'package:eotteom/tabs/myoutfit/outfit/outfit_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "package:syncfusion_flutter_sliders/sliders.dart";

import 'package:flutter_localizations/flutter_localizations.dart';

import 'enrolloufit/enroll.dart';

class Outfit extends StatelessWidget {
  const Outfit({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FilterProvider(),
      child: MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [const Locale('ko')],
        locale: Locale('ko'),
        home: Scaffold(
          floatingActionButton: FloatingActionButton(
              child: Text('코디 등록하기'),
              onPressed: () {
                Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(builder: (context) => EnrollOutfit()));
              }),
          backgroundColor: Colors.white,
          appBar: appbarOutfit,
          body: Cody(),
        ),
      ),
    );
  }
}

class FilterProvider extends ChangeNotifier {
  List<String> dropdownlist = ["전체", "좋아요만"];
  String selectedDropdown = "전체";
  bool datecheck = true;
  bool temperaturecheck = true;
  bool labelcheck = true;
  int nowyear = DateTime.now().year.toInt();
  var select_date;
  var hightemperature;
  var lowtemperature;
  var temperatures = SfRangeValues(0.0, 15.0);

  List<String> outfitLabel = ["댄디룩", "스트릿룩", "캐쥬얼룩"];
  List<bool> outfitLabelSelect = [true, true, true];

  changeDatecheck() {
    datecheck = !datecheck;
    notifyListeners();
  }

  changeTemperaturecheck() {
    temperaturecheck = !temperaturecheck;
    notifyListeners();
  }

  changeLabelCheck() {
    labelcheck = !labelcheck;
    notifyListeners();
  }

  changeoutfitLabelSelect(int index) {
    outfitLabelSelect[index] = !outfitLabelSelect[index];
    notifyListeners();
  }

  addYear() {
    nowyear++;
    notifyListeners();
  }

  minusYear() {
    nowyear--;
    notifyListeners();
  }

  selectDate(value) {
    select_date = value;
    notifyListeners();
  }

  setTemperature(value) {
    temperatures = value;
    hightemperature = value.end.toInt();
    lowtemperature = value.start.toInt();
    notifyListeners();
  }

  resetFilter() {
    select_date.clear();
    temperatures = SfRangeValues(0.0, 15.0);
    hightemperature = temperatures.end.toInt();
    lowtemperature = temperatures.start.toInt();
    notifyListeners();
  }
  changeSelectedDropdown(value) {
    selectedDropdown = value;
    print(selectedDropdown);
    notifyListeners();
  }
}

