import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import "package:syncfusion_flutter_sliders/sliders.dart";
import 'package:http/http.dart' as http;

import 'model/user_model.dart';

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
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1));

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
  String color = '';
  changeColor(String newColor) {
    color = newColor;
    notifyListeners();
  }

  // Brand
  String brand = '';
  changeBrand(String newBrand) {
    if (newBrand != '' && newBrand != null) {
      brand = newBrand;
    }

    notifyListeners();
  }

  // Price
  String priceStr = '';
  changePrice(newPrice) {
    if (newPrice != '' && newPrice != null) {
      priceStr = newPrice.replaceAll(RegExp('[^0-9]'), '');
    }
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
  String name = '';
  changeName(newName) {
    name = newName;
    notifyListeners();
  }

  postRequest() async {
    String url = 'http://127.0.0.1:8000/api/clothes/';
    var request = http.MultipartRequest('POST', Uri.parse(url));

    request.files
        .add(await http.MultipartFile.fromPath('image', resultImage!.path));
    request.fields.addAll({
      'user': '16440a1d-7c3a-46b4-ae2a-0b375e4c6058',
      'major_category': '1',
      'minor_category': '1'
    });
    if (name != '') {
      request.fields['name'] = name;
    }
    if (brand != '') {
      request.fields['brand'] = brand;
    }
    // fit 생기면 주석 해제
    // if (fit != '') {
    //   request.fields['fit'] = fit;
    // }
    if (size != '') {
      request.fields['size'] = size;
    }
    if (priceStr != '') {
      request.fields['price'] = priceStr;
    }
    if (color != '') {
      request.fields['color'] = color;
    }

    http.StreamedResponse response = await request.send();
  }

  initEnrollClothes() {
    resultImage = null;
    name = '';
    size = '';
    fit = '';
    priceStr = '';
    brand = '';
    color = '';
    bigCategory = '선택해주세요';
    smallCategory = '선택해주세요';
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
    CroppedFile? croppedImage = await ImageCropper().cropImage(
        sourcePath: imageFile.path,
        aspectRatio: CropAspectRatio(ratioX: 4, ratioY: 5));

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

// Date
  DateTime? date = new DateTime.now();
  changeDate(DateTime newDate) {
    date = newDate;
    notifyListeners();
  }

  // Season
  DateTime? tmpDate = new DateTime.now();
  String season = '';
  setFirstSeason() {
    if (tmpDate!.month >= 3 && tmpDate!.month <= 5) {
      season = '봄';
    } else if (tmpDate!.month >= 6 && tmpDate!.month <= 8) {
      season = '여름';
    } else if (tmpDate!.month >= 9 && tmpDate!.month <= 11) {
      season = '가을';
    } else {
      season = '겨울';
    }
  }

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

  // Open permission
  bool permission = false;
  changePermission() {
    permission = !permission;
    notifyListeners();
  }

  initEnrollOufit() {
    resultImage = null;
    name = '';
    setFirstSeason();
    category = '';
    permission = false;
  }
}

class UserProvider extends ChangeNotifier {
  String email = '';
  String password = '';
  int gender = -1;
  String tokenAccess = '';
  String tokenRefresh = '';
  String userId = '';

  setUserFromJson(User user) async {
    email = user.email;
    password = user.password;
    if (user.gender != null) {
      gender = int.parse(user.gender);
    }

    tokenAccess = user.tokenAccess;
    tokenRefresh = user.tokenRefresh;
    userId = user.userId;
    notifyListeners();
  }
}

class FilterProvider extends ChangeNotifier {
  List<String> dropdownlist = ["전체", "좋아요만"];
  String selectedDropdown = "전체";
  List<String> dropdownlistCloset = ["전체", "좋아요만"];
  String selectedDropdownCloset = "전체";

  bool seasoncheck = true;
  bool datecheck = true;
  bool temperaturecheck = true;
  bool labelcheck = true;
  int nowyear = DateTime.now().year.toInt();
  var select_date;
  var hightemperature;
  var lowtemperature;
  var temperatures = SfRangeValues(0.0, 15.0);

  List<String> outfitLabel = ["댄디룩", "스트릿룩", "캐쥬얼룩"];
  List<bool> outfitLabelSelect = [true, true, true];

  List<String> seasonLabel = ["봄", "여름", "가을", "겨울"];
  List<bool> seasonLabelSelect = [true, true, true, true];

  changeDatecheck() {
    datecheck = !datecheck;
    notifyListeners();
  }

  changeTemperaturecheck() {
    temperaturecheck = !temperaturecheck;
    notifyListeners();
  }

  changeLabelCheck() {
    labelcheck = !labelcheck;
    notifyListeners();
  }

  changeoutfitLabelSelect(int index) {
    outfitLabelSelect[index] = !outfitLabelSelect[index];
    notifyListeners();
  }

  changeseasonLabelSelect(int index) {
    seasonLabelSelect[index] = !seasonLabelSelect[index];
    notifyListeners();
  }

  addYear() {
    nowyear++;
    notifyListeners();
  }

  minusYear() {
    nowyear--;
    notifyListeners();
  }

  selectDate(value) {
    select_date = value;
    notifyListeners();
  }

  setTemperature(value) {
    temperatures = value;
    hightemperature = value.end.toInt();
    lowtemperature = value.start.toInt();
    notifyListeners();
  }

  resetFilter() {
    select_date.clear();
    temperatures = SfRangeValues(0.0, 15.0);
    hightemperature = temperatures.end.toInt();
    lowtemperature = temperatures.start.toInt();
    outfitLabelSelect = [true, true, true];
    notifyListeners();
  }

  changeSelectedDropdown(value) {
    selectedDropdown = value;
    notifyListeners();
  }

  changeSelectedDropdownCloset(value) {
    selectedDropdownCloset = value;
    notifyListeners();
  }
}

class ClothProvider extends ChangeNotifier {
  Map<String, List<String>> totalMap = {
    "상의": ["니트", "멘투멘", "후디", "셔츠", "티셔츠", "슈트상의", "트레이닝복"],
    "하의": ["팬츠", "데님팬츠", "트레이닝룩", "슬랙스"],
    "아우터": ["코트", "트랜치코트", "자켓", "패딩", "블레이저"],
    "신발": ["스니커즈", "구두", "부츠", "슬리퍼", "샌들", "캔버스"],
    "악세사리": ["비니", "머플러", "벨트", "넥타이", "캡", "주얼리"],
    "원피스": ["원피스"]
  };

  List<String> categories = ["상의", "하의", "아우터", "신발", "악세사리", "원피스"];

  int firstindex = 0;
  int secondindex = 0;

  List<bool> categoryPress = [true, false, false, false, false, false];

  List<bool> topPress = [true, false, false, false, false, false, false];
  List<bool> bottomPress = [true, false, false, false];
  List<bool> outerPress = [true, false, false, false, false];
  List<bool> shoePress = [true, false, false, false, false];
  List<bool> accessoryPress = [true, false, false, false, false, false];
  List<bool> onepiecePress = [true];


  setTrue(List<bool> press, int index) {
    for (int i = 0; i < press.length; i++) {
      if (i == index) {
        press[i] = true;
      } else {
        press[i] = false;
      }
    }
  }

  whichCategory(int firstindex, int secondindex) {
    var sublist = totalMap[categories[firstindex]];
    if (sublist != null) {
      String subcategory = sublist[secondindex];
      return subcategory;
    }
  }

  selectFirstIndex(int index) {
    setTrue(categoryPress, index);
    firstindex = index;
    print(categories[firstindex]);
    notifyListeners();
  }

  selectSecondIndex(int index) {
    setTrue(boolCallback(categories[firstindex]), index);
    secondindex = index;
    print(whichCategory(firstindex, secondindex));
    notifyListeners();
  }

  boolCallback(String category) {
    if (category == "상의") {
      return topPress;
    } else if (category == "하의") {
      return bottomPress;
    } else if (category == "아우터") {
      return outerPress;
    } else if (category == "신발") {
      return shoePress;
    } else if (category == "악세사리") {
      return accessoryPress;
    } else if (category == "원피스") {
      return onepiecePress;
    }
  }
}
