import 'package:flutter/material.dart';

class Dropdown extends StatelessWidget {
  Dropdown({Key? key, this.changeDropdown, this.selected_dropdown}) : super(key: key);
  // var dropdownlist = ['전체', '날짜', '계절', '날씨'];
  final changeDropdown;
  final selected_dropdown;
  var dropdownitems = [
    DropdownMenuItem(child: Text('전체'), value: "전체",),
    DropdownMenuItem(child: Text('날짜'), value: "날짜",),
    DropdownMenuItem(child: Text('계절'), value: "계절",),
    DropdownMenuItem(child: Text('날씨'), value: "날씨",)
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2)
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2),
        ),
        filled: false
      ),
      dropdownColor: Colors.white,
      value: selected_dropdown,
      onChanged: (newValue) {
        changeDropdown(newValue);
      },
      items: dropdownitems,
    );
  }
}