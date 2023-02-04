import 'package:eotteom/provider.dart';
import 'package:eotteom/style.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

class Memo extends StatelessWidget {
  Memo({super.key});

  var inputMemo;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(16, 0, 16, 28),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 13),
              child: Text(
                '메모',
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
                    hintText: '기타 메모사항을 입력해주세요',
                    hintStyle: TextStyle(
                        fontSize: 14,
                        color: Color(0xff9b9b9b),
                        fontFamily: "NotoSans",
                        fontWeight: FontWeight.w400,
                        height: 1.3),
                    filled: true,
                    fillColor: Color(0xffF3F3F3)),
                onChanged: (text) {
                  inputMemo = text;
                },
              ),
              onFocusChange: (hasFocus) {
                if (hasFocus == false) {
                  context.read<EnrollClothes>().changeMemo(inputMemo);
                }
              },
            ),
          )
        ]));
  }
}
