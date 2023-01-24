import 'package:eotteom/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

class ClothesColor extends StatefulWidget {
  const ClothesColor({super.key});

  @override
  State<ClothesColor> createState() => _ClothesColorState();
}

class _ClothesColorState extends State<ClothesColor> {
  var color = 100;
  var line = 0;
  var colorList = [
    '빨강',
    '주황',
    '노랑/옐로우/머스타드',
    '그린',
    '하늘',
    '파랑',
    '보라',
    '똥',
    '화이트',
    '그레이',
    '블랙'
  ];
  var hexColorList = [
    0xffD33030,
    0xffF38535,
    0xffEAEE19,
    0xff6AE431,
    0xff73BCFF,
    0xff3372EC,
    0xff9C33DC,
    0xffA16464,
    0xffFFFFFF,
    0xff949494,
    0xff131313
  ];

  List<Widget> getList() {
    List<Widget> childs = [];
    for (int i = line * 6; i < 6 + line * 6; i++) {
      childs.add(CupertinoButton(
          padding: EdgeInsets.all(0),
          child: Container(
              margin: EdgeInsets.only(right: i % 6 == 5 ? 0 : 8),
              height: (100.w - 32 - 45) / 6,
              width: (100.w - 32 - 45) / 6,
              decoration: BoxDecoration(
                  color: Color(hexColorList[i]),
                  border: Border.all(width: 1, color: Color(0xffCACACA)),
                  borderRadius: BorderRadius.circular(5)),
              child: color == i ? Icon(CupertinoIcons.check_mark) : null),
          onPressed: () {
            setState(() {
              color = i;
              line = 0;
            });
          }));
      if (colorList.length == (i + 1)) {
        break;
      }
    }

    setState(() {
      line++;
    });

    return childs;
  }

  @override
  Widget build(BuildContext context) {
    line = 0;
    return Container(
        margin: EdgeInsets.fromLTRB(16, 0, 16, 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.only(bottom: 14, right: 16),
                child: Text(
                  '색상',
                  style: enrollTitleTheme2,
                )),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Container(
                    margin: EdgeInsets.only(right: 16),
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: color != 100
                            ? Color(hexColorList[color])
                            : Color(0xffCACACA)),
                    child: color != 100
                        ? null
                        : Icon(
                            CupertinoIcons.question,
                            size: 15,
                            color: Color(0xffFFFFFF),
                          )),
                Container(
                    alignment: Alignment.centerLeft,
                    height: 44,
                    width: 100.w - 48 - 60,
                    padding: EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Color(0xffD9D9D9), width: 1)),
                    child: Text(color != 100 ? colorList[color] : '무슨 색상인가요?',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: "NotoSans",
                            color: color != 100
                                ? Color(0xff131313)
                                : Color(0xff9B9B9B),
                            fontWeight: FontWeight.w400,
                            height: 1.3)))
              ]),
            ),
            Container(
                margin: EdgeInsets.only(bottom: 8),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: getList())),
            Container(
                margin: EdgeInsets.only(bottom: 8),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: getList())),
          ],
        ));
  }
}
