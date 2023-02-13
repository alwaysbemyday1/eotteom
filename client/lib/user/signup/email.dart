import 'package:cupertino_progress_bar/cupertino_progress_bar.dart';
import 'package:email_validator/email_validator.dart';
import 'package:eotteom/style.dart';
import 'package:eotteom/user/signup/password.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eotteom/provider.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Email extends StatefulWidget {
  const Email({super.key});

  @override
  State<Email> createState() => _EmailState();
}

class _EmailState extends State<Email> {
  var inputEmail;
  var flagValidateEmail = false;
  var user = {};

  validateEmail() {
    setState(() {
      flagValidateEmail = EmailValidator.validate(inputEmail);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: CupertinoPageScaffold(
            resizeToAvoidBottomInset: false,
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
                margin: EdgeInsets.fromLTRB(16, 35, 16, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("로그인에 사용할",
                                style: TextStyle(
                                    fontSize: 22,
                                    fontFamily: "NotoSans",
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    height: 1.3)),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 13),
                              child: RichText(
                                  text: TextSpan(children: [
                                TextSpan(text: '이메일', style: headLineTextTheme),
                                TextSpan(
                                  text: '을 입력해 주세요',
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
                                height: 44,
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 4),
                                child: TextField(
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: '이메일 입력해주세요',
                                        hintStyle: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xff9b9b9b),
                                            fontFamily: "NotoSans",
                                            fontWeight: FontWeight.w400,
                                            height: 1.3),
                                        filled: true,
                                        fillColor: Color(0xffF3F3F3)),
                                    autofocus: true,
                                    onChanged: (text) {
                                      inputEmail = text;
                                      validateEmail();
                                    })),
                            flagValidateEmail == true
                                ? Container(
                                    height: 20,
                                    margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
                                    child: Text(
                                      '사용가능한 이메일이에요',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff2A7D42)),
                                    ))
                                : Container(height: 20),
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
                      flagValidateEmail == true
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
                                    user['email'] = inputEmail;
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                Password(user: user)));
                                    context.read<SignInPage>().pageUp();
                                  }),
                            )
                          : Container(
                              margin: EdgeInsets.only(
                                  bottom: 22 +
                                      MediaQuery.of(context).viewInsets.bottom),
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
                    ]),
                  ],
                ))));
  }
}
