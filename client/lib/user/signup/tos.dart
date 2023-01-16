import 'package:cupertino_progress_bar/cupertino_progress_bar.dart';
import 'package:eotteom/provider.dart';
import 'package:eotteom/style/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        child: CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
                backgroundColor: CupertinoColors.white,
                padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                border: null,
                leading: Material(
                  child: IconButton(
                    icon: Icon(CupertinoIcons.chevron_back),
                    onPressed: () {
                      Navigator.pop(context);
                      context.read<SignInPage>().pageDown();
                    },
                  ),
                )),
            child: Container(
                margin: EdgeInsets.fromLTRB(24, 35, 24, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 65),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("만나서 반가워요!", style: headLineTextTheme),
                            Text("이용약관을 확인해 주세요", style: headLineTextTheme)
                          ]),
                    ),
                    Container(
                        child: Column(
                      children: [
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
                                            ? CupertinoIcons
                                                .check_mark_circled_solid
                                            : CupertinoIcons.circle,
                                        size: 22,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          allCheck = !allCheck;
                                          if (allCheck == true) {
                                            serviceCheck = personalCheck = true;
                                          } else {
                                            serviceCheck =
                                                personalCheck = false;
                                          }
                                        });
                                      },
                                    )),
                                Container(
                                    child: Text('전체 동의', style: basicTextTheme))
                              ],
                            )),
                        Container(
                            margin: EdgeInsets.fromLTRB(0, 16, 0, 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                        height: 20,
                                        width: 20,
                                        margin: EdgeInsets.fromLTRB(0, 0, 9, 0),
                                        child: IconButton(
                                          padding: EdgeInsets.all(0),
                                          icon: Icon(
                                            serviceCheck == true
                                                ? CupertinoIcons
                                                    .check_mark_circled_solid
                                                : CupertinoIcons.circle,
                                            size: 22,
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
                                    Text('서비스 이용 약관 동의', style: basicTextTheme),
                                  ],
                                ),
                                Icon(CupertinoIcons.forward)
                              ],
                            )),
                        Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                        height: 20,
                                        width: 20,
                                        margin: EdgeInsets.fromLTRB(0, 0, 9, 0),
                                        child: IconButton(
                                          padding: EdgeInsets.all(0),
                                          icon: Icon(
                                            personalCheck == true
                                                ? CupertinoIcons
                                                    .check_mark_circled_solid
                                                : CupertinoIcons.circle,
                                            size: 22,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              personalCheck = !personalCheck;
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
                                Icon(CupertinoIcons.forward)
                              ],
                            )),
                        //SizedBox(height: 100.h - (348) - (116)),
                        SizedBox(
                            height: 100.h -
                                508 -
                                MediaQuery.of(context).viewInsets.bottom),
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
                                      value:
                                          context.watch<SignInPage>().page / 4),
                                )),
                          ],
                        ),
                        allCheck == true
                            ? Container(
                                width: 100.w - 32,
                                height: 54,
                                child: CupertinoButton(
                                    padding: EdgeInsets.all(0),
                                    color: Colors.black,
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
                                padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                                width: 100.w - 32,
                                height: 54,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.grey),
                                alignment: Alignment.center,
                                child: Text('다음',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white)))
                      ],
                    ))
                  ],
                ))));
  }
}
