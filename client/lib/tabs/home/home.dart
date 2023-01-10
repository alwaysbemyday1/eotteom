import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
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
        child:Container(
          width: (phoneWidth-24)-8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100,
              ),
              WeatherCodi(phoneHeight:phoneHeight, phoneWidth:phoneWidth),
              MyCodi(phoneHeight:phoneHeight, phoneWidth:phoneWidth),
              OtherCodi(phoneHeight:phoneHeight, phoneWidth:phoneWidth),
              RandomCodi(phoneHeight:phoneHeight, phoneWidth:phoneWidth)
              ,
              Container(
                height: 50,
              ),
            ],
          ),
        ));
  }
}








