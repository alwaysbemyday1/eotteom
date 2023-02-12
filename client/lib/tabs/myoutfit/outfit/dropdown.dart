import "package:eotteom/provider.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:flutter_remix/flutter_remix.dart";


class DropDown extends StatefulWidget {
  const DropDown({super.key});

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      icon: const Icon(FlutterRemix.arrow_down_s_line, color: Color(0xff131313),),
      underline: const SizedBox.shrink(),
        value: context.watch<FilterProvider>().selectedDropdown,
        style: TextStyle(color: Color(0xff151515)),
        items: context.watch<FilterProvider>().dropdownlist.map((String item) {
          return DropdownMenuItem(
            child: Text(
              '$item',
              selectionColor: Color(0xff151515),
              style: TextStyle(fontFamily: "NotoSans", fontSize: 16.0),
            ),
            value: item,
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            context.read<FilterProvider>().changeSelectedDropdown(value);
          });
        });
  }
}
