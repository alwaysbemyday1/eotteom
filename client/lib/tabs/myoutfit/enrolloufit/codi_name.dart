import 'package:eotteom/provider.dart';
import 'package:eotteom/style.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

class Codi_Name extends StatelessWidget {
  Codi_Name({super.key});

  var inputName;

  DateTime? date = new DateTime.now();

  getWeekday(int? weekday) {
    if (weekday == 1) {
      return '월';
    } else if (weekday == 2) {
      return '화';
    } else if (weekday == 3) {
      return '수';
    } else if (weekday == 4) {
      return '목';
    } else if (weekday == 5) {
      return '금';
    } else if (weekday == 6) {
      return '토';
    } else if (weekday == 7) {
      return '일';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(16, 0, 16, 28),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 13),
              child: Text(
                '코디 이름',
                style: enrollTitleTheme2,
              )),
          Container(
            height: 44,
            width: 100.w - 32,
            margin: EdgeInsets.only(right: 16),
            child: Focus(
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '${date?.year}.${date?.month}.${date?.day}.(' +
                        getWeekday(date?.weekday.toInt()) +
                        ') 의 코디',
                    hintStyle: TextStyle(
                        fontSize: 16,
                        color: Color(0xff9b9b9b),
                        fontFamily: "NotoSans",
                        fontWeight: FontWeight.w400,
                        height: 1.3),
                    filled: true,
                    fillColor: Color(0xffF3F3F3)),
                onChanged: (text) {
                  inputName = text;
                },
              ),
              onFocusChange: (hasFocus) {
                if (hasFocus == false) {
                  context.read<EnrollOutfit>().changeName(inputName);
                }
              },
            ),
          )
        ]));
  }
}
