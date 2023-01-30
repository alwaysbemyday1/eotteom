import 'package:eotteom/provider.dart';
import 'package:eotteom/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Catetory extends StatelessWidget {
  const Catetory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(16, 0, 16, 32),
        width: 100.w - 32,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.only(bottom: 8),
                child: Text('카테고리', style: enrollTitleTheme)),
            Container(
              margin: EdgeInsets.only(bottom: 8),
              child: Row(children: [
                Container(
                    margin:
                        EdgeInsets.only(right: (100.w - 32 - 41) / 2 + 29 - 26),
                    child: Text('대분류', style: basicTextTheme)),
                Container(child: Text('중분류', style: basicTextTheme))
              ]),
            ),
            Container(
              width: 100.w - 32,
              child: Row(children: [
                Container(
                    alignment: Alignment.center,
                    width: (100.w - 32 - 41) / 2,
                    height: 44,
                    margin: EdgeInsets.only(right: 11),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffD9D9D9), width: 1),
                        borderRadius: BorderRadius.circular(5)),
                    child: PopupMenu(
                      flag: true,
                      categoryList: context
                          .watch<EnrollClothes>()
                          .categoryList
                          .keys
                          .toList(),
                    )),
                Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(right: 12),
                    child: Icon(
                      CupertinoIcons.right_chevron,
                      size: 18,
                    )),
                Container(
                    width: (100.w - 32 - 41) / 2,
                    alignment: Alignment.center,
                    height: 44,
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffD9D9D9), width: 1),
                        borderRadius: BorderRadius.circular(5)),
                    child: PopupMenu(
                      flag: false,
                      categoryList:
                          context.watch<EnrollClothes>().bigCategory != '선택해주세요'
                              ? context.watch<EnrollClothes>().categoryList[
                                  context.watch<EnrollClothes>().bigCategory]
                              : ['대분류를 먼저 선택해주세요'],
                    ))
              ]),
            )
          ],
        ));
  }
}

class PopupMenu extends StatefulWidget {
  PopupMenu({super.key, this.flag, this.categoryList});

  var flag; // true is big, false is small
  var categoryList;

  @override
  State<PopupMenu> createState() => _PopupMenuState();
}

class _PopupMenuState extends State<PopupMenu> {
  List<PopupMenuEntry<String>> getList() {
    List<PopupMenuEntry<String>> childs = [];
    childs.add(PopupMenuItem<String>(
      // 뭐 선택 됐는지
      height: 42,
      value: widget.flag == true
          ? context.read<EnrollClothes>().bigCategory
          : context.read<EnrollClothes>().smallCategory,
      child: Container(
          width: (100.w - 32 - 41) / 2,
          alignment: Alignment.centerLeft,
          child: Text(
              widget.flag == true
                  ? context.read<EnrollClothes>().bigCategory
                  : context.read<EnrollClothes>().smallCategory,
              style: basicTextTheme)),
    ));
    childs.add(PopupMenuDivider(height: 0));
    // childs.add(PopupMenuItem<String>(
    //     // divider
    //     height: 7,
    //     child: Divider(
    //       indent: 0,
    //       endIndent: 0,
    //       height: 0,
    //       color: Color(0xffF8F8F8),
    //       thickness: 7,
    //     )));
    for (int i = 0; i < (widget.categoryList).length; i++) {
      // 선택할 수 있는 리스트
      if ((widget.flag == true
              ? context.read<EnrollClothes>().bigCategory
              : context.read<EnrollClothes>().smallCategory) !=
          widget.categoryList[i]) {
        childs.add(PopupMenuItem<String>(
          mouseCursor: MaterialStateMouseCursor.clickable,
          value: widget.categoryList[i],
          height: 44,
          child: Container(
              width: (100.w - 32 - 41) / 2,
              alignment: Alignment.centerLeft,
              child: Text(widget.categoryList[i], style: basicTextTheme)),
        ));
      }
    }

    return childs;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (100.w - 32 - 41) / 2,
      child: PopupMenuButton(
          padding: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Color(0xffD9D9D9), width: 1),
              borderRadius: BorderRadius.circular(5)),
          offset: Offset(0, -20),
          constraints: BoxConstraints(
              maxWidth: (100.w - 32 - 41) / 2, minWidth: (100.w - 32 - 41) / 2),
          child: Container(
              width: (100.w - 32 - 41) / 2,
              padding: EdgeInsets.only(left: 15),
              child: Text(
                  widget.flag == true
                      ? context.read<EnrollClothes>().bigCategory
                      : context.read<EnrollClothes>().smallCategory,
                  style: basicTextTheme)),
          onSelected: (String category) {
            if (widget.flag == true) {
              if (category !=
                  (widget.flag == true
                      ? context.read<EnrollClothes>().bigCategory
                      : context.read<EnrollClothes>().smallCategory)) {
                context.read<EnrollClothes>().changeNumBigCategory(category);
              }
            } else {
              context.read<EnrollClothes>().changeNumSmallCategory(category);
            }
            widget.flag == true
                ? context.read<EnrollClothes>().bigCategory
                : context.read<EnrollClothes>().smallCategory = category;
          },
          itemBuilder: (BuildContext context) => getList()),
    );
  }
}
