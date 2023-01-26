import "package:eotteom/tabs/myoutfit/outfit/outfit.dart";
import 'package:eotteom/tabs/myoutfit/outfit/outfit_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "package:syncfusion_flutter_sliders/sliders.dart";

import 'package:flutter_localizations/flutter_localizations.dart';

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
          backgroundColor: Colors.white,
          appBar: appbarOutfit,
          body: Cody(),
        ),
      ),
    );
  }
}

class FilterProvider extends ChangeNotifier {
  bool datecheck = true;
  bool temperaturecheck = true;
  int nowyear = DateTime.now().year.toInt();
  var select_date;
  var hightemperature;
  var lowtemperature;
  var temperatures = SfRangeValues(0.0, 15.0);

  changeDatecheck() {
    datecheck = !datecheck;
    notifyListeners();
  }

  changeTemperaturecheck() {
    temperaturecheck = !temperaturecheck;
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
}