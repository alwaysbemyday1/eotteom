import 'package:flutter/material.dart';

class SignUn extends StatelessWidget {
  SignUn({super.key});

  var input;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 200,
      ),
      Material(
          child: TextField(
        autofocus: true,
        decoration: InputDecoration(labelText: 'email input'),
        onChanged: (text) {
          input = text;
        },
      )),
      TextButton(
          child: Text('Sign In'),
          onPressed: () {
            // send input to server
            Navigator.pop(context);
          })
    ]);
  }
}
