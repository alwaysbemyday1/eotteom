import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:eotteom/provider.dart';

class EnrollButton extends StatelessWidget {
  EnrollButton({super.key, this.ctx});
  var ctx;

  @override
  Widget build(BuildContext context) {
    String userId = context.watch<UserProvider>().userId;

    return Container(
        height: 92,
        width: 100.w,
        alignment: Alignment.center,
        padding: EdgeInsets.fromLTRB(16, 16, 16, 32),
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
                    child: Text('저장',
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                    onPressed: () {
                      context.read<EnrollClothes>().postRequest(
                          context.read<UserProvider>().userId,
                          context.read<UserProvider>().tokenAccess);
                      Navigator.pop(ctx);
                    }),
              )
            : Container(
                width: 100.w - 32,
                height: 44,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5), color: Colors.grey),
                alignment: Alignment.center,
                child: Text('저장',
                    style: TextStyle(fontSize: 16, color: Colors.white))));

    // Container(
    //     height: 92,
    //     width: 100.w,
    //     alignment: Alignment.center,
    //     padding: EdgeInsets.fromLTRB(16, 16, 16, 32),
    //     decoration: BoxDecoration(color: Colors.white, boxShadow: [
    //       BoxShadow(color: Colors.grey, blurRadius: 1, spreadRadius: 0)
    //     ]),
    //     child: (context.watch<EnrollClothes>().resultImage != null &&
    //             context.watch<EnrollClothes>().smallCategory != '선택해주세요')
    //         ? Container(
    //             width: 100.w - 32,
    //             height: 44,
    //             child: CupertinoButton(
    //                 padding: EdgeInsets.all(0),
    //                 color: Colors.black,
    //                 borderRadius: BorderRadius.circular(5),
    //                 child: Text('저장',
    //                     style: TextStyle(fontSize: 16, color: Colors.white)),
    //                 onPressed: () {
    //                   context.read<EnrollClothes>().postRequest(
    //                       context.read<UserProvider>().userId,
    //                       context.read<UserProvider>().tokenAccess);
    //                   Navigator.pop(ctx);
    //                 }),
    //           )
    //         : Container(
    //             width: 100.w - 32,
    //             height: 44,
    //             decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(5), color: Colors.grey),
    //             alignment: Alignment.center,
    //             child: Text('저장',
    //                 style: TextStyle(fontSize: 16, color: Colors.white))));
  }
}
