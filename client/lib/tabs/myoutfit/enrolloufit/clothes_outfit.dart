import 'package:dotted_border/dotted_border.dart';
import 'package:eotteom/provider.dart';
import 'package:eotteom/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:eotteom/model/clothes_model.dart';

class ClothesOufit extends StatefulWidget {
  ClothesOufit({super.key});

  @override
  State<ClothesOufit> createState() => _ClothesOufitState();
}

class _ClothesOufitState extends State<ClothesOufit> {
  List<Clothes> myClothesList = [];

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100.w - 32,
        height: 300,
        margin: EdgeInsets.fromLTRB(16, 0, 16, 12.7),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            margin: EdgeInsets.only(bottom: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '코디한 옷 정보',
                  style: enrollTitleTheme,
                ),
                OutlinedButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.fromLTRB(0, 0, 0, 0))),
                    onPressed: () {},
                    child: Container(
                      width: (100.w - 32 - 40) / 6 * 3.5 + 24,
                      height: 44,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border:
                              Border.all(color: Color(0xff131313), width: 1)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.only(right: 8),
                              child: Icon(
                                FlutterRemix.t_shirt_2_line,
                                size: 24,
                                color: Color(0xff131313),
                              )),
                          Text('옷장에서 가져오기', style: enrollTitleTheme)
                        ],
                      ),
                    ))
              ],
            ),
          ),
          DottedBorder(
            color: Color(0xffCACACA),
            strokeWidth: 1,
            padding: EdgeInsets.all(0),
            radius: Radius.circular(5),
            child: OutlinedButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.fromLTRB(0, 0, 0, 0)),
                    side: MaterialStateProperty.all(BorderSide(
                        color: Colors.blue,
                        width: 1.0,
                        style: BorderStyle.none))),
                onPressed: () {},
                child: Container(
                  width: (100.w - 32),
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(width: 0, color: Colors.white)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          margin: EdgeInsets.only(right: 13),
                          child: Icon(
                            FlutterRemix.add_fill,
                            size: 24,
                            color: Color(0xff9B9B9B),
                          )),
                      Text('코디 사진으로 옷 등록하기',
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: "NotoSans",
                              color: Color(0xff9B9B9B),
                              fontWeight: FontWeight.w700,
                              height: 1.3))
                    ],
                  ),
                )),
          )
        ]));
  }
}
