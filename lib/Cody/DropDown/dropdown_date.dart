import "package:flutter/material.dart";

class DropDownYear extends StatelessWidget {
  DropDownYear({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nowyear = DateTime.now().year;
    List<int> year = List.generate(7, (int index) => nowyear.toInt() - index);
    int selected_year = nowyear.toInt(); // 기본이 현재 해(year)
    var buttonYear = year.map(
      ((e) => DropdownMenuItem(
        value: e,
        child: Text(e.toString()),
      ))
    ).toList();
    return DropdownButtonFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2)
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2)
        ),
        filled: false
      ),
      dropdownColor: Colors.white,
      value: selected_year,
      items: buttonYear,
      onChanged: (index) {
        selected_year = nowyear.toInt() - index!;
      },
    );
  }
}

class DropDownMonth extends StatelessWidget {
  const DropDownMonth({super.key});

  @override
  Widget build(BuildContext context) {
    var nowmonth = DateTime.now().month;
    List<int> month = List.generate(12, (int index) => index+1);
    int selected_month = nowmonth.toInt();
    var buttonMonth = month.map(
      ((e) => DropdownMenuItem(
        value: e,
        child: Text(e.toString()),
      ))
    ).toList();

    return DropdownButtonFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2)
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2)
        ),
        filled: false
      ),
      dropdownColor: Colors.white,
      value: selected_month,
      items: buttonMonth,
      onChanged: (index) {
        selected_month = index! + 1; // index 이므로 월을 알기 위해선 1 더해주는 게 좋음
      },
    );
  }
}
