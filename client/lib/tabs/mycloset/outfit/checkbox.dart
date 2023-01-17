import 'package:eotteom/tabs/mycloset/mycloset.dart';
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class CheckboxWeather extends StatelessWidget {
  const CheckboxWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          activeColor: Colors.black,
          value: context.watch<FilterState>().datecheck,
          onChanged: (value) {
            context.read<FilterState>().changeDatecheck();
          },
        ),
        Text(
          '날짜',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        )
      ],
    );
  }
}

class CheckboxTemperature extends StatelessWidget {
  const CheckboxTemperature({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          activeColor: Colors.black,
          value: context.watch<FilterState>().temperaturecheck,
          onChanged: (value) {
            context.read<FilterState>().changeTemperaturecheck();
          },
        ),
        Text('기온', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700))
      ],
    );
  }
}
