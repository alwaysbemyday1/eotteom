import 'package:eotteom/model/clothes_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import 'package:provider/provider.dart';
import 'package:eotteom/provider.dart';

class EnrollButton extends StatelessWidget {
  EnrollButton({super.key, this.ctx, this.flag, this.addClothes});
  var ctx;
  var flag;
  var addClothes;
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
                      addClothes(Clothes(
                          brand: context.read<EnrollClothes>().brand,
                          bigCategory:
                              context.read<EnrollClothes>().bigCategory,
                          smallCategory:
                              context.read<EnrollClothes>().smallCategory,
                          name: context.read<EnrollClothes>().name,
                          color: context.read<EnrollClothes>().color,
                          fit: context.read<EnrollClothes>().fit,
                          price: context.read<EnrollClothes>().priceStr,
                          size: context.read<EnrollClothes>().size,
                          picture: context.read<EnrollClothes>().resultImage));
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
