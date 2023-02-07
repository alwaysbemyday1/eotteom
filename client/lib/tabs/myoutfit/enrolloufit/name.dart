import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:eotteom/provider.dart';

import '../../../style.dart';

class Name extends StatelessWidget {
  Name({super.key});

  var inputName;
  getName() {
    return inputName;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(16, 0, 16, 28),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 13),
              child: Text(
                '브랜드',
                style: enrollTitleTheme2,
              )),
          Container(
              height: 44,
              width: 100.w - 32,
              margin: EdgeInsets.only(right: 16),
              child: Focus(
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '기타 메모사항을 입력하세요',
                      hintStyle: TextStyle(
                          fontSize: 14,
                          color: Color(0xff9b9b9b),
                          fontFamily: "NotoSans",
                          fontWeight: FontWeight.w400,
                          height: 1.3),
                      filled: true,
                      fillColor: Color(0xffF3F3F3)),
                  onChanged: (text) {
                    inputName = text;
                  },
                ),
                onFocusChange: (hasFocus) {
                  if (hasFocus == false) {
                    context.read<EnrollOutfit>().changeName(inputName);
                    print(context.read<EnrollOutfit>().name);
                  }
                },
              ))
        ]));
  }
}
