import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:eotteom/tabs/myoutfit/myoutfit.dart";

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
          value: context.watch<FilterProvider>().datecheck,
          onChanged: (value) {
            context.read<FilterProvider>().changeDatecheck();
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
          value: context.watch<FilterProvider>().temperaturecheck,
          onChanged: (value) {
            context.read<FilterProvider>().changeTemperaturecheck();
          },
        ),
        Text('기온', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700))
      ],
    );
  }
}
