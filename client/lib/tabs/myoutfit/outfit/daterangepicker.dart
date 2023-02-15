import "package:eotteom/provider.dart";
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class MonthRangePick extends StatefulWidget {
  const MonthRangePick({super.key});

  @override
  State<MonthRangePick> createState() => _MonthRangePickState();
}

class _MonthRangePickState extends State<MonthRangePick> {
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: (context.watch<FilterProvider>().datecheck) ? 1.0 : 0.3,
      alwaysIncludeSemantics: true,
      child: AbsorbPointer(
        absorbing: !(context.watch<FilterProvider>().datecheck),
        child: Container(
          color: Color(0xffFFFFFF),
          child: SfDateRangePicker(
            maxDate: DateTime.now(),
            selectionShape: DateRangePickerSelectionShape.rectangle,
            headerStyle: DateRangePickerHeaderStyle(
                textAlign: TextAlign.center,
                textStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Color(0xff131313),
                    fontSize: 16)), // 달력에서 화살표 넘어다니는 부분
            onSelectionChanged: _onSelectionChanged,
            selectionMode: DateRangePickerSelectionMode.multiple,
            view: DateRangePickerView.year,
            showNavigationArrow: true,
            allowViewNavigation: false,
            todayHighlightColor: Colors.black,
            startRangeSelectionColor: Colors.black,
          endRangeSelectionColor: Colors.black,
            selectionColor: Color(0xffFFFFFF),
            yearCellStyle: DateRangePickerYearCellStyle(
              textStyle: TextStyle(color: Colors.black),
              todayTextStyle: TextStyle(color: Colors.black),
            ),
            selectionTextStyle: TextStyle(
                fontFamily: "NotoSans",
                fontSize: 14.0,
                fontWeight: FontWeight.w700,
                color: Color(0xff131313)),
          ),
        ),
      ),
    );
  }

  void _onSelectionChanged(
      DateRangePickerSelectionChangedArgs dateRangePickerSelectionChangedArgs) {
    context
        .read<FilterProvider>()
        .selectDate(dateRangePickerSelectionChangedArgs);
  }
}

// https://help.syncfusion.com/flutter/daterangepicker/callbacks 조작법 참고

