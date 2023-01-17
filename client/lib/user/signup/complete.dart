import 'package:eotteom/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eotteom/provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../tabs/home/home.dart';

class Complete extends StatefulWidget {
  const Complete({super.key});

  @override
  State<Complete> createState() => _CompleteState();
}

class _CompleteState extends State<Complete> {
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
              ),
              child: Container(
                  margin: EdgeInsets.fromLTRB(16, 35, 16, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 58,
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Text("회원가입이 완료되었어요!",
                            style: TextStyle(
                                fontSize: 22,
                                fontFamily: "NotoSans",
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                height: 1.3)),
                      ),
                      Container(
                          height: 20,
                          margin: EdgeInsets.fromLTRB(8, 0, 0, 14),
                          child: Text(
                            '이제 나의 옷장을 만들어볼까요?',
                            style: TextStyle(
                                fontSize: 14, color: Color(0xff131313)),
                          )),
                      SizedBox(
                          height: 100.h -
                              529 -
                              22 -
                              MediaQuery.of(context).viewInsets.bottom),
                      Container(
                        width: 100.w - 32,
                        height: 54,
                        child: CupertinoButton(
                            padding: EdgeInsets.all(0),
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5),
                            child: Text('어떰 홈으로',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white)),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => MyApp()));
                            }),
                      ),
                      SizedBox(height: MediaQuery.of(context).viewInsets.bottom)
                    ],
                  )))),
    );
  }
}
