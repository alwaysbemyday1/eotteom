import 'package:eotteom/provider.dart';
import 'package:eotteom/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
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
                showDialog(
                    context: context,
                    barrierDismissible: true, // 바깥 영역 터치시 닫을지 여부
                    builder: (BuildContext ctx) {
                      return Dialog(
                          child: Container(
                        height: 108,
                        width: 100.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 53.5,
                              width: 100.w - 16,
                              child: MaterialButton(
                                  padding: EdgeInsets.all(0),
                                  onPressed: () {
                                    Navigator.pop(ctx);
                                    context
                                        .read<EnrollOutfit>()
                                        .pickImage(ImageSource.camera);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              left: 22, right: 18),
                                          child: Icon(FlutterRemix.camera_fill,
                                              size: 20)),
                                      (Text(
                                        '카메라 촬영하기',
                                        style: basicTextTheme2,
                                      )),
                                    ],
                                  )),
                            ),
                            Divider(
                              thickness: 1,
                              height: 0,
                            ),
                            SizedBox(
                              height: 53.5,
                              width: 100.w - 16,
                              child: MaterialButton(
                                  padding: EdgeInsets.all(0),
                                  onPressed: () {
                                    Navigator.pop(ctx);
                                    context
                                        .read<EnrollOutfit>()
                                        .pickImage(ImageSource.gallery);
                                  },
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 22, right: 18),
                                        child: Icon(FlutterRemix.gallery_fill,
                                            size: 20),
                                      ),
                                      (Text('사진 선택하기', style: basicTextTheme2)),
                                    ],
                                  )),
                            )
                          ],
                        ),
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
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              Container(
                                  margin: EdgeInsets.only(bottom: 10.5),
                                  child: Icon(
                                    FlutterRemix.image_add_fill,
                                    size: 33,
                                    color: Color(0xff9B9B9B),
                                  )),
                              Text('내 코디를 올려보세요', style: enrollHintTheme),
                            ])
                      : Image.file(context.read<EnrollOutfit>().resultImage!,
                          height: (100.w - 32) / 5 * 3 / 3 * 4,
                          width: (100.w - 32) / 5 * 3,
                          fit: BoxFit.fill)),
            ),
          )
        ]));
  }
}
