import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:eotteom/provider.dart';

import '../../../style.dart';

class OutfitCategory extends StatelessWidget {
  OutfitCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Container(
          width: 100.w - 32,
          margin: EdgeInsets.fromLTRB(16, 0, 16, 27),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 13),
                child: Text(
                  '코디 카테고리',
                  style: enrollTitleTheme2,
                )),
            Container(
                alignment: Alignment.center,
                width: 100.w - 32,
                height: 44,
                margin: EdgeInsets.only(right: 11),
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffD9D9D9), width: 1),
                    borderRadius: BorderRadius.circular(5)),
                child: PopupMenu())
          ])),
    );
  }
}

class PopupMenu extends StatefulWidget {
  PopupMenu({super.key});

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
                  style: basicTextTheme)
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
                  style: basicTextTheme)),
        ));
      }
    }

    return childs;
  }

  @override
  Widget build(BuildContext context) {
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
                          style: basicTextTheme)
                      : Text('스타일을 선택해주세요', style: PopUpMenuChildTheme),
                  Icon(FlutterRemix.arrow_down_s_line, size: 22)
                ],
              )),
          onSelected: (String selected) {
            context.read<EnrollOutfit>().changeCategory(selected);
          },
          itemBuilder: (BuildContext context) => getList()),
    );
  }
}
