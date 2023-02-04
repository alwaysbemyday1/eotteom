import 'package:eotteom/tabs/profile/Profileimage.dart';
import "package:flutter/material.dart";
import "package:sizer/sizer.dart";

class Profile extends StatefulWidget {
  Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final TextStyle _fontStyle = const TextStyle(
        fontFamily: "NotoSans", fontWeight: FontWeight.w700, fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
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
              ProfileImage(),
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
              SizedBox(
                height: 30,
              ),
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
                      SizedBox(
                        height: 17,
                      ),
                      Text(
                        '키 176',
                        style: _fontStyle,
                      )
                    ],
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '나이 27',
                        style: _fontStyle,
                      ),
                      SizedBox(
                        height: 17,
                      ),
                      Text(
                        '몸무게 72kg',
                        style: _fontStyle,
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 74,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Divider(
                  color: Color(0xff151515),
                  thickness: 1,
                ),
              )
            ],
          ),
        ),
      );
    }));
  }

  _showBottomSheet() {
    return showModalBottomSheet(
        context: context,
        builder: ((context) {
          return SizedBox(
            height: 40.h,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 5.h),
                  child: Text("프로필 사진 변경하기", style: _fontStyle,),
                ),
                SizedBox(height: 10.w,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt), iconSize: 20.w,),
                    IconButton(
                      iconSize: 20.w,
                      onPressed: () {},
                      icon: Icon(Icons.photo_album),
                    )
                  ],
                ),
              ],
            ),
          );
        }));
  }
}
