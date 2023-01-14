import "package:flutter/material.dart";

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: const Text('옷장을 만들기 위해', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text('로그인을 해주세요!', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
            )
          ],
        ),
      ),
    );
  }
}