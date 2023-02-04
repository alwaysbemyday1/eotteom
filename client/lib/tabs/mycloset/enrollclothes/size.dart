import 'package:eotteom/provider.dart';
import 'package:eotteom/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

class Size extends StatefulWidget {
  Size({super.key});

  @override
  State<Size> createState() => _SizeState();
}

class _SizeState extends State<Size> {
  List<Widget> getList() {
    List<Widget> childs = [];
    for (int i = 0; i < 6; i++) {
      childs.add(CupertinoButton(
          padding: EdgeInsets.all(0),
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: i % 6 == 5 ? 0 : 9),
            height: (100.w - 32 - 45) / 6,
            width: (100.w - 32 - 45) / 6,
            decoration: BoxDecoration(
                color: context.watch<EnrollClothes>().size !=
                        context.watch<EnrollClothes>().sizeList[i]
                    ? Color(0xffFFFFFF)
                    : Color(0xffD9D9D9),
                border: Border.all(
                    width: 1,
                    color: context.watch<EnrollClothes>().size !=
                            context.watch<EnrollClothes>().sizeList[i]
                        ? Color(0xffCACACA)
                        : Color(0xff131313)),
                borderRadius: BorderRadius.circular(5)),
            child: Text(context.watch<EnrollClothes>().sizeList[i],
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: "NotoSans",
                    color: context.watch<EnrollClothes>().size !=
                            context.watch<EnrollClothes>().sizeList[i]
                        ? Color(0xff9B9B9B)
                        : Color(0xff131313),
                    fontWeight: FontWeight.w400,
                    height: 1.3)),
          ),
          onPressed: () {
            context
                .read<EnrollClothes>()
                .changeSize(context.read<EnrollClothes>().sizeList[i]);
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
                '사이즈',
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
