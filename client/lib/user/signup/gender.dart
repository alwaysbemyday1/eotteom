import 'package:cupertino_progress_bar/cupertino_progress_bar.dart';
import 'package:email_validator/email_validator.dart';
import 'package:eotteom/style/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eotteom/provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

class Gender extends StatefulWidget {
  const Gender({super.key});

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  var gender = null; // true(남성), false(여성)
  var manCheck = false;
  var womanCheck = false;

  @override
  Widget build(BuildContext context) {
    return Localizations(
      locale: const Locale('en', 'US'),
      delegates: const <LocalizationsDelegate<dynamic>>[
        DefaultWidgetsLocalizations.delegate,
        DefaultMaterialLocalizations.delegate,
      ],
      child: Material(
          child: CupertinoPageScaffold(
              resizeToAvoidBottomInset: false,
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
                ),
                trailing: Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 14, 0),
                    child: CupertinoButton(
                      padding: EdgeInsets.all(0),
                      child: Text(
                        '넘어가기',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: "NotoSans",
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            height: 1.3),
                      ),
                      onPressed: () {},
                    )),
              ),
              child: Container(
                  margin: EdgeInsets.fromLTRB(16, 35, 16, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 58,
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
                              RichText(
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
                              ]))
                            ]),
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
                                            color: manCheck == true
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
                                                  0, 26, 0, 23),
                                              child: CircleAvatar(
                                                backgroundImage: AssetImage(
                                                    'assets/images/codies/man.png'),
                                              ),
                                            ),
                                            Container(
                                              child: Text('남성',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontFamily: "NotoSans",
                                                      color: manCheck == false
                                                          ? Color(0xff131313)
                                                          : Colors.white,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 1.3)),
                                            )
                                          ],
                                        )),
                                    onPressed: () {
                                      setState(() {
                                        gender = true;
                                        manCheck = true;
                                        womanCheck = false;
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
                                            color: womanCheck == true
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
                                                      fontFamily: "NotoSans",
                                                      color: womanCheck == false
                                                          ? Color(0xff131313)
                                                          : Colors.white,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 1.3)),
                                            )
                                          ],
                                        )),
                                    onPressed: () {
                                      setState(() {
                                        gender = false;
                                        manCheck = false;
                                        womanCheck = true;
                                      });
                                    }),
                              ),
                            ],
                          ))),
                      SizedBox(
                          height: 100.h -
                              529 -
                              22 -
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
                      gender != null
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
                                            builder: (context) => Gender()));
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
                                      fontSize: 16, color: Colors.white))),
                      SizedBox(height: MediaQuery.of(context).viewInsets.bottom)
                    ],
                  )))),
    );
  }
}
