import "package:flutter/material.dart";
import "package:sizer/sizer.dart";
import "dart:io";
import "package:flutter/foundation.dart";
import "package:image_picker/image_picker.dart";
import "package:flutter_remix/flutter_remix.dart";

class ProfileImage extends StatefulWidget {
  const ProfileImage({super.key});

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  XFile? _pickedFile;

  final TextStyle _fontStyle = const TextStyle(
      fontFamily: "NotoSans", fontWeight: FontWeight.w700, fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        if (_pickedFile == null) {
          return InkWell(
            child: Container(
              color: Color(0xffD9D9D9),
              width: 25.w,
              height: 25.w,
            ),
            onTap: () {
              _profileChange();
            },
          );
        } else {
          return InkWell(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: FileImage(File(_pickedFile!.path)),
                      fit: BoxFit.cover)),
              width: 25.w,
              height: 25.w,
            ),
            onTap: () {
              _profileChange();
            },
          );
        }
      },
    );
  }

  _profileChange() {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: ((context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('프로필 사진 변경'),
                IconButton(
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop();
                    },
                    icon: Icon(Icons.close))
              ],
            ),
            content: Row(
              children: [Text('프로필 사진을 변경하시겠습니까?')],
            ),
            actions: [
              IconButton(
                onPressed: () => _getCameraImage(),
                icon: const Icon(FlutterRemix.camera_fill),
                iconSize: 20.w,
              ),
              IconButton(
                iconSize: 20.w,
                onPressed: () => _getPhotoLibraryImage(),
                icon: const Icon(FlutterRemix.image_2_fill),
              )
            ],
          );
        }));
  }

  // _showBottomSheet() {
  //   return showDialog(
  //       context: context,
  //       builder: ((context) {
  //         return AlertDialog(
  //           content: SizedBox(
  //           height: 40.h,
  //           child: Column(
  //             children: [
  //               Padding(
  //                 padding: EdgeInsets.only(top: 5.h),
  //                 child: Text(
  //                   "프로필 사진 변경하기",
  //                   style: _fontStyle,
  //                 ),
  //               ),
  //               SizedBox(
  //                 height: 10.w,
  //               ),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   IconButton(
  //                     onPressed: () => _getCameraImage(),
  //                     icon: const Icon(Icons.camera_alt),
  //                     iconSize: 20.w,
  //                   ),
  //                   IconButton(
  //                     iconSize: 20.w,
  //                     onPressed: () => _getPhotoLibraryImage(),
  //                     icon: const Icon(Icons.photo_album),
  //                   )
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ),
  //         );
  //       }));
  // }

  _getCameraImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _pickedFile = pickedFile;
      });
      Navigator.of(context, rootNavigator: true).pop();
    } else {
      if (kDebugMode) {
        print('이미지 선택안함');
      }
    }
  }

  _getPhotoLibraryImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _pickedFile = pickedFile;
      });
      Navigator.of(context, rootNavigator: true).pop();
    } else {
      if (kDebugMode) {
        print('이미지 선택안함');
      }
    }
  }
}
