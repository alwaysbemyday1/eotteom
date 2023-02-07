import 'package:eotteom/provider.dart';
import 'package:eotteom/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
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
                    width: (100.w - 32 - 46) / 2,
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
                    margin: EdgeInsets.only(right: 11),
                    child: Icon(
                      FlutterRemix.arrow_drop_right_line,
                      size: 24,
                    )),
                Container(
                    width: (100.w - 32 - 46) / 2,
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
          width: (100.w - 32 - 46) / 2,
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  widget.flag == true
                      ? context.read<EnrollClothes>().bigCategory
                      : context.read<EnrollClothes>().smallCategory,
                  style: basicTextTheme),
              Icon(Icons.check, size: 20)
            ],
          )),
    ));
    childs.add(PopupMenuDivider(height: 0));

    for (int i = 0; i < (widget.categoryList).length; i++) {
      // 선택할 수 있는 리스트
      if ((widget.flag == true
              ? context.read<EnrollClothes>().bigCategory
              : context.read<EnrollClothes>().smallCategory) !=
          widget.categoryList[i]) {
        childs.add(PopupMenuItem<String>(
          value: widget.categoryList[i],
          height: 44,
          child: Container(
              width: (100.w - 32 - 46) / 2,
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
          offset: Offset(0, -18),
          constraints: BoxConstraints(
              maxWidth: (100.w - 32 - 46) / 2, minWidth: (100.w - 32 - 46) / 2),
          child: Container(
              width: (100.w - 32 - 46) / 2,
              padding: EdgeInsets.only(left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      widget.flag == true
                          ? context.read<EnrollClothes>().bigCategory
                          : context.read<EnrollClothes>().smallCategory,
                      style: basicTextTheme),
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Icon(Icons.keyboard_arrow_down, size: 20),
                  )
                ],
              )),
          onSelected: (String category) {
            if (widget.flag == true) {
              if (category != context.read<EnrollClothes>().bigCategory) {
                context.read<EnrollClothes>().changeNumBigCategory(category);
              }
            } else {
              if (category != context.read<EnrollClothes>().smallCategory) {
                context.read<EnrollClothes>().changeNumSmallCategory(category);
              }
            }
          },
          itemBuilder: (BuildContext context) => getList()),
    );
  }
}
