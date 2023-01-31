import 'package:eotteom/provider.dart';
import 'package:eotteom/style.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Picture extends StatelessWidget {
  Picture({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100.w - 32,
        margin: EdgeInsets.fromLTRB(16, 0, 16, 32),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              margin: EdgeInsets.only(bottom: 13),
              child: Text('사진', style: enrollTitleTheme)),
          Container(
            margin: EdgeInsets.only(
                left: 100.w / 2 - 16 - ((100.w - 32) / 5 * 3) / 2,
                right: 100.w / 2 - 16 - ((100.w - 32) / 5 * 3) / 2),
            width: (100.w - 32) / 5 * 3,
            child: TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              onPressed: () {
                //context.read<EnrollClothes>().pickImage(ImageSource.gallery);
                showDialog(
                    context: context,
                    barrierDismissible: true, // 바깥 영역 터치시 닫을지 여부
                    builder: (BuildContext ctx) {
                      return Dialog(
                          child: Row(
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(ctx);
                                context
                                    .read<EnrollOutfit>()
                                    .pickImage(ImageSource.gallery);
                              },
                              child: (Text('앨범'))),
                          TextButton(
                              onPressed: () {
                                context
                                    .read<EnrollOutfit>()
                                    .pickImage(ImageSource.camera);
                              },
                              child: (Text('촬영')))
                        ],
                      ));
                    });
              },
              child: Container(
                  alignment: Alignment.center,
                  height: (100.w - 32) / 5 * 3 / 3 * 4,
                  width: (100.w - 32) / 5 * 3,
                  decoration: BoxDecoration(
                      color: Color(0xfff3f3f3),
                      borderRadius: BorderRadius.circular(5)),
                  child: context.watch<EnrollOutfit>().resultImage == null
                      ? Text('아웃핏을 선택해주세요', style: basicTextTheme2)
                      : Image.file(context.read<EnrollOutfit>().resultImage!,
                          height: (100.w - 32) / 5 * 3 / 3 * 4,
                          width: (100.w - 32) / 5 * 3,
                          fit: BoxFit.fill)),
            ),
          )
        ]));
  }
}
