import 'package:flutter/material.dart';


class Closet extends StatefulWidget {
  const Closet({super.key});

  @override
  State<Closet> createState() => _ClosetState();
}

class _ClosetState extends State<Closet> {
  var categoryPressed = [true, false, false, false, false, false];
  var categories = ['상의', '하의', '아우터', '신발', '악세사리', '원피스'];
  int closetState = 0;

  changePressed (int index) {
    setState(() {
      for (int i = 0; i < categoryPressed.length; i++) {
        if (i == index) {
          categoryPressed[i] = true;
        } else {
          categoryPressed[i] = false;
        }
        closetState = index;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(child: Text(categories[0], style: TextStyle(color: categoryPressed[0] ? Colors.white : Colors.black),), onPressed: () {changePressed(0);}, style: ButtonStyle(backgroundColor: MaterialStateProperty.all(categoryPressed[0] ? Colors.black : Colors.white)),),
            TextButton(child: Text(categories[1], style: TextStyle(color: categoryPressed[1] ? Colors.white : Colors.black),), onPressed: () {changePressed(1);}, style: ButtonStyle(backgroundColor: MaterialStateProperty.all(categoryPressed[1] ? Colors.black : Colors.white)),),
            TextButton(child: Text(categories[2], style: TextStyle(color: categoryPressed[2] ? Colors.white : Colors.black),), onPressed: () {changePressed(2);}, style: ButtonStyle(backgroundColor: MaterialStateProperty.all(categoryPressed[2] ? Colors.black : Colors.white)),),
            TextButton(child: Text(categories[3], style: TextStyle(color: categoryPressed[3] ? Colors.white : Colors.black),), onPressed: () {changePressed(3);}, style: ButtonStyle(backgroundColor: MaterialStateProperty.all(categoryPressed[3] ? Colors.black : Colors.white)),),
            TextButton(child: Text(categories[4], style: TextStyle(color: categoryPressed[4] ? Colors.white : Colors.black),), onPressed: () {changePressed(4);}, style: ButtonStyle(backgroundColor: MaterialStateProperty.all(categoryPressed[4] ? Colors.black : Colors.white)),),
            TextButton(child: Text(categories[5], style: TextStyle(color: categoryPressed[4] ? Colors.white : Colors.black),), onPressed: () {changePressed(4);}, style: ButtonStyle(backgroundColor: MaterialStateProperty.all(categoryPressed[5] ? Colors.black : Colors.white)),),
          ],
        ),
        ),
        closetWidgets[closetState]
      ],
    );
  }
}

var closetWidgets = [Text('예시1'), Text('예시2'), Text('예시3'), Text('예시4'), Text('예시5'), Text('예시6')];
// 이제 옷장 보여지는 Custom Widget으로 추가 예정