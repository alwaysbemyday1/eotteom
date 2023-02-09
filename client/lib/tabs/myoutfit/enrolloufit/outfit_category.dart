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

  List<Widget> getList() {
    List<Widget> childs = [];
    for (int i = line * 4; i < (line + 1) * 4; i++) {
      if (context.read<EnrollOutfit>().categoryList.length == i) {
        break;
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
    line++;
    return childs;
  }

  @override
  Widget build(BuildContext context) {
    line = 0;
    return Container(
        margin: EdgeInsets.fromLTRB(16, 0, 16, 28),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 13),
              child: Text(
                '코디 카테고리',
                style: enrollTitleTheme2,
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
