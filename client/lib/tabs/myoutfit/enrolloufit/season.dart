import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:eotteom/provider.dart';

import '../../../style.dart';

class Season extends StatelessWidget {
  Season({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Container(
          width: (100.w - 32 - 40) / 3 + 1,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 13),
                child: Text(
                  '계절',
                  style: enrollTitleTheme2,
                )),
            Container(
                alignment: Alignment.center,
                width: (100.w - 32 - 40) / 3 + 1,
                height: 44,
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
      value: context.read<EnrollOutfit>().season,
      child: Container(
          width: (100.w - 32 - 40) / 3 + 1,
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(context.read<EnrollOutfit>().season, style: basicTextTheme),
              Icon(FlutterRemix.check_fill, size: 17)
            ],
          )),
    ));
    childs.add(PopupMenuDivider(height: 0));

    for (int i = 0; i < 4; i++) {
      // 선택할 수 있는 리스트
      if (context.read<EnrollOutfit>().season !=
          context.read<EnrollOutfit>().seasonList[i]) {
        childs.add(PopupMenuItem<String>(
          value: context.read<EnrollOutfit>().seasonList[i],
          height: 44,
          child: Container(
              width: (100.w - 32 - 40) / 3 + 1,
              alignment: Alignment.centerLeft,
              child: Text(context.read<EnrollOutfit>().seasonList[i],
                  style: basicTextTheme)),
        ));
      }
    }

    return childs;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (100.w - 32 - 40) / 3 + 1,
      child: PopupMenuButton(
          // padding: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Color(0xffD9D9D9), width: 1),
              borderRadius: BorderRadius.circular(5)),
          offset: Offset(0, -20),
          constraints: BoxConstraints(
              maxWidth: (100.w - 32 - 40) / 3 + 1,
              minWidth: (100.w - 32 - 40) / 3 + 1),
          child: Container(
              width: (100.w - 32 - 40) / 3 + 1,
              padding: EdgeInsets.only(left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(context.watch<EnrollOutfit>().season,
                      style: basicTextTheme),
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Icon(FlutterRemix.arrow_down_s_line, size: 20),
                  )
                ],
              )),
          onSelected: (String selected) {
            context.read<EnrollOutfit>().changeSeason(selected);
          },
          itemBuilder: (BuildContext context) => getList()),
    );
  }
}
