import 'package:eotteom/tabs/myoutfit/enrolloufit/enroll_outfit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';
import 'package:eotteom/provider.dart';

class OutfitOpenPermission extends StatefulWidget {
  const OutfitOpenPermission({super.key});

  @override
  State<OutfitOpenPermission> createState() => _OutfitOpenPermissionState();
}

class _OutfitOpenPermissionState extends State<OutfitOpenPermission> {
  bool state = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100.w - 32,
        margin: EdgeInsets.fromLTRB(16, 0, 16, 28),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('나만 보기',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: "NotoSans",
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      height: 20 / 14)),
              Text('설정 시 다른 사람과 코디를 공유할 수 없어요',
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: "NotoSans",
                      color: Color(0xff9B9B9B),
                      fontWeight: FontWeight.w400,
                      height: 20 / 12))
            ]),
            Container(
                height: 25,
                width: 45,
                child: CupertinoSwitch(
                  value: state,
                  onChanged: (value) {
                    setState(() {
                      state = value;
                    });
                    context.read<EnrollOutfit>().changePermission();
                  },
                ))
          ],
        ));
  }
}
