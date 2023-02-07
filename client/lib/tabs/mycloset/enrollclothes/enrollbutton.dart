import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

import '../../../provider.dart';

class EnrollButton extends StatelessWidget {
  EnrollButton({super.key, this.ctx});
  var ctx;

  var clothes = {
    'user': '16440a1d-7c3a-46b4-ae2a-0b375e4c6058'
  }; // user 로그인 지속 기능 추가되면 변경

  _postRequest() async {
    String url = 'http://127.0.0.1:8000/api/clothes/';

    http.Response response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: clothes);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 90,
        width: 100.w,
        alignment: Alignment.center,
        padding: EdgeInsets.fromLTRB(16, 14, 16, 32),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(color: Colors.grey, blurRadius: 1, spreadRadius: 0)
        ]),
        child: (context.watch<EnrollClothes>().resultImage != null &&
                context.watch<EnrollClothes>().smallCategory != '선택해주세요')
            ? Container(
                width: 100.w - 32,
                height: 44,
                child: CupertinoButton(
                    padding: EdgeInsets.all(0),
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5),
                    child: Text('등록',
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                    onPressed: () {
                      clothes['name'] = context
                          .read<EnrollClothes>()
                          .memo; // name, memo 통일 되면 수정
                      clothes['brand'] = context.read<EnrollClothes>().brand;
                      //clothes['fit'] = context.read<EnrollClothes>().fit;
                      clothes['size'] = context.read<EnrollClothes>().size;
                      clothes['price'] = context.read<EnrollClothes>().priceStr;
                      clothes['color'] = context.read<EnrollClothes>().color;
                      clothes['major_category'] = "1"; // 정해지면 수정
                      clothes['minor_category'] = "1"; // 정해지면 수정
                      // Image 필드 추가
                      _postRequest();

                      Navigator.pop(ctx);
                    }),
              )
            : Container(
                width: 100.w - 32,
                height: 44,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5), color: Colors.grey),
                alignment: Alignment.center,
                child: Text('등록',
                    style: TextStyle(fontSize: 16, color: Colors.white))));
  }
}
