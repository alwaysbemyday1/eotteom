import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:eotteom/provider.dart';

import '../../../style.dart';

class CodiDate extends StatefulWidget {
  CodiDate({super.key});

  @override
  State<CodiDate> createState() => _CodiDateState();
}

class _CodiDateState extends State<CodiDate> {
  DateTime? date = new DateTime.now();

  pickDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(), //get today's date
        firstDate: DateTime(
            2000), //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2101));
    setState(() {
      date = pickedDate;
    });
  }

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
        width: (100.w - 32 - 40) / 3 * 2 + 24,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              margin: EdgeInsets.only(bottom: 13),
              child: Text(
                '날짜',
                style: enrollTitleTheme2,
              )),
          Container(
              alignment: Alignment.centerLeft,
              width: (100.w - 32 - 40) / 3 * 2 + 24,
              height: 44,
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffD9D9D9), width: 1),
                  borderRadius: BorderRadius.circular(5)),
              child: TextButton(
                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                child: Container(
                  width: (100.w - 32 - 40) / 3 * 2 + 24,
                  padding: EdgeInsets.only(left: 16.5),
                  alignment: Alignment.centerLeft,
                  child: Text(
                      '${date?.year}.${date?.month}.${date?.day}(' +
                          getWeekday(date?.weekday.toInt()) +
                          ')',
                      style: basicTextTheme2),
                ),
                onPressed: () {
                  pickDate();
                },
              ))
        ]));
  }
}
