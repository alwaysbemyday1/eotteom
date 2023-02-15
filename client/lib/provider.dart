import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
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
  // Layout
  double start = 0;
  setOffset(double db) {
    start = db;
    notifyListeners();
  }

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
  changeFit(newFit) {
    fit = newFit;
    notifyListeners();
  }

  // Size
  String size = '';
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

  postRequest(String userId, String tokenAccess) async {
    String url = 'http://127.0.0.1:8000/api/clothes/';
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers['authorization'] = 'Bearer ${tokenAccess}';
    request.files
        .add(await http.MultipartFile.fromPath('image', resultImage!.path));
    request.fields.addAll({
      // userId, major_category, minor_category를 등록하는 위젯에서 빌드시 변수를 읽어와서 요청하는 식으로 작성 필요.
      'user': userId,
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
  getWeekday(int? weekday) {
    if (weekday == 1) {
      return '월';
    } else if (weekday == 2) {
      return '화';
    } else if (weekday == 3) {
      return '수';
    } else if (weekday == 4) {
      return '목';
    } else if (weekday == 5) {
      return '금';
    } else if (weekday == 6) {
      return '토';
    } else if (weekday == 7) {
      return '일';
    }
  }

  DateTime? tmpDate = DateTime.now();
  String name = '기본';
  changeName(String newName) {
    name = newName;
    notifyListeners();
  }

  // Date
  String dateStr = DateFormat('yyyy-MM-dd').format(DateTime.now());
  changeDate(DateTime newDate) {
    dateStr = DateFormat('yyyy-MM-dd').format(newDate);
    notifyListeners();
  }

  // Season
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
    name = '기본';
    setFirstSeason();
    category = '';
    permission = false;
  }

  postRequest(String userId, String tokenAccess) async {
    String url = 'http://127.0.0.1:8000/api/outfits/';
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers['authorization'] = 'Bearer ${tokenAccess}';
    request.files
        .add(await http.MultipartFile.fromPath('image', resultImage!.path));
    request.fields.addAll({
      'user': userId,
      'category': category,
      'name': name,
      'season': season,
      'date': dateStr
    });

    print(userId);
    print(category);
    print(name);
    print(userId);
    print(season);
    http.StreamedResponse response = await request.send();
  }
}

// User 관련 Provider
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
  // var hightemperature;
  // var lowtemperature;
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

  // setTemperature(value) {
  //   temperatures = value;
  //   hightemperature = value.end.toInt();
  //   lowtemperature = value.start.toInt();
  //   notifyListeners();
  // }

  resetFilter() {
    select_date.clear();
    temperatures = SfRangeValues(0.0, 15.0);
    // hightemperature = temperatures.end.toInt();
    // lowtemperature = temperatures.start.toInt();
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

// 옷 선택 관련 Provider
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

class AnalysisProvider extends ChangeNotifier {
  List<bool> categoryPressed = [true, false, false, false, false, false, false];
  List<String> categories = ['옷장전체', '상의', '하의', '아우터', '신발', '악세사리', '원피스'];

  int categoryState = 0;

  Map<String, String> engtokrMap = {
    "black": "검정",
    "darkgrey": "다크그레이",
    "grey": "회색",
    "white": "흰색",
    "ivory": "아이보리",
    "beige": "베이지",
    "red": "빨강",
    "pink": "핑크",
    "hotpink": "핫핑크",
    "brown": "갈색",
    "camel": "카멜",
    "orange": "오렌지",
    "yellow": "노란색",
    "olivegreen": "올리브그린",
    "olive": "올리브",
    "darkgreen": "다크그린",
    "green": "녹색",
    "blue": "파란색",
    "lightblue": "라이트블루",
    "navy": "네이비",
    "purple": "보라색",
    "skyblue": "스카이블루"
  };

  Map<String, dynamic> palette = {
    "black": const Color(0xff131313),
    "darkgrey": const Color(0xff676B71),
    "grey": const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xff9F9F9F), Color(0xffE2E2E2)]),
    "white": const Color(0xffFFFFFF),
    "ivory": const Color(0xffFCF6EE),
    "beige": const Color(0xffF0DBBC),
    "red": const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xffAE1930), Color(0xffE92311)]),
    "pink": const Color(0xffF5B4A8),
    "hotpink": const Color(0xffE42493),
    "brown": const Color(0xff843215),
    "camel": const Color(0xffD7A24F),
    "orange": const Color(0xffF86A1B),
    "yellow": const Color(0xffF6E431),
    "olivegreen": const Color(0xffCAC031),
    "olive": const Color(0xff6D6C3C),
    "darkgreen": const Color(0xff1B4221),
    "green": const Color(0xff5AC13C),
    "blue": const Color(0xff2410DC),
    "lightblue": const LinearGradient(
        colors: [Color(0xffC9DEEF), Color(0xffA0CAF6)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter),
    "navy": const LinearGradient(
        colors: [Color(0xff1C2F57), Color(0xff4360BE)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter),
    "purple": const Color(0xff861CB2),
    "skyblue": const Color(0xff58C0E7)
  };

  changePressed(int index) {
    for (int i = 0; i < categoryPressed.length; i++) {
      if (i == index) {
        categoryPressed[i] = true;
        notifyListeners();
      } else {
        categoryPressed[i] = false;
        notifyListeners();
      }
    }
    categoryState = index;
    notifyListeners();
  }

  Map<String, double> dataexample = {
    "상의": 99,
    "악세사리": 58,
    "하의": 44,
    "신발": 24,
    "아우터": 14
  };

  List colordataexample = [
    ["검정", 24],
    ["빨강", 20],
    ["파랑", 21],
    ["그레이", 23],
    ["아이보리", 22]
  ];

  Map consumerInformation = {"average": 50000, "mostpick": "레귤러핏"};

  maxCategory(Map data) {
    String a = data.keys.toList()[0];
    return a;
  }

  maxCount(Map data) {
    return data[maxCategory(data)];
  }

  totalSum(Map data) {
    // 옷 개수 총합 구하는 함수
    num totalSum = 0;
    data.forEach((_, v) => totalSum += v);
    return totalSum;
  }

  percentage(List data, num totalSum) {
    // 옷이 가진 비율을 구해줌. 중요한건 List<String> 의 자료구조로 반환됨!!!!
    // dart의 경우 소수점 고정을 하는 경우 문자열로 나옴.
    List<String> percent = [];
    for (Map<String, dynamic> d in data) {
      percent.add((d['count'] / totalSum * 100).toStringAsFixed(1));
    }
    return percent;
  }
}
