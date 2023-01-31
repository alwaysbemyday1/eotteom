import 'package:eotteom/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

class Complete extends StatefulWidget {
  Complete({super.key, this.user});
  var user;

  @override
  State<Complete> createState() => _CompleteState();
}

class _CompleteState extends State<Complete> {
  _postRequest() async {
    String url = 'http://127.0.0.1:8000/api/users/';

    http.Response response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: widget.user);
  }

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
              child: Container(
                  margin: EdgeInsets.fromLTRB(16, 142, 16, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 4),
                        child: Text("회원가입이 완료되었어요!",
                            style: TextStyle(
                                fontSize: 22,
                                fontFamily: "NotoSans",
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                height: 1.3)),
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 14),
                          child: Text(
                            '이제 나의 옷장을 만들어볼까요?',
                            style: TextStyle(
                                fontSize: 14, color: Color(0xff131313)),
                          )),
                      SizedBox(
                          height: 100.h -
                              261 -
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
                              _postRequest();
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
