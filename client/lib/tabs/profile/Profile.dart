import 'package:eotteom/tabs/profile/Profileimage.dart';
import "package:flutter/material.dart";
import "package:sizer/sizer.dart";
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    TextStyle _fontStyle = TextStyle(
        fontFamily: "NotoSans", fontWeight: FontWeight.w700, fontSize: 18.0);
    return Sizer(builder: ((context, orientation, deviceType) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffFFFFFF),
          elevation: 0.0,
        ),
        body: Container(
          color: Color(0xffFFFFFF),
          width: 100.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '내 정보',
                style: TextStyle(
                    fontFamily: "NotoSans",
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 56,
              ),
              Container(
                color: Color(0xffD9D9D9),
                width: 25.w,
                height: 25.w,
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '이름 ',
                    style: _fontStyle,
                  ),
                  Text(
                    'kyu5787',
                    style: _fontStyle,
                  )
                ],
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '성별 Male',
                        style: _fontStyle,
                      ),
                      SizedBox(height: 17,),
                      Text(
                        '키 176',
                        style: _fontStyle,
                      )
                    ],
                  ),
                  SizedBox(width: 10.w,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '나이 27',
                        style: _fontStyle,
                      ),
                      SizedBox(height: 17,),
                      Text(
                        '몸무게 72kg',
                        style: _fontStyle,
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      );
    }));
  }
}
