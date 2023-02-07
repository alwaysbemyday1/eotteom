import "package:eotteom/provider.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class DropDownCloset extends StatefulWidget {
  const DropDownCloset({super.key});

  @override
  State<DropDownCloset> createState() => _DropDownClosetState();
}

class _DropDownClosetState extends State<DropDownCloset> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: context.watch<ClosetProvider>().selectDropdownCloset,
        style: TextStyle(color: Color(0xff151515)),
        items: context.watch<ClosetProvider>().dropdownlistCloset.map((String item) {
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
            context.read<ClosetProvider>().changeSelectedDropdownCloset(value);
          });
        });
  }
}