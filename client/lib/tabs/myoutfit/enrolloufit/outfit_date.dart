import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
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
  DateTime? date = DateTime.now();

  pickDate() async {
    DateTime? pickedDate = await showRoundedDatePicker(
        context: context,
        height: 330,
        styleDatePicker: MaterialRoundedDatePickerStyle(
            paddingMonthHeader: EdgeInsets.all(20),
            sizeArrow: 30,
            marginLeftArrowPrevious: 8,
            marginTopArrowNext: 8,
            textStyleYearButton: TextStyle(
                fontSize: 25,
                fontFamily: "NotoSans",
                color: Color(0xffffffff),
                fontWeight: FontWeight.w400,
                height: 1.3),
            textStyleDayButton: TextStyle(
                fontSize: 20,
                fontFamily: "NotoSans",
                color: Color(0xffffffff),
                fontWeight: FontWeight.w400,
                height: 1.3),
            textStyleButtonPositive: TextStyle(
                fontSize: 14,
                fontFamily: "NotoSans",
                color: Color(0xff131313),
                fontWeight: FontWeight.w400,
                height: 1.3),
            textStyleButtonNegative: TextStyle(
                fontSize: 14,
                fontFamily: "NotoSans",
                color: Color(0xff131313),
                fontWeight: FontWeight.w400,
                height: 1.3),
            decorationDateSelected: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(color: Color(0xff131313), width: 1)),
            textStyleDayOnCalendar: TextStyle(
                fontSize: 14,
                fontFamily: "NotoSans",
                color: Color(0xff131313),
                fontWeight: FontWeight.w400,
                height: 1.3),
            textStyleDayOnCalendarSelected: TextStyle(
                fontSize: 14,
                fontFamily: "NotoSans",
                color: Color(0xff131313),
                fontWeight: FontWeight.w700,
                height: 1.3),
            textStyleCurrentDayOnCalendar: TextStyle(
                fontSize: 14,
                fontFamily: "NotoSans",
                color: Color(0xff131313),
                fontWeight: FontWeight.w600,
                height: 1.3)),
        theme: ThemeData(
          primaryColor: Color(0xff131313),
        ),
        description: '날짜를 선택하세요',
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
        margin: EdgeInsets.only(right: 15),
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
