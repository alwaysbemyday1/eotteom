import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const homeTheme = CupertinoThemeData(
  primaryColor: Colors.black,
  textTheme: CupertinoTextThemeData(
      primaryColor: Colors.black,
      textStyle: TextStyle(
          fontFamily: "NotoSans",
          color: Colors.black,
          fontWeight: FontWeight.w400,
          height: 1.3)),
);

var basicTextTheme = TextStyle(
    fontSize: 14,
    fontFamily: "NotoSans",
    color: Colors.black,
    fontWeight: FontWeight.w400,
    height: 1.3);

var headLineTextTheme = TextStyle(
    fontSize: 22,
    fontFamily: "NotoSans",
    color: Colors.black,
    fontWeight: FontWeight.w700,
    height: 1.3);
