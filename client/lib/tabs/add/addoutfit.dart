import 'dart:io';
import 'package:eotteom/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class AddOutfit extends StatefulWidget {
  const AddOutfit({super.key});

  @override
  State<AddOutfit> createState() => _AddOutfitState();
}

class _AddOutfitState extends State<AddOutfit> {
  File? _image1;
  File? _image2;
  File? _image3;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);

      if (image == null) return;
      File? img1 = File(image.path);
      File? img2 = File(image.path);
      File? img3 = File(image.path);
      img1 = await cropImage(imageFile: img1);
      img2 = await cropImage(imageFile: img2);
      img3 = await cropImage(imageFile: img3);

      setState(() {
        _image1 = img1;
        _image2 = img2;
        _image3 = img3;
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
                _image2 == null
                    ? Text('no image selected!', style: headLineTextTheme)
                    : Container(
                        child: Image.file(_image2!), width: 100, height: 100),
                _image3 == null
                    ? Text('no image selected!', style: headLineTextTheme)
                    : Container(
                        child: Image.file(_image3!), width: 100, height: 100),
              ]);
            }));
  }
}
