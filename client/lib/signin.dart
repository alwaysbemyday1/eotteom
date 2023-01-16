import 'package:eotteom/provider.dart';
import 'package:eotteom/style/style.dart';
import 'package:eotteom/user/signup/tos.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:email_validator/email_validator.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import "login.dart";

class SigninPage extends StatefulWidget {
  SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final _fontStyle = TextStyle(
      fontFamily: "NotoSans", fontWeight: FontWeight.w700, fontSize: 30);
  final emailController = TextEditingController();
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

  final logintext = Text(
    '로그인',
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
  );

  @override
  Widget build(BuildContext context) {
    final ButtonStyle loginButtonStyle = ElevatedButton.styleFrom(
        textStyle: const TextStyle(color: Colors.black, fontSize: 16),
        backgroundColor: Colors.white,
        side: const BorderSide(color: Colors.black),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)));

    final ButtonStyle registerButtonStyle = ElevatedButton.styleFrom(
        textStyle: const TextStyle(color: Colors.white, fontSize: 16),
        backgroundColor: Colors.black,
        side: const BorderSide(color: Colors.black),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)));
    // final buttonwidth = MediaQuery.of(context).size.width - 32;
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return MaterialApp(
          home: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
              ),
              body: SingleChildScrollView(
                child: SizedBox(
                  height: 100.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        // ignore: sort_child_properties_last
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '나의 옷장을',
                                  style: _fontStyle,
                                ),
                                Text(
                                  '나의 코디를 한 손에 쏙',
                                  style: _fontStyle,
                                ),
                                const SizedBox(height: 16), // 1/8
                                const Text(
                                  "나의 옷장을 만들기 위해서는",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Text(
                                  "로그인이 필요해요",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.start,
                      ),
                      SizedBox(
                        height: 12.5.h,
                      ),
                      SizedBox(
                        height: 50,
                        width: 100.w - 32,
                        child: ElevatedButton(
                            style: registerButtonStyle,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => TOS()));
                              context.read<SignInPage>().pageUp();
                            },
                            child: const Text("회원가입")),
                      ), // 1/8
                      const SizedBox(
                        height: 12,
                      ),
                      SizedBox(
                        height: 50,
                        width: 100.w - 32,
                        child: ElevatedButton(
                            style: loginButtonStyle,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            },
                            child: RichText(
                              text: const TextSpan(children: [
                                TextSpan(
                                    text: '이미 계정이 있다면? ',
                                    style: TextStyle(color: Colors.black)),
                                TextSpan(
                                    text: "로그인",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black))
                              ]),
                            )),
                      ),
                      SizedBox(
                        height: 12,
                      ),
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
                              '또는 다른 계정으로 간편 로그인',
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
                    ],
                  ),
                ),
              )),
        );
      },
    );
  }
}



// Padding(
//                     padding: const EdgeInsets.only(left: 20, right: 20),
//                     child: TextField(
//                       decoration: InputDecoration(
//                           focusedBorder: UnderlineInputBorder(
//                               borderSide: BorderSide(color: Colors.black)),
//                           hintText: '이메일 주소를 입력해 주세요',
//                           hintStyle: TextStyle(color: Colors.grey)),
//                       controller: emailController,
//                       onChanged: (text) {
//                         setState(() {
//                           emailOkay = _emailCheck();
//                         });
//                       },
//                     ),
//                   )

// Padding(
//                     padding: const EdgeInsets.only(left: 20, right: 20),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       children: [
//                         TextButton(
//                           child: Text(
//                             '계속하기',
//                             style: TextStyle(
//                                 fontSize: 16,
//                                 color: emailOkay ? Colors.black : Colors.grey),
//                           ),
//                           onPressed: () {},
//                           style: ButtonStyle(
//                               side: MaterialStateProperty.all(
//                                   BorderSide(color: Colors.grey))),
//                         ),
//                       ],
//                     ),
//                   )

// Row(children: [IconButton(icon: Icon(Icons.exit_to_app), onPressed: () {
//               Navigator.pop(context);
//             },)],)



// SocialLoginButton(
//                     buttonType: SocialLoginButtonType.appleBlack,
//                     onPressed: () {},
//                     width: buttonwidth,
//                     fontSize: 20,
//                     borderRadius: 12,
//                   ),
//                   SizedBox(
//                     height: 12,
//                   ),
//                   SocialLoginButton(
//                     buttonType: SocialLoginButtonType.facebook,
//                     onPressed: () {},
//                     width: buttonwidth,
//                     fontSize: 20,
//                     borderRadius: 12,
//                   ),
//                   SizedBox(
//                     height: 12,
//                   ),
//                   SocialLoginButton(
//                     buttonType: SocialLoginButtonType.google,
//                     onPressed: () {},
//                     width: buttonwidth,
//                     fontSize: 20,
//                     borderRadius: 12,
//                   ),
//                   SizedBox(
//                     height: 12,
//                   ),
//                   SocialLoginButton(
//                       buttonType: SocialLoginButtonType.generalLogin,
//                       onPressed: () {},
//                       width: buttonwidth,
//                       fontSize: 20,
//                       borderRadius: 12,
//                       imageWidth: 45,
//                       text: "Sign In with Kakao",
//                       imagePath:
//                           "assets/images/login/loginbutton/icon_signup_kakao.png",
//                       backgroundColor: Color(0xffFEE500),
//                       textColor: Colors.black),
//                   SizedBox(
//                     height: 12,
//                   ),
//                   SocialLoginButton(
//                       buttonType: SocialLoginButtonType.generalLogin,
//                       onPressed: () {},
//                       width: buttonwidth,
//                       fontSize: 20,
//                       borderRadius: 12,
//                       imageWidth: 45,
//                       text: "Sign In with Naver",
//                       imagePath:
//                           "assets/images/login/loginbutton/icon_signup_naver.png",
//                       backgroundColor: Color(0xff03C75A),
//                       textColor: Colors.white),