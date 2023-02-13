import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../provider.dart';

class EnrollButton extends StatelessWidget {
  EnrollButton({super.key, this.ctx});
  var ctx;

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
        child: (context.watch<EnrollOutfit>().resultImage != null &&
                context.watch<EnrollOutfit>().category != '')
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
                      context.read<EnrollOutfit>().postRequest(
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
  }
}
