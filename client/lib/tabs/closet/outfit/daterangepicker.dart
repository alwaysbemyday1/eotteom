import 'package:eotteom/tabs/closet/mycloset.dart';
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
      opacity: (context.watch<FilterState>().datecheck) ? 1.0 : 0.3,
      alwaysIncludeSemantics: true,
      child: AbsorbPointer(
        absorbing: !(context.watch<FilterState>().datecheck),
        child: SfDateRangePicker(
          headerStyle: DateRangePickerHeaderStyle(
            textAlign: TextAlign.center,
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: const Color(0xff131313)
            )
          ),

          onSelectionChanged: _onSelectionChanged,
          selectionMode: DateRangePickerSelectionMode.multiple,
          view: DateRangePickerView.year,
          showNavigationArrow: true,
          allowViewNavigation: false,
          startRangeSelectionColor: const Color(0xff131313),
          endRangeSelectionColor: const Color(0xff131313),
          rangeSelectionColor: Colors.grey,
          todayHighlightColor: const Color(0xff131313),
          selectionColor: const Color(0xff131313),
          yearCellStyle: DateRangePickerYearCellStyle(
            textStyle: TextStyle(color: const Color(0xff131313)),
            todayTextStyle: TextStyle(color: const Color(0xff131313)),
          ),
        ),
      ),
    );
  }

  void _onSelectionChanged(
      DateRangePickerSelectionChangedArgs dateRangePickerSelectionChangedArgs) {
    print(dateRangePickerSelectionChangedArgs.value);
    context
        .read<FilterState>()
        .selectDate(dateRangePickerSelectionChangedArgs.value);
  }
}

// https://help.syncfusion.com/flutter/daterangepicker/callbacks 조작법 참고

