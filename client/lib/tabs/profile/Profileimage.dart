import 'dart:io';
import 'package:eotteom/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class AddProfileImage extends StatefulWidget {
  const AddProfileImage({super.key});

  @override
  State<AddProfileImage> createState() => _AddProfileImageState();
}

class _AddProfileImageState extends State<AddProfileImage> {
  File? _image1;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);

      if (image == null) return;
      File? img1 = File(image.path);
      img1 = await cropImage(imageFile: img1);
      setState(() {
        _image1 = img1;
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }

  Future<File?> cropImage({required File imageFile}) async {
    CroppedFile? croppedImage =
        await ImageCropper().cropImage(sourcePath: imageFile.path);

    if (croppedImage == null) {
      return null;
    } else {
      return File(croppedImage.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: FutureBuilder(
            future: pickImage(ImageSource.gallery),
            builder: (context, snapshot) {
              return Column(children: [
                _image1 == null
                    ? Text('no image selected!', style: headLineTextTheme)
                    : Container(
                        child: Image.file(_image1!), width: 100, height: 100),
              ]);
            }));
  }
}
