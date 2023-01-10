// import "package:flutter/material.dart";

// class DropDownTemperature extends StatefulWidget {
//   const DropDownTemperature({super.key});

//   @override
//   State<DropDownTemperature> createState() => _DropDownTemperatureState();
// }

// class _DropDownTemperatureState extends State<DropDownTemperature> {
//   RangeValues currentRangeValues = const RangeValues(-15, 20);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: SliderTheme(
//         data: SliderThemeData(
//           thumbShape: RoundSliderThumbShape(elevation: 0.0),
//         ),
//         child: RangeSlider(
//           values: currentRangeValues,
//           max: 45,
//           min: -30,
//           divisions: 15,
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
//       ),
//     );
//   }
// }
