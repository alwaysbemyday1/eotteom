import 'package:cupertino_progress_bar/cupertino_progress_bar.dart';
import 'package:email_validator/email_validator.dart';
import 'package:eotteom/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eotteom/provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

import 'gender.dart';

class Password extends StatefulWidget {
  Password({super.key, this.user});
  var user;

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  // final TextEditingController controller = TextEditingController();
  var flagValidatePassword = true;
  var inputPassword;

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
                  )),
              child: Container(
                  margin: EdgeInsets.fromLTRB(16, 35, 16, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 58,
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 13),
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
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: '비밀번호', style: headLineTextTheme),
                                TextSpan(
                                  text: '를 입력해 주세요',
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
                          height: 44,
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 4),
                          child: TextField(
                              //controller: controller,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '8~20자리의 비밀번호를 입력해주세요',
                                  hintStyle: TextStyle(
                                      fontSize: 14, color: Color(0xff9b9b9b)),
                                  filled: true,
                                  fillColor: Color(0xffF3F3F3)),
                              autofocus: true,
                              onChanged: (text) {
                                inputPassword = text;
                              })),
                      Container(
                          height: 20,
                          margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
                          child: Text(
                            '영문 소문자, 숫자, 특수문자 중 2개 이상 포함',
                            style: TextStyle(
                                fontSize: 12, color: Color(0xff131313)),
                          )),
                      // FlutterPwValidator(
                      //   controller: controller,
                      //   minLength: 8,
                      //   numericCharCount: 1,
                      //   specialCharCount: 1,
                      //   width: 400,
                      //   height: 150,
                      //   onSuccess: () {
                      //     setState(() {
                      //       success = true;
                      //     });
                      //     print("MATCHED");
                      //     ScaffoldMessenger.of(context).showSnackBar(
                      //         const SnackBar(
                      //             content: Text("Password is matched")));
                      //   },
                      //   onFail: () {
                      //     setState(() {
                      //       success = false;
                      //     });
                      //     print("NOT MATCHED");
                      //   },
                      // ),
                      SizedBox(
                          height: 100.h -
                              389 -
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
                      flagValidatePassword == true
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
                                    widget.user['password'] = inputPassword;
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                Gender(user: widget.user)));
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
