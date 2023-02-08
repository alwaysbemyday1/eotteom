import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';
import 'myOutfit.dart';
import 'otherOutfit.dart';
import 'randomOutfit.dart';
import 'weatherOutfit.dart';

class Home extends StatelessWidget {
  Home({super.key});

  // var clothesDetail;
  // Future getClothes() async {
  //   http.Response response =
  //       await http.get(Uri.parse('http://127.0.0.1:8000/api/outfits/1'));
  //   clothesDetail = jsonDecode(response.body);

  //   return clothesDetail;
  // }
  // var outfitList;
  // Future getOutfitList() async {
  //   http.Response response =
  //       await http.get(Uri.parse('http://127.0.0.1:8000/api/outfits/'));
  //   outfitList = jsonDecode(response.body);

  //   print(outfitList);
  //   return outfitList;
  // }

  @override
  Widget build(BuildContext context) {
    // return Sizer(
    //   builder: (context, orientation, deviceType) {
    return SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        scrollDirection: Axis.vertical,
        child: Container(
          width: 100.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100,
              ),
              //WeatherOutfit(),
              MyOutfit(),
              OtherOutfit(),
              RandomOutfit(),
              // FutureBuilder(
              //     future: getClothes(),
              //     builder: (context, snapshot) {
              //       if (snapshot.hasData == false) {
              //         return CupertinoActivityIndicator();
              //       } else {
              //         return Container(
              //             child: Image.memory(
              //                 base64Decode(clothesDetail['image_memory'])));
              //       }
              //     }),
              // FutureBuilder(
              //     future: getOutfitList(),
              //     builder: (context, snapshot) {
              //       if (snapshot.hasData == false) {
              //         return CupertinoActivityIndicator();
              //       } else {
              //         return Row(
              //           children: [
              //             Container(
              //                 width: 200,
              //                 height: 200,
              //                 child: Image.memory(
              //                     base64Decode(outfitList[0]['image_memory']))),
              //             Container(
              //                 width: 200,
              //                 height: 200,
              //                 child: Image.memory(
              //                     base64Decode(outfitList[1]['image_memory']))),
              //           ],
              //         );
              //       }
              //     }),
              Container(
                height: 100,
              ),
            ],
          ),
        ));
    // }
    // );
  }
}
