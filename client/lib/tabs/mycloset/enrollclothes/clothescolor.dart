import 'package:eotteom/provider.dart';
import 'package:eotteom/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

class ClothesColor extends StatefulWidget {
  const ClothesColor({super.key});

  @override
  State<ClothesColor> createState() => _ClothesColorState();
}

class _ClothesColorState extends State<ClothesColor> {
  var color = -1;
  var line = 0;

  var colorList = [
    '블랙',
    '다크그레이',
    '그레이',
    '화이트',
    '아이보리',
    '베이지',
    '레드',
    '핑크',
    '핫핑크',
    '브라운',
    '카멜',
    '오렌지',
    '옐로우',
    '올리브그린',
    '올리브',
    '다크그린',
    '그린',
    '스카이블루',
    '블루',
    '라이트블루',
    '네이비',
    '퍼플',
  ];

  var hexColorList = [
    [0xff131313],
    [0xff676B71],
    [0xff9F9F9F, 0xffE2E2E2],
    [0xffFFFFFF],
    [0xffFCF6EE],
    [0xffF0DBBC],
    [0xffAE1930, 0xffE92311],
    [0xffF5B4A8],
    [0xffE42493],
    [0xff843215],
    [0xffD7A24F],
    [0xffF86A1B],
    [0xffF6E431],
    [0xffCAC031],
    [0xff6D6C3C],
    [0xff1B4221],
    [0xff5AC13C],
    [0xff58C0E7],
    [0xff2410DC],
    [0xffC9DEEF, 0xA0CAF6],
    [0xff1C2F57, 0xff4360BE],
    [0xff861CB2],
  ];

  List<Widget> getList() {
    List<Widget> childs = [];
    for (int i = line * 6; i < 6 + line * 6; i++) {
      childs.add(CupertinoButton(
          padding: EdgeInsets.all(0),
          child: hexColorList[i].length != 2
              ? Container(
                  margin: EdgeInsets.only(right: i % 6 == 5 ? 0 : 8),
                  height: (100.w - 32 - 45) / 6,
                  width: (100.w - 32 - 45) / 6,
                  decoration: BoxDecoration(
                    color: Color(int.parse(hexColorList[i][0].toString())),
                    border: Border.all(width: 1, color: Color(0xffCACACA)),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: color == i ? Icon(CupertinoIcons.check_mark) : null)
              : Container(
                  margin: EdgeInsets.only(right: i % 6 == 5 ? 0 : 8),
                  height: (100.w - 32 - 45) / 6,
                  width: (100.w - 32 - 45) / 6,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Color(0xffCACACA)),
                    borderRadius: BorderRadius.circular(5),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(int.parse(hexColorList[i][1].toString())),
                        Color(int.parse(hexColorList[i][0].toString())),
                      ],
                    ),
                  )),
          onPressed: () {
            setState(() {
              color = i;
              line = 0;
              context.read<EnrollClothes>().color = colorList[color];
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
                color == -1
                    ? Container(
                        margin: EdgeInsets.only(right: 16),
                        height: (100.w - 32 - 45) / 6 * 1.2,
                        width: (100.w - 32 - 45) / 6 * 1.2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xffCACACA)),
                        child: Icon(
                          CupertinoIcons.question,
                          size: 15,
                          color: Color(0xffFFFFFF),
                        ))
                    : Container(
                        margin: EdgeInsets.only(right: 16),
                        height: (100.w - 32 - 45) / 6 * 1.2,
                        width: (100.w - 32 - 45) / 6 * 1.2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  hexColorList[color].length != 2
                                      ? Color(int.parse(
                                          hexColorList[color][0].toString()))
                                      : Color(int.parse(
                                          hexColorList[color][1].toString())),
                                  Color(int.parse(
                                      hexColorList[color][0].toString())),
                                ])),
                        child: null),
                Container(
                    alignment: Alignment.centerLeft,
                    height: 44,
                    width: 100.w - 48 - (100.w - 32 - 45) / 6 * 1.2,
                    padding: EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Color(0xffD9D9D9), width: 1)),
                    child: Text(color != -1 ? colorList[color] : '무슨 색상인가요?',
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
