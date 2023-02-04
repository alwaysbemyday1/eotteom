import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'closet/closet_appbar.dart';
import 'closet/closet.dart';
import "package:eotteom/provider.dart";

class MyCloset extends StatelessWidget {
  const MyCloset({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => OutfitProvider())),
      ],
      child: MaterialApp(
        home: Scaffold(
          appBar: appbar,
          body: Closet(),
        ),
      ),
    );
  }
}

class OutfitProvider extends ChangeNotifier {
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
