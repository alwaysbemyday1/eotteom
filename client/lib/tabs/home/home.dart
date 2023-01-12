import 'package:flutter/cupertino.dart';
import 'myOutfit.dart';
import 'otherOutfit.dart';
import 'randomOutfit.dart';
import 'weatherOutfit.dart';

class Home extends StatelessWidget {
  const Home({super.key, this.phoneHeight, this.phoneWidth});
  final phoneHeight;
  final phoneWidth;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: (phoneWidth - 24) - 8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100,
              ),
              WeatherOutfit(phoneHeight: phoneHeight, phoneWidth: phoneWidth),
              MyOutfit(phoneHeight: phoneHeight, phoneWidth: phoneWidth),
              OtherOutfit(phoneHeight: phoneHeight, phoneWidth: phoneWidth),
              RandomOutfit(phoneHeight: phoneHeight, phoneWidth: phoneWidth),
              Container(
                height: 50,
              ),
            ],
          ),
        ));
  }
}
