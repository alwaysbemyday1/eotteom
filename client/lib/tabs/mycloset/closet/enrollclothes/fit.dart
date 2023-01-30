import 'package:eotteom/provider.dart';
import 'package:eotteom/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Fit extends StatefulWidget {
  Fit({super.key});

  @override
  State<Fit> createState() => _FitState();
}

class _FitState extends State<Fit> {
  List<Widget> getList() {
    List<Widget> childs = [];
    for (int i = 0; i < context.watch<EnrollClothes>().fitList.length; i++) {
      childs.add(CupertinoButton(
          padding: EdgeInsets.all(0),
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: i % 3 == 2 ? 0 : 9),
            height: (100.w - 32 - 45) / 6,
            width: (100.w - 32 - 18) / 3,
            decoration: BoxDecoration(
                color: context.watch<EnrollClothes>().fit !=
                        context.watch<EnrollClothes>().fitList[i]
                    ? Color(0xffFFFFFF)
                    : Color(0xff131313),
                border: Border.all(width: 1, color: Color(0xffCACACA)),
                borderRadius: BorderRadius.circular(5)),
            child: Text(context.watch<EnrollClothes>().fitList[i],
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: "NotoSans",
                    color: context.watch<EnrollClothes>().fit !=
                            context.watch<EnrollClothes>().fitList[i]
                        ? Color(0xff9B9B9B)
                        : Colors.white,
                    fontWeight: FontWeight.w400,
                    height: 1.3)),
          ),
          onPressed: () {
            context
                .read<EnrollClothes>()
                .changeFit(context.read<EnrollClothes>().fitList[i]);
          }));
    }

    return childs;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(16, 0, 16, 28),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 13),
              child: Text(
                '핏',
                style: enrollTitleTheme2,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: getList(),
          )
        ]));
  }
}
