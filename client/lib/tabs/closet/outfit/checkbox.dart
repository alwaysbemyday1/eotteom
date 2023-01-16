import 'package:eotteom/tabs/closet/mycloset.dart';
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class CheckboxWeather extends StatelessWidget {
  const CheckboxWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          activeColor: Colors.black,
          value: context.watch<FilterState>().datecheck,
          onChanged: (value) {
            context.read<FilterState>().changeDatecheck();
          },
        ),
        Text('날짜')
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
          activeColor: Colors.black,
          value: context.watch<FilterState>().temperaturecheck,
          onChanged: (value) {
            context.read<FilterState>().changeTemperaturecheck();
          },
        ),
        Text('기온')
      ],
    );
  }
}