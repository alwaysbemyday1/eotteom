import 'package:eotteom/provider.dart';
import 'package:eotteom/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Price extends StatelessWidget {
  Price({super.key});

  var inputPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(16, 0, 16, 28),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 13),
              child: Text(
                '가격',
                style: enrollTitleTheme2,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: 44,
                  width: 156,
                  margin: EdgeInsets.only(right: 16),
                  child: Focus(
                    child: TextField(
                        textAlign: TextAlign.right,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '숫자를 입력해주세요',
                            hintStyle: TextStyle(
                                fontSize: 14,
                                color: Color(0xff9b9b9b),
                                fontFamily: "NotoSans",
                                fontWeight: FontWeight.w400,
                                height: 1.3),
                            filled: true,
                            fillColor: Color(0xffF3F3F3)),
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                          ThousandsSeparatorInputFormatter()
                        ],
                        onChanged: (text) {
                          inputPrice = text;
                        }),
                    onFocusChange: (hasFocus) {
                      if (hasFocus == false) {
                        context.read<EnrollClothes>().changePrice(inputPrice);
                      }
                    },
                  )),
              Text('원',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: "NotoSans",
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      height: 1.3))
            ],
          )
        ]));
  }
}

// 1000원 단위 구분
class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  static const separator = ','; // Change this to '.' for other locales

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Short-circuit if the new value is empty
    if (newValue.text.length == 0) {
      return newValue.copyWith(text: '');
    }

    // Handle "deletion" of separator character
    String oldValueText = oldValue.text.replaceAll(separator, '');
    String newValueText = newValue.text.replaceAll(separator, '');

    if (oldValue.text.endsWith(separator) &&
        oldValue.text.length == newValue.text.length + 1) {
      newValueText = newValueText.substring(0, newValueText.length - 1);
    }

    // Only process if the old value and new value are different
    if (oldValueText != newValueText) {
      int selectionIndex =
          newValue.text.length - newValue.selection.extentOffset;
      final chars = newValueText.split('');

      String newString = '';
      for (int i = chars.length - 1; i >= 0; i--) {
        if ((chars.length - 1 - i) % 3 == 0 && i != chars.length - 1)
          newString = separator + newString;
        newString = chars[i] + newString;
      }

      return TextEditingValue(
        text: newString.toString(),
        selection: TextSelection.collapsed(
          offset: newString.length - selectionIndex,
        ),
      );
    }

    // If the new value and old value are the same, just return as-is
    return newValue;
  }
}
