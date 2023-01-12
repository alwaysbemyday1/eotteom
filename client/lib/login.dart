import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:email_validator/email_validator.dart';
// import 'package:sign_button/sign_button.dart' as sign_button;
// import 'package:flutter_signin_button/flutter_signin_button.dart'; // 커스텀 버튼에 대해 해당 라이브러리 사용 예정
import 'package:social_login_buttons/social_login_buttons.dart';
import 'signin.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _fontStyle = TextStyle(
      fontFamily: "NotoSans", fontWeight: FontWeight.w700, fontSize: 30);
  final emailController = TextEditingController();

  // var appleButton = sign_button.ButtonType.appleDark;
  // var googleButton = sign_button.ButtonType.googleDark;
  // var facebookButton = sign_button.ButtonType.facebook;
  bool emailOkay = false;

  bool _emailCheck() {
    return EmailValidator.validate(emailController.text);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController.addListener(_emailCheck);
  }

  @override
  Widget build(BuildContext context) {
    final buttonwidth = MediaQuery.of(context).size.width - 32;
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.close),
              color: Colors.black,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '모바일 옷장을',
                              style: _fontStyle,
                            ),
                            Text(
                              '만들어 볼까요?',
                              style: _fontStyle,
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.125,
                            ), // 1/8
                            Text(
                              "먼저 로그인이 필요해요😀",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.start,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          hintText: '이메일 주소를 입력해 주세요',
                          hintStyle: TextStyle(color: Colors.grey)),
                      controller: emailController,
                      onChanged: (text) {
                        setState(() {
                          emailOkay = _emailCheck();
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextButton(
                          child: Text(
                            '계속하기',
                            style: TextStyle(
                                fontSize: 16,
                                color: emailOkay ? Colors.black : Colors.grey),
                          ),
                          onPressed: () {},
                          style: ButtonStyle(
                              side: MaterialStateProperty.all(
                                  BorderSide(color: Colors.grey))),
                        ),
                      ],
                    ),
                  ), // django 로그인 관련 함수 요청하기
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.125,
                  ), // 1/8
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: Divider(
                              thickness: 1.0,
                            ),
                            margin: EdgeInsets.only(left: 10, right: 20),
                          ),
                        ),
                        Text(
                          '간편 로그인',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Expanded(
                          child: Container(
                            child: Divider(
                              thickness: 1.0,
                            ),
                            margin: EdgeInsets.only(left: 20, right: 10),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SocialLoginButton(
                    buttonType: SocialLoginButtonType.appleBlack,
                    onPressed: () {},
                    width: buttonwidth,
                    fontSize: 20,
                    borderRadius: 12,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  SocialLoginButton(
                    buttonType: SocialLoginButtonType.facebook,
                    onPressed: () {},
                    width: buttonwidth,
                    fontSize: 20,
                    borderRadius: 12,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  SocialLoginButton(
                    buttonType: SocialLoginButtonType.google,
                    onPressed: () {},
                    width: buttonwidth,
                    fontSize: 20,
                    borderRadius: 12,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  SocialLoginButton(
                      buttonType: SocialLoginButtonType.generalLogin,
                      onPressed: () {},
                      width: buttonwidth,
                      fontSize: 20,
                      borderRadius: 12,
                      imageWidth: 45,
                      text: "Sign In with Kakao",
                      imagePath:
                          "assets/images/login/loginbutton/icon_signup_kakao.png",
                      backgroundColor: Color(0xffFEE500),
                      textColor: Colors.black),
                  SizedBox(
                    height: 12,
                  ),
                  SocialLoginButton(
                      buttonType: SocialLoginButtonType.generalLogin,
                      onPressed: () {},
                      width: buttonwidth,
                      fontSize: 20,
                      borderRadius: 12,
                      imageWidth: 45,
                      text: "Sign In with Naver",
                      imagePath:
                          "assets/images/login/loginbutton/icon_signup_naver.png",
                      backgroundColor: Color(0xff03C75A),
                      textColor: Colors.white),
                  TextButton(
                    child: Text('test용 회원가입'),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) => SignIn())));
                    },
                  )
                ],
              ),
            ),
          )),
    );
  }
}

// Row(children: [IconButton(icon: Icon(Icons.exit_to_app), onPressed: () {
//               Navigator.pop(context);
//             },)],)