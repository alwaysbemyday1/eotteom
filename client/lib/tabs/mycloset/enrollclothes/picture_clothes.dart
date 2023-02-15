import 'package:eotteom/provider.dart';
import 'package:eotteom/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Picture extends StatefulWidget {
  Picture({super.key});

  @override
  State<Picture> createState() => _PictureState();
}

class _PictureState extends State<Picture> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200 + 13 + 18 * 1.3,
        width: 100.w - 32,
        margin: EdgeInsets.fromLTRB(16, 0, 16, 32),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              margin: EdgeInsets.only(bottom: 13),
              child: Text('사진', style: enrollTitleTheme)),
          TextButton(
            clipBehavior: Clip.hardEdge,
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
                        child: Container(
                      height: 108,
                      width: 100.w,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)),
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
                                      .read<EnrollClothes>()
                                      .pickImage(ImageSource.gallery);
                                },
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    color: Color(0xfff3f3f3),
                    borderRadius: BorderRadius.circular(5)),
                child: context.watch<EnrollClothes>().resultImage == null
                    ? Text('사진을 선택해주세요', style: basicTextTheme2)
                    : Image.file(context.read<EnrollClothes>().resultImage!,
                        height: 200, width: 200, fit: BoxFit.fill)),
          )
        ]));
  }
}

// import 'dart:io';
// import 'package:eotteom/style.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';

// class AddOutfit extends StatefulWidget {
//   const AddOutfit({super.key});

//   @override
//   State<AddOutfit> createState() => _AddOutfitState();
// }

// class _AddOutfitState extends State<AddOutfit> {
//   File? _image1;
//   File? _image2;
//   File? _image3;

//   Future pickImage(ImageSource source) async {
//     try {
//       final image = await ImagePicker().pickImage(source: source);

//       if (image == null) return;
//       File? img1 = File(image.path);
//       File? img2 = File(image.path);
//       File? img3 = File(image.path);
//       img1 = await cropImage(imageFile: img1);
//       img2 = await cropImage(imageFile: img2);
//       img3 = await cropImage(imageFile: img3);

//       setState(() {
//         _image1 = img1;
//         _image2 = img2;
//         _image3 = img3;
//       });
//     } on PlatformException catch (e) {
//       print(e);
//     }
//   }

//   Future<File?> cropImage({required File imageFile}) async {
//     CroppedFile? croppedImage =
//         await ImageCropper().cropImage(sourcePath: imageFile.path);

//     if (croppedImage == null) {
//       return null;
//     } else {
//       return File(croppedImage.path);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//         child: FutureBuilder(
//             future: pickImage(ImageSource.gallery),
//             builder: (context, snapshot) {
//               return Column(children: [
//                 _image1 == null
//                     ? Text('no image selected!', style: headLineTextTheme)
//                     : Container(
//                         child: Image.file(_image1!), width: 100, height: 100),
//                 _image2 == null
//                     ? Text('no image selected!', style: headLineTextTheme)
//                     : Container(
//                         child: Image.file(_image2!), width: 100, height: 100),
//                 _image3 == null
//                     ? Text('no image selected!', style: headLineTextTheme)
//                     : Container(
//                         child: Image.file(_image3!), width: 100, height: 100),
//               ]);
//             }));
//   }
// }

