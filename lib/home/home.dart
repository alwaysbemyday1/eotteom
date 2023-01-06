import 'package:flutter/cupertino.dart';
import 'myCodi.dart';
import 'otherCodi.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('weatherCodi()'),
        MyCodi(),
        OtherCodi(),
        Text('randomCodi()'),
      ],
    );
  }
}








