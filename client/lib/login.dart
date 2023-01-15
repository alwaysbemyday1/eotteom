import 'package:eotteom/main.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:email_validator/email_validator.dart';
import "package:sizer/sizer.dart";
import 'package:flutter_localizations/flutter_localizations.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool emailOkay = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool passwordOkay = false;
  
  void _emailCheck() {
    setState(() {
      emailOkay = EmailValidator.validate(_emailController.text);
    });
  }

  void _passwordCheck() {
    setState(() {
      if (_passwordController.text.length > 0) {
        passwordOkay = true;
      }
    });
  }

  bool visible = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController.addListener(_emailCheck);
    _passwordController.addListener(_passwordCheck);
  }
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ko')
      ],
      locale: Locale('ko'),
          home: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16, top: 44),
              child: Text('옷장을 만들기 위해', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16, bottom: 42),
              child: Text('로그인을 해주세요!', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xffF3F3F3),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                  hintText: '이메일 주소를 입력해 주세요',
                  hintStyle: TextStyle(color: Colors.grey)),
                  controller: _emailController,
                  onChanged: (text) {
                    setState(() {
                      _emailCheck();
                    });
                  },
                ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
              child: TextField(
                obscureText: visible,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(visible ? Icons.visibility : Icons.visibility_off, color: Color(0xffCACACA),),
                    onPressed: () {
                      setState(() {
                        visible = !visible;
                      });
                    },
                  ),
                  filled: true,
                  fillColor: const Color(0xffF3F3F3),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                  hintText: '비밀번호를 입력해주세요',
                  hintStyle: TextStyle(color: Colors.grey)),
                  controller: _passwordController,
                  onChanged: (text) {
                    setState(() {

                    });
                  },
                ),
            ),
            SizedBox(height: 16,),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: SizedBox(
                      height: 54,
                      width: 100.w,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(color: Colors.white, fontSize: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                          backgroundColor: (emailOkay) && (passwordOkay) ? Colors.black : Color(0xffCACACA)
                        ),
                        onPressed: () {
                          if (emailOkay == true) {
                            Navigator.push(context, CupertinoPageRoute(builder: (context) => MyApp()));
                          }
                        }, 
                        child: const Text("로그인")
                      ),
                    ),
            )
          ],
        ),
      ),
    ),
        );
      },
    );
  }
}