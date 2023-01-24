import 'package:eotteom/provider.dart';
import 'package:eotteom/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Catetory extends StatefulWidget {
  const Catetory({super.key});

  @override
  State<Catetory> createState() => _CatetoryState();
}

class _CatetoryState extends State<Catetory> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(16, 0, 16, 32),
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
                    margin: EdgeInsets.only(right: 148),
                    child: Text('대분류', style: basicTextTheme)),
                Container(
                    margin: EdgeInsets.only(right: 148),
                    child: Text('소분류', style: basicTextTheme))
              ]),
            ),
            Container(
              child: Row(children: [
                Container(
                    alignment: Alignment.center,
                    width: 156,
                    height: 44,
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffD9D9D9), width: 1),
                        borderRadius: BorderRadius.circular(5)),
                    margin: EdgeInsets.only(right: 12),
                    child: ContextMenu(
                      flag: true,
                      categoryList:
                          context.watch<EnrollClothes>().bigCategoryList,
                    )),
                Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(right: 13),
                    child: Icon(CupertinoIcons.right_chevron)),
                Container(
                    alignment: Alignment.center,
                    width: 156,
                    height: 44,
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffD9D9D9), width: 1),
                        borderRadius: BorderRadius.circular(5)),
                    margin: EdgeInsets.only(right: 12),
                    child: ContextMenu(
                      flag: false,
                      categoryList:
                          context.watch<EnrollClothes>().bigCategory != 100
                              ? context
                                      .watch<EnrollClothes>()
                                      .smallCategoryList[
                                  context.watch<EnrollClothes>().bigCategory]
                              : ['대분류를 먼저 선택해주세요'],
                    ))
              ]),
            )
          ],
        ));
  }
}

class ContextMenu extends StatefulWidget {
  ContextMenu({super.key, this.flag, this.categoryList});

  var flag; // true is big, false is small
  var categoryList;

  @override
  State<ContextMenu> createState() => _ContextMenuState();
}

class _ContextMenuState extends State<ContextMenu> {
  List<Widget> getList() {
    List<Widget> childs = [];
    for (int i = 0; i < (widget.categoryList).length; i++) {
      childs.add(CupertinoContextMenuAction(
          onPressed: () {
            widget.flag == true
                ? context.read<EnrollClothes>().changeNumBigCategory(i)
                : context.read<EnrollClothes>().changeNumSmallCategory(i);
            Navigator.of(context, rootNavigator: true).pop();
          },
          child: Text(widget.categoryList[i])));
    }

    return childs;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoContextMenu(
      child: Text((widget.flag == true
              ? context.read<EnrollClothes>().bigCategory == 100
              : context.read<EnrollClothes>().smallCategory == 100)
          ? '선택해주세요'
          : (widget.flag == true
              ? widget.categoryList[context.watch<EnrollClothes>().bigCategory]
              : widget
                  .categoryList[context.watch<EnrollClothes>().smallCategory])),
      actions: getList(),
    );
  }
}
