import 'package:flutter/cupertino.dart';
import 'myCodi.dart';
import 'otherCodi.dart';
import 'randomCodi.dart';
import 'weatherCodi.dart';

class Home extends StatelessWidget {
  const Home({super.key, this.phoneHeight, this.phoneWidth});
  final phoneHeight;
  final phoneWidth;

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
            MyCodi(phoneHeight:phoneHeight, phoneWidth:phoneWidth),
            OtherCodi(),
            RandomCodi(),
            Container(
              height: 50,
            ),
          ],
        ));
  }
}








