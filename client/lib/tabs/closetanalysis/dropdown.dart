import 'package:flutter/material.dart';

class Dropdown extends StatelessWidget {
  Dropdown({Key? key, this.changeDropdown, this.selected_dropdown}) : super(key: key);
  final changeDropdown;
  final selected_dropdown;
  var dropdownitems = [
    DropdownMenuItem(child: Text('전체'), value: "전체",),
    DropdownMenuItem(child: Text('상의'), value: "상의",),
    DropdownMenuItem(child: Text('하의'), value: "하의",),
    DropdownMenuItem(child: Text('악세사리'), value: "악세사리",)
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none
      ),
      dropdownColor: Colors.white,
      value: selected_dropdown,
      onChanged: (newValue) {
        changeDropdown(newValue);
      },
      items: dropdownitems,
      isExpanded: true,
      isDense: true,
    );
  }
}