import 'package:flutter/cupertino.dart';
import 'myCodi.dart';
import 'otherCodi.dart';
import 'randomCodi.dart';
import 'weatherCodi.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
            ),
            WeatherCodi(),
            MyCodi(),
            OtherCodi(),
            RandomCodi(),
            Container(
              height: 50,
            ),
          ],
        ));
  }
}








