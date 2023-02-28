import 'dart:convert';

import 'package:eotteom/provider.dart';
import 'package:eotteom/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Picture extends StatefulWidget {
  Picture({super.key, required this.flag, this.myClothesList});
  int flag;
  var myClothesList;

  @override
  State<Picture> createState() => _PictureState();
}

class _PictureState extends State<Picture> {
  List<String> bigCategoryList = ['상의', '하의', '아우터', '신발', '악세사리'];
  Map<String, List<String>> smallCategoryList1 = {
    '상의': ['니트', '맨투맨'],
    '하의': ['청바지', '치마'],
    '아우터': ['코트', '패딩'],
    '신발': ['슬리퍼', '운동화'],
    '악세사리': ['장갑', '가방']
  };
  List<String> smallCategoryList2 = [
    '맨투맨',
    '니트',
    '청바지',
    '치마',
    '코트',
    '패딩',
    '운동화',
    '슬리퍼',
    '장갑',
    '가방'
  ];
  checkSmallCategoryClothes(smallCategory) {
    for (int i = 0; i < widget.myClothesList.length; i++) {
      if (smallCategoryList2[widget.myClothesList[i]['minor_category']] ==
          smallCategory) {
        return i;
      }
    }
    return -1;
  }

  checkBigCategoryClothes(bigCategory) {
    for (int i = 0; i < widget.myClothesList.length; i++) {
      if (bigCategoryList[widget.myClothesList[i]['major_category']] ==
          bigCategory) {
        return i;
      }
    }
    return -1;
  }

  int topIndex = 0;
  int accessoryIndex = 0;
  int count = 1;
  checkMultipleClothes(category, index) {
    print('횟수');
    print(count);
    for (int i = index; i < widget.myClothesList.length; i++) {
      if (bigCategoryList[widget.myClothesList[i]['major_category']] ==
          category) {
        index++;
        count++;
        print('조건 만족');
        return i;
      }
      //print(bigCategoryList[widget.myClothesList[i]['major_category']]);
      print(category);
      index++;
    }

    count++;
    return index;
  }

  @override
  void initState() {
    topIndex = 0;
    accessoryIndex = 0;
    super.initState();
  }

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
                      return widget.flag == 0
                          ? Dialog(
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 22, right: 18),
                                                child: Icon(
                                                    FlutterRemix.camera_fill,
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 22, right: 18),
                                              child: Icon(
                                                  FlutterRemix.gallery_fill,
                                                  size: 20),
                                            ),
                                            (Text('사진 선택하기',
                                                style: basicTextTheme2)),
                                          ],
                                        )),
                                  )
                                ],
                              ),
                            ))
                          : Dialog(
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 22, right: 18),
                                                child: Icon(
                                                    FlutterRemix.camera_fill,
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 22, right: 18),
                                              child: Icon(
                                                  FlutterRemix.gallery_fill,
                                                  size: 20),
                                            ),
                                            (Text('사진 선택하기',
                                                style: basicTextTheme2)),
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
                  width: (100.w - 32) / 5 * 3,
                  height: (100.w - 32) / 5 * 3 / 3 * 4,
                  decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(5)),
                  padding: widget.flag == 0
                      ? EdgeInsets.zero
                      : EdgeInsets.only(right: 4, left: 4, top: 2, bottom: 2),
                  child: widget.flag == 0
                      // ? Column(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //         Container(
                      //             margin: EdgeInsets.only(bottom: 10.5),
                      //             child: Icon(
                      //               FlutterRemix.image_add_fill,
                      //               size: 33,
                      //               color: Color(0xff9B9B9B),
                      //             )),
                      //         Text('내 코디를 올려보세요', style: enrollHintTheme),
                      //       ])
                      ? Image.file(context.read<EnrollOutfit>().resultImage!,
                          height: (100.w - 32) / 5 * 3 / 3 * 4,
                          width: (100.w - 32) / 5 * 3,
                          fit: BoxFit.fill)
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            checkSmallCategoryClothes('모자') != -1
                                ? Container(
                                    width: (100.w - 32) / 5 * 3 / 210 * 44,
                                    height: (100.w - 32) / 5 * 3 / 210 * 44,
                                    margin: EdgeInsets.only(bottom: 2),
                                    alignment: Alignment.center,
                                    child: Image.memory(
                                      base64Decode(widget.myClothesList[
                                              checkSmallCategoryClothes('모자')]
                                          ['image_memory']),
                                      fit: BoxFit.fill,
                                    ))
                                : Container(
                                    width: (100.w - 32) / 5 * 3 / 210 * 44,
                                    height: (100.w - 32) / 5 * 3 / 210 * 44,
                                    margin: EdgeInsets.only(bottom: 2),
                                  ),
                            Container(
                              height: ((100.w - 32) / 5 * 3 - 16) / 3,
                              margin: EdgeInsets.only(bottom: 2),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  checkMultipleClothes('상의', topIndex) <=
                                          (widget.myClothesList.length - 1)
                                      ? Container(
                                          width:
                                              ((100.w - 32) / 5 * 3 - 16) / 3,
                                          height:
                                              ((100.w - 32) / 5 * 3 - 16) / 3,
                                          alignment: Alignment.center,
                                          child: Image.memory(
                                            base64Decode(
                                                widget.myClothesList[topIndex]
                                                    ['image_memory']),
                                            fit: BoxFit.fill,
                                          ))
                                      : SizedBox(
                                          height: 0,
                                          width: 0,
                                        ),
                                  checkMultipleClothes('상의', topIndex) <=
                                          (widget.myClothesList.length - 1)
                                      ? Container(
                                          width:
                                              ((100.w - 32) / 5 * 3 - 16) / 3,
                                          height:
                                              ((100.w - 32) / 5 * 3 - 16) / 3,
                                          alignment: Alignment.center,
                                          child: Image.memory(
                                            base64Decode(
                                                widget.myClothesList[topIndex]
                                                    ['image_memory']),
                                            fit: BoxFit.fill,
                                          ))
                                      : SizedBox(
                                          height: 0,
                                          width: 0,
                                        ),
                                  checkMultipleClothes('상의', topIndex) <=
                                          (widget.myClothesList.length - 1)
                                      ? Container(
                                          width:
                                              ((100.w - 32) / 5 * 3 - 16) / 3,
                                          height:
                                              ((100.w - 32) / 5 * 3 - 16) / 3,
                                          alignment: Alignment.center,
                                          child: Image.memory(
                                            base64Decode(
                                                widget.myClothesList[topIndex]
                                                    ['image_memory']),
                                            fit: BoxFit.fill,
                                          ))
                                      : SizedBox(
                                          height: 0,
                                          width: 0,
                                        )
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                checkBigCategoryClothes('아우터') != -1
                                    ? Container(
                                        width: ((100.w - 32) / 5 * 3 - 16) / 3,
                                        height: ((100.w - 32) / 5 * 3 - 16) / 3,
                                        margin:
                                            EdgeInsets.only(top: 2, right: 4),
                                        alignment: Alignment.center,
                                        child: Image.memory(
                                          base64Decode(widget.myClothesList[
                                              checkBigCategoryClothes(
                                                  '아우터')]['image_memory']),
                                          fit: BoxFit.fill,
                                        ))
                                    : Container(
                                        width: ((100.w - 32) / 5 * 3 - 16) / 3,
                                        height: ((100.w - 32) / 5 * 3 - 16) / 3,
                                        alignment: Alignment.center,
                                      ),
                                Container(
                                  width: ((100.w - 32) / 5 * 3 - 16) / 3,
                                  height: (100.w - 32) / 5 * 138 / 64,
                                  margin: EdgeInsets.only(right: 4),
                                  child: Column(
                                    children: [
                                      checkBigCategoryClothes('하의') != -1
                                          ? Container(
                                              width:
                                                  ((100.w - 32) / 5 * 3 - 16) /
                                                      3,
                                              height:
                                                  (100.w - 32) / 5 / 64 * 89,
                                              alignment: Alignment.center,
                                              margin:
                                                  EdgeInsets.only(bottom: 3),
                                              child: Image.memory(
                                                base64Decode(widget
                                                        .myClothesList[
                                                    checkBigCategoryClothes(
                                                        '하의')]['image_memory']),
                                                fit: BoxFit.fill,
                                              ))
                                          : Container(
                                              width:
                                                  ((100.w - 32) / 5 * 3 - 16) /
                                                      3,
                                              height:
                                                  (100.w - 32) / 5 / 64 * 89,
                                              alignment: Alignment.center,
                                            ),
                                      checkBigCategoryClothes('신발') != -1
                                          ? Container(
                                              width: (100.w - 32) /
                                                  5 *
                                                  3 /
                                                  210 *
                                                  44,
                                              height: (100.w - 32) /
                                                  5 *
                                                  3 /
                                                  210 *
                                                  44,
                                              alignment: Alignment.center,
                                              child: Image.memory(
                                                base64Decode(widget
                                                        .myClothesList[
                                                    checkBigCategoryClothes(
                                                        '신발')]['image_memory']),
                                                fit: BoxFit.fill,
                                              ))
                                          : Container(
                                              width: (100.w - 32) /
                                                  5 *
                                                  3 /
                                                  210 *
                                                  44,
                                              height: (100.w - 32) /
                                                  5 *
                                                  3 /
                                                  210 *
                                                  44,
                                              alignment: Alignment.center,
                                            )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: ((100.w - 32) / 5 * 3 - 16) / 3,
                                  alignment: Alignment.center,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      checkMultipleClothes(
                                                  '악세사리', accessoryIndex) <=
                                              (widget.myClothesList.length - 1)
                                          ? Container(
                                              width: (100.w - 32) /
                                                  5 *
                                                  3 /
                                                  210 *
                                                  44,
                                              height: (100.w - 32) /
                                                  5 *
                                                  3 /
                                                  210 *
                                                  44,
                                              margin:
                                                  EdgeInsets.only(bottom: 20),
                                              alignment: Alignment.center,
                                              child: Image.memory(
                                                base64Decode(
                                                    widget.myClothesList[
                                                            accessoryIndex]
                                                        ['image_memory']),
                                                fit: BoxFit.fill,
                                              ))
                                          : Container(
                                              width: (100.w - 32) /
                                                  5 *
                                                  3 /
                                                  210 *
                                                  44,
                                              height: (100.w - 32) /
                                                  5 *
                                                  3 /
                                                  210 *
                                                  44,
                                              alignment: Alignment.center,
                                              margin:
                                                  EdgeInsets.only(bottom: 20),
                                            ),
                                      checkMultipleClothes(
                                                  '악세사리', accessoryIndex) <=
                                              (widget.myClothesList.length - 1)
                                          ? Container(
                                              width: (100.w - 32) /
                                                  5 *
                                                  3 /
                                                  210 *
                                                  44,
                                              height: (100.w - 32) /
                                                  5 *
                                                  3 /
                                                  210 *
                                                  44,
                                              alignment: Alignment.center,
                                              child: Image.memory(
                                                base64Decode(
                                                    widget.myClothesList[
                                                            accessoryIndex]
                                                        ['image_memory']),
                                                fit: BoxFit.fill,
                                              ))
                                          : Container(
                                              width: (100.w - 32) /
                                                  5 *
                                                  3 /
                                                  210 *
                                                  44,
                                              height: (100.w - 32) /
                                                  5 *
                                                  3 /
                                                  210 *
                                                  44,
                                              alignment: Alignment.center,
                                            )
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        )),
            ),
          )
        ]));
  }
}
