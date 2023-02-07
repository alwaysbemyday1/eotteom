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
    CroppedFile? croppedImage = await ImageCropper().cropImage(
        sourcePath: imageFile.path,
        aspectRatio: CropAspectRatio(ratioX: 4, ratioY: 5));

    if (croppedImage == null) {
      return null;
    } else {
      return File(croppedImage.path);
    }
  }

// Category
  var bigCategory = '선택해주세요';
  var smallCategory = '선택해주세요';

  var categoryList = {
    "상의": ["니트", "맨투맨", "후디", "셔츠", "티셔츠"],
    "하의": ["청바지", "면바지", "체육복", "조거", "레깅스"],
    "악세서리": ["목도리", "귀걸이", "목걸이", "장갑", "몽둥이"],
    "신발": ["운동화", "구두", "슬리퍼", "스니커즈", "맨발"]
  };

  changeNumBigCategory(String newBigCategory) {
    bigCategory = newBigCategory;
    smallCategory = '선택해주세요';
    notifyListeners();
  }

  changeNumSmallCategory(String newSmallCategory) {
    smallCategory = newSmallCategory;
    notifyListeners();
  }

  // Color
  String color = "";
  changeColor(String newColor) {
    color = newColor;
    notifyListeners();
  }

  // Brand
  String brand = "";
  changeBrand(String newBrand) {
    brand = newBrand;
    notifyListeners();
  }

  // Price
  String priceStr = '';
  int price = 0;
  changePrice(newPrice) {
    priceStr = newPrice.replaceAll(RegExp('[^0-9]'), '');

    notifyListeners();
  }

  // Fit
  String fit = '';
  List<String> fitList = ['슬림핏', '레귤러핏', '오버핏'];
  changeFit(newFit) {
    fit = newFit;
    notifyListeners();
  }

  // Size
  String size = '';
  var sizeList = ['XS', 'S', 'M', 'L', 'XL', 'XXL'];
  changeSize(newSize) {
    size = newSize;
    notifyListeners();
  }

  // Memo
  String memo = '';
  changeMemo(newMemo) {
    memo = newMemo;
    notifyListeners();
  }
}

class EnrollOutfit extends ChangeNotifier {
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

  // Name
  String name = '';
  changeName(String newName) {
    name = newName;
    notifyListeners();
  }

  // Season
  String season = '봄';
  var seasonList = ['봄', '여름', '가을', '겨울'];
  changeSeason(String newSeason) {
    season = newSeason;
    notifyListeners();
  }

  // Category
  String category = '';
  var categoryList = ['댄디룩', '미니멀룩', '스트릿룩', '캐주얼룩', '스포츠룩'];
  changeCategory(String newCategory) {
    category = newCategory;
    notifyListeners();
  }
}
