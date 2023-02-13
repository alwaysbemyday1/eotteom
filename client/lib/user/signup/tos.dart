import 'package:cupertino_progress_bar/cupertino_progress_bar.dart';
import 'package:eotteom/provider.dart';
import 'package:eotteom/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'email.dart';

class TOS extends StatefulWidget {
  const TOS({super.key});

  @override
  State<TOS> createState() => _TOSState();
}

class _TOSState extends State<TOS> {
  var allCheck = false;
  var serviceCheck = false;
  var personalCheck = false;

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
                backgroundColor: Colors.white,
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                border: null,
                leading: Material(
                  color: Colors.white,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(FlutterRemix.arrow_left_s_line, size: 30),
                    onPressed: () {
                      Navigator.pop(context);
                      context.read<SignInPage>().pageDown();
                    },
                  ),
                )),
            child: Container(
                height: 100.h - 99,
                margin: EdgeInsets.fromLTRB(16, 34, 16, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 65),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("만나서 반가워요!", style: headLineTextTheme),
                            Container(
                                margin: EdgeInsets.only(bottom: 65),
                                child: Text("이용약관을 확인해 주세요",
                                    style: headLineTextTheme)),
                            Container(
                                height: 36,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey, width: 1))),
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 16),
                                child: Row(
                                  children: [
                                    Container(
                                        alignment: Alignment.center,
                                        height: 20,
                                        width: 20,
                                        margin: EdgeInsets.fromLTRB(0, 0, 9, 0),
                                        child: IconButton(
                                          padding: EdgeInsets.all(0),
                                          icon: Icon(
                                            allCheck == true
                                                ? FlutterRemix
                                                    .checkbox_circle_fill
                                                : FlutterRemix
                                                    .checkbox_blank_circle_line,
                                            size: 24,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              allCheck = !allCheck;
                                              if (allCheck == true) {
                                                serviceCheck =
                                                    personalCheck = true;
                                              } else {
                                                serviceCheck =
                                                    personalCheck = false;
                                              }
                                            });
                                          },
                                        )),
                                    Text('전체 동의', style: basicTextTheme)
                                  ],
                                )),
                            Container(
                                margin: EdgeInsets.fromLTRB(0, 16, 0, 16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                            height: 20,
                                            width: 20,
                                            margin:
                                                EdgeInsets.fromLTRB(0, 0, 9, 0),
                                            child: IconButton(
                                              padding: EdgeInsets.all(0),
                                              icon: Icon(
                                                serviceCheck == true
                                                    ? FlutterRemix
                                                        .checkbox_circle_fill
                                                    : FlutterRemix
                                                        .checkbox_blank_circle_line,
                                                size: 24,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  serviceCheck = !serviceCheck;
                                                  if (serviceCheck == true &&
                                                      personalCheck == true) {
                                                    allCheck = true;
                                                  } else {
                                                    allCheck = false;
                                                  }
                                                });
                                              },
                                            )),
                                        Text('서비스 이용 약관 동의',
                                            style: basicTextTheme),
                                      ],
                                    ),
                                    Icon(FlutterRemix.arrow_right_s_line,
                                        size: 20)
                                  ],
                                )),
                            Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                            height: 20,
                                            width: 20,
                                            margin:
                                                EdgeInsets.fromLTRB(0, 0, 9, 0),
                                            child: IconButton(
                                              padding: EdgeInsets.all(0),
                                              icon: Icon(
                                                personalCheck == true
                                                    ? FlutterRemix
                                                        .checkbox_circle_fill
                                                    : FlutterRemix
                                                        .checkbox_blank_circle_line,
                                                size: 24,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  personalCheck =
                                                      !personalCheck;
                                                  if (serviceCheck == true &&
                                                      personalCheck == true) {
                                                    allCheck = true;
                                                  } else {
                                                    allCheck = false;
                                                  }
                                                });
                                              },
                                            )),
                                        Text('개인정보 수집 및 이용 동의',
                                            style: basicTextTheme),
                                      ],
                                    ),
                                    Icon(FlutterRemix.arrow_right_s_line,
                                        size: 20)
                                  ],
                                )),
                          ],
                        )),
                    Column(
                      children: [
                        Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
                            alignment: Alignment.centerRight,
                            child: Text(
                              '${context.watch<SignInPage>().page}/4',
                              style: TextStyle(fontSize: 12),
                            )),
                        Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                            child: SizedBox(
                              width: double.infinity,
                              child: CupertinoProgressBar(
                                  value: context.watch<SignInPage>().page / 4),
                            )),
                        allCheck == true
                            ? Container(
                                width: 100.w - 32,
                                height: 54,
                                margin: EdgeInsets.only(
                                    bottom: 22 +
                                        MediaQuery.of(context)
                                            .viewInsets
                                            .bottom),
                                child: CupertinoButton(
                                    padding: EdgeInsets.all(0),
                                    color: Color(0xff131313),
                                    borderRadius: BorderRadius.circular(5),
                                    child: Text('다음',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white)),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                              builder: (context) => Email()));
                                      context.read<SignInPage>().pageUp();
                                    }),
                              )
                            : Container(
                                width: 100.w - 32,
                                height: 54,
                                margin: EdgeInsets.only(
                                    bottom: 22 +
                                        MediaQuery.of(context)
                                            .viewInsets
                                            .bottom),
                                padding:
                                    EdgeInsets.only(top: 3), // 버튼과 위치 맞추기 위해
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.grey),
                                alignment: Alignment.center,
                                child: Text('다음',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white)))
                      ],
                    ),
                  ],
                ))));
  }
}
