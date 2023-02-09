import 'package:eotteom/provider.dart';
import 'package:eotteom/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Category extends StatefulWidget {
  Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  var line = 0;


  @override
  State<PopupMenu> createState() => _PopupMenuState();
}

class _PopupMenuState extends State<PopupMenu> {
  List<PopupMenuEntry<String>> getList() {
    List<PopupMenuEntry<String>> childs = [];
    childs.add(PopupMenuItem<String>(
      // 뭐 선택 됐는지
      height: 42,
      value: context.read<EnrollOutfit>().category,
      child: Container(
          width: 100.w - 32,
          alignment: Alignment.centerLeft,
          child: context.read<EnrollOutfit>().category != ''
              ? Text(context.read<EnrollOutfit>().category,
                  style: PopUpMenuSelectedTheme)
              : Text('스타일을 선택해주세요', style: PopUpMenuChildTheme)),
    ));
    childs.add(PopupMenuDivider(height: 0));

    for (int i = 0; i < 4; i++) {
      // 선택할 수 있는 리스트
      if (context.read<EnrollOutfit>().category !=
          context.read<EnrollOutfit>().categoryList[i]) {
        childs.add(PopupMenuItem<String>(
          value: context.read<EnrollOutfit>().categoryList[i],
          height: 44,
          child: Container(
              width: 100.w - 32,
              alignment: Alignment.centerLeft,
              child: Text(context.read<EnrollOutfit>().categoryList[i],
                  style: PopUpMenuSelectedTheme)),
        ));

      }
      childs.add(CupertinoButton(
          padding: EdgeInsets.all(0),
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: i % 4 == 3 ? 0 : 8),
            height: (100.w - 32 - 24) / 4 * 34 / 87,
            width: (100.w - 32 - 24) / 4,
            decoration: BoxDecoration(
                color: context.watch<EnrollOutfit>().category !=
                        context.watch<EnrollOutfit>().categoryList[i]
                    ? Color(0xffFFFFFF)
                    : Color(0xffD9D9D9),
                border: Border.all(
                    width: 1,
                    color: context.watch<EnrollOutfit>().category !=
                            context.watch<EnrollOutfit>().categoryList[i]
                        ? Color(0xffCACACA)
                        : Color(0xff131313)),
                borderRadius: BorderRadius.circular(5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                context.watch<EnrollOutfit>().category ==
                        context.watch<EnrollOutfit>().categoryList[i]
                    ? Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Icon(Icons.check, size: 18))
                    : SizedBox(width: 0, height: 0),
                Text(context.watch<EnrollOutfit>().categoryList[i],
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: "NotoSans",
                        color: context.watch<EnrollOutfit>().category !=
                                context.watch<EnrollOutfit>().categoryList[i]
                            ? Color(0xff9B9B9B)
                            : Color(0xff131313),
                        fontWeight: FontWeight.w400,
                        height: 1.3)),
              ],
            ),
          ),
          onPressed: () {
            context
                .read<EnrollOutfit>()
                .changeCategory(context.read<EnrollOutfit>().categoryList[i]);
          }));
    }

    return childs;
  }

  @override
  Widget build(BuildContext context) {
    line = 0;
    return Container(

      width: 100.w - 32,
      child: PopupMenuButton(
          // padding: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Color(0xffD9D9D9), width: 1),
              borderRadius: BorderRadius.circular(5)),
          offset: Offset(0, -20),
          constraints:
              BoxConstraints(maxWidth: 100.w - 32, minWidth: 100.w - 32),
          child: Container(
              width: 100.w - 32,
              padding: EdgeInsets.only(left: 16, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  context.watch<EnrollOutfit>().category != ''
                      ? Text(context.read<EnrollOutfit>().category,
                          style: PopUpMenuSelectedTheme)
                      : Text('스타일을 선택해주세요', style: PopUpMenuChildTheme),
                  Icon(FlutterRemix.arrow_down_s_line, size: 22)
                ],

              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: getList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: getList(),
          )
        ]));
  }
}
