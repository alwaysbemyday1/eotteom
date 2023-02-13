import 'package:cupertino_progress_bar/cupertino_progress_bar.dart';
import 'package:email_validator/email_validator.dart';
import 'package:eotteom/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eotteom/provider.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

import 'complete.dart';

class Gender extends StatefulWidget {
  Gender({super.key, this.user});
  var user;

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  int gender = -1; // true(남성), false(여성)
  var manCheck = false;
  var womanCheck = false;

  @override
  Widget build(BuildContext context) {
    return Material(
        child: CupertinoPageScaffold(
            resizeToAvoidBottomInset: false,
            navigationBar: CupertinoNavigationBar(
              backgroundColor: CupertinoColors.white,
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
              border: null,
              leading: Material(
                color: Colors.white,
                child: IconButton(
                  icon: Icon(FlutterRemix.arrow_left_s_line, size: 30),
                  onPressed: () {
                    Navigator.pop(context);
                    context.read<SignInPage>().pageDown();
                  },
                ),
              ),
            ),
            child: Container(
                margin: EdgeInsets.fromLTRB(16, 35, 16, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("옷장을 구성하기 위해",
                                style: TextStyle(
                                    fontSize: 22,
                                    fontFamily: "NotoSans",
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    height: 1.3)),
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: RichText(
                                  text: TextSpan(children: [
                                TextSpan(text: '성별', style: headLineTextTheme),
                                TextSpan(
                                  text: '을 선택해 주세요',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontFamily: "NotoSans",
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      height: 1.3),
                                )
                              ])),
                            ),
                            Container(
                                height: 20,
                                margin: EdgeInsets.fromLTRB(8, 0, 0, 14),
                                child: Text(
                                  '나중에 설정에서 변경할 수 있어요',
                                  style: TextStyle(
                                      fontSize: 15, color: Color(0xff131313)),
                                )),
                            Container(
                                width: 100.w - 32,
                                height: 196,
                                child: (Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 0, 4.5, 0),
                                      child: CupertinoButton(
                                          padding: EdgeInsets.all(0),
                                          child: Container(
                                              width: 50.w - 16 - 4.5,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: gender == 1
                                                      ? Color(0xff131313)
                                                      : Colors.white),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    height: 99,
                                                    width: 99,
                                                    margin: EdgeInsets.fromLTRB(
                                                        0, 0, 0, 23),
                                                    child: CircleAvatar(
                                                      backgroundImage: AssetImage(
                                                          'assets/images/codies/man.png'),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Text('남성',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontFamily:
                                                                "NotoSans",
                                                            color: gender != 1
                                                                ? Color(
                                                                    0xff131313)
                                                                : Colors.white,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            height: 1.3)),
                                                  )
                                                ],
                                              )),
                                          onPressed: () {
                                            setState(() {
                                              gender = 1;
                                            });
                                          }),
                                    ),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(4.5, 0, 0, 0),
                                      child: CupertinoButton(
                                          padding: EdgeInsets.all(0),
                                          child: Container(
                                              height: 196,
                                              width: 50.w - 16 - 4.5,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: gender == 0
                                                      ? Color(0xff131313)
                                                      : Colors.white),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    height: 99,
                                                    width: 99,
                                                    margin: EdgeInsets.fromLTRB(
                                                        0, 0, 0, 23),
                                                    child: CircleAvatar(
                                                      backgroundImage: AssetImage(
                                                          'assets/images/codies/woman.png'),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Text('여성',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontFamily:
                                                                "NotoSans",
                                                            color: gender != 0
                                                                ? Color(
                                                                    0xff131313)
                                                                : Colors.white,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            height: 1.3)),
                                                  )
                                                ],
                                              )),
                                          onPressed: () {
                                            setState(() {
                                              gender = 0;
                                            });
                                          }),
                                    ),
                                  ],
                                ))),
                          ]),
                    ),
                    Column(children: [
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
                      gender != null
                          ? Container(
                              width: 100.w - 32,
                              height: 54,
                              margin: EdgeInsets.only(
                                  bottom: 22 +
                                      MediaQuery.of(context).viewInsets.bottom),
                              child: CupertinoButton(
                                  padding: EdgeInsets.all(0),
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(5),
                                  child: Text('다음',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white)),
                                  onPressed: () {
                                    widget.user['gender'] = gender.toString();
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                Complete(user: widget.user)));
                                  }),
                            )
                          : Container(
                              padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                              margin: EdgeInsets.only(
                                  bottom: 22 +
                                      MediaQuery.of(context).viewInsets.bottom),
                              width: 100.w - 32,
                              height: 54,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.grey),
                              alignment: Alignment.center,
                              child: Text('다음',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white))),
                    ])
                  ],
                ))));
  }
}
