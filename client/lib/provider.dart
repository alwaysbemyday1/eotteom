import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class SignInPage extends ChangeNotifier {
  var page = 0;

  pageUp() {
    page++;
    notifyListeners();
  }

  pageDown() {
    page--;
    notifyListeners();
  }
}

class Position extends ChangeNotifier {
  var topX = 0.0, topY = 0.0;
  var bottomX = 0.0, bottomY = 0.0;
  var shoesX = 0.0, shoesY = 0.0;
  var accessoryX = 0.0, accessoryY = 0.0;

  getRand(phoneWidth) {
    topX =
        (Random().nextInt((((phoneWidth - 24) - 8) * 0.05).toInt())).toDouble();
    topY = (Random().nextInt((((phoneWidth - 24) - 8) * 0.2858).toInt()))
        .toDouble();
    bottomX = (Random().nextInt((((phoneWidth - 24) - 8) * 0.1333).toInt()))
        .toDouble();
    bottomY =
        (Random().nextInt((((phoneWidth - 24) - 8) * 0.25).toInt())).toDouble();
    shoesX = (Random().nextInt((((phoneWidth - 24) - 8) * 0.1333).toInt()))
        .toDouble();
    shoesY =
        (Random().nextInt((((phoneWidth - 24) - 8) * 0.05).toInt())).toDouble();
    accessoryX = (Random().nextInt((((phoneWidth - 24) - 8) * 0.1333).toInt()))
        .toDouble();
    accessoryY =
        (Random().nextInt((((phoneWidth - 24) - 8) * 0.05).toInt())).toDouble();

    notifyListeners();
  }
}

class EnrollClothes extends ChangeNotifier {
  // Picture
  File? resultImage;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);

      if (image == null) return;
      File? img = File(image.path);

      img = await cropImage(imageFile: img);
      resultImage = img;
      notifyListeners();
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

// Category
  var bigCategory = 100;
  var smallCategory = 100;
  List<String> bigCategoryList = [
    "상의",
    "하의",
    "악세서리",
    "신발",
  ];

  var smallCategoryList = [
    ["니트", "맨투맨", "후디", "셔츠", "티셔츠"],
    ["청바지", "면바지", "체육복", "조거", "레깅스"],
    ["목도리", "귀걸이", "목걸이", "장갑", "몽둥이"],
    ["운동화", "구두", "슬리퍼", "스니커즈", "맨발"]
  ];

  changeNumBigCategory(int newBigCategory) {
    bigCategory = newBigCategory;
    smallCategory = 100;
    notifyListeners();
  }

  changeNumSmallCategory(int newSmallCategory) {
    smallCategory = newSmallCategory;
    notifyListeners();
  }

  var brand;

  var fit = 100;
  var sizeList = ['슬림핏', '레귤러핏', '오버핏'];
}
