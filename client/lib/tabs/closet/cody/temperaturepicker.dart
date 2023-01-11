import 'package:eotteom/tabs/closet/mycloset.dart';
import "package:flutter/material.dart";
import 'package:syncfusion_flutter_sliders/sliders.dart';
import "package:syncfusion_flutter_core/theme.dart";
import "package:provider/provider.dart";
import "checkbox.dart";

class TemperaturePicker extends StatefulWidget {
  const TemperaturePicker({super.key});

  @override
  State<TemperaturePicker> createState() => _TemperaturePickerState();
}


class _TemperaturePickerState extends State<TemperaturePicker> {
  SfRangeValues _values = SfRangeValues(0.0, 15.0); // 무조건 소수점 붙여서 double 자료형으로 할 것... 날아가버린 나의 시간...
  final int _min = -20;
  final int _max = 40;
  @override
  Widget build(BuildContext context) {
    
    return Opacity(
      opacity: (context.watch<FilterState>().temperaturecheck) ? 1.0 : 0.3,
      alwaysIncludeSemantics: true,
      child: AbsorbPointer(
      absorbing: !(context.watch<FilterState>().temperaturecheck),
      child: Column(
      children: [
        Text('${context.watch<FilterState>().lowtemperature == null ? 0.toString() : context.watch<FilterState>().lowtemperature.toString()}도 ~ ${context.watch<FilterState>().hightemperature == null ? 15.toString() : context.watch<FilterState>().hightemperature.toString()}도',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Container(
            child: SfRangeSliderTheme(
            data: SfRangeSliderThemeData(
              activeTickColor: Colors.black,
              inactiveTickColor: Colors.grey,
            ),
            child: SfRangeSlider(
            showLabels: true,
            min: _min,
            max: _max,
            interval: 20,
            minorTicksPerInterval: 4,
            showTicks: true,
            values: _values,
            activeColor: Colors.black,
            inactiveColor: Colors.grey,
            onChanged: (SfRangeValues newValues) {
              setState(() {
                _values = newValues;
              });
              context.read<FilterState>().setTemperature(_values);
            },
          ),
          )
        ),
      ],
    ),
    ),
      );
  }
}











// child: SliderTheme(
//         data: SliderThemeData(
//           activeTickMarkColor: Colors.black,
//           inactiveTickMarkColor: Colors.grey,
//           tickMarkShape: SliderTickMarkShape.noTickMark
//         ),
//         child: RangeSlider(
//           values: currentRangeValues,
//           max: 40,
//           min: -20,
//           divisions: 15,
//           activeColor: Colors.black,
//           inactiveColor: Colors.grey,
//           labels: RangeLabels(
//             currentRangeValues.start.round().toString(),
//             currentRangeValues.end.round().toString()
//           ),
//           onChanged: (RangeValues values) {
//             setState(() {
//               currentRangeValues = values;
//             });
//           },
//         ),
//       )