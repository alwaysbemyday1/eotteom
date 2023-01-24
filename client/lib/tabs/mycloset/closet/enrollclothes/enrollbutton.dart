import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../provider.dart';
import '../../mycloset.dart';

class EnrollButton extends StatefulWidget {
  const EnrollButton({super.key});

  @override
  State<EnrollButton> createState() => _EnrollButtonState();
}

class _EnrollButtonState extends State<EnrollButton> {
  @override
  Widget build(BuildContext context) {
    return (context.watch<EnrollClothes>().resultImage != null &&
            context.watch<EnrollClothes>().smallCategory != 100)
        ? Container(
            margin: EdgeInsets.only(left: 16),
            width: 100.w - 32,
            height: 54,
            child: CupertinoButton(
                padding: EdgeInsets.all(0),
                color: Colors.black,
                borderRadius: BorderRadius.circular(5),
                child: Text('등록',
                    style: TextStyle(fontSize: 16, color: Colors.white)),
                onPressed: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => MyCloset()));
                }),
          )
        : Container(
            margin: EdgeInsets.only(left: 16),
            padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
            width: 100.w - 32,
            height: 54,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.grey),
            alignment: Alignment.center,
            child: Text('등록',
                style: TextStyle(fontSize: 16, color: Colors.white)));
  }
}
