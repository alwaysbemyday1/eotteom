import "package:flutter/material.dart";

class DropDownSeason extends StatelessWidget {
  const DropDownSeason({super.key});

  @override
  Widget build(BuildContext context) {
    getSeason (int nowmonth) {
      if ((nowmonth >= 3) && (nowmonth < 6)) {
        return '봄';
      } else if ((nowmonth >= 6) && (nowmonth < 8)) {
        return '여름';
      } else if ((nowmonth >= 9) && (nowmonth < 11)) {
        return '가을';
      } else {
        return '겨울';
      }
    }

    String nowseason = getSeason(DateTime.now().month.toInt());
    List<String> seasons = ["봄", "여름", "가을", "겨울"];
    var buttonSeason = seasons.map(
      (((e) => DropdownMenuItem(
        value: e,
        child: Text(e),
      )))
    ).toList();
    String selected_season = getSeason(DateTime.now().month.toInt());

    return DropdownButtonFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black)
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2)
        ),
        filled: false
      ),
      dropdownColor: Colors.white,
      value: selected_season,
      items: buttonSeason,
      onChanged: (index) {
        if (index == 0) {
          selected_season = '봄';
        } else if (index == 1) {
          selected_season = "여름";
        } else if (index == 2) {
          selected_season = "가을";
        } else {
          selected_season = "겨울";
        }
      },
    );
  }
}