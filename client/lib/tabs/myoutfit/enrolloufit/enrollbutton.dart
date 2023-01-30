import 'package:eotteom/tabs/home/myOutfit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../provider.dart';

class EnrollButton extends StatelessWidget {
  const EnrollButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 90,
        width: 100.w,
        alignment: Alignment.center,
        padding: EdgeInsets.fromLTRB(16, 14, 16, 32),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(color: Colors.grey, blurRadius: 1, spreadRadius: 0)
        ]),
        child: (context.watch<EnrollClothes>().resultImage != null &&
                context.watch<EnrollClothes>().smallCategory != '선택해주세요')
            ? Container(
                width: 100.w - 32,
                height: 44,
                child: CupertinoButton(
                    padding: EdgeInsets.all(0),
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5),
                    child: Text('등록',
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                    onPressed: () {
                      Navigator.push(context,
                          CupertinoPageRoute(builder: (context) => MyOutfit()));
                    }),
              )
            : Container(
                width: 100.w - 32,
                height: 44,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5), color: Colors.grey),
                alignment: Alignment.center,
                child: Text('등록',
                    style: TextStyle(fontSize: 16, color: Colors.white))));
  }
}
