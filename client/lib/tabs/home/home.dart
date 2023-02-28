import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../provider.dart';
import 'myOutfit.dart';

import 'otherOutfit.dart';
import 'randomOutfit.dart';
import 'weatherOutfit.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  // var clothesDetail;
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    print('home');
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
          border: Border(bottom: BorderSide(color: Colors.transparent)),
          trailing: SizedBox(
            width: 50,
            child: CupertinoButton(
              padding: EdgeInsets.fromLTRB(30, 5, 0, 0),
              child: Icon(Icons.settings),
              onPressed: () {},
            ),
          )),
      child: Center(
          child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              scrollDirection: Axis.vertical,
              child: Container(
                width: 100.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 120,
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
              ))),
    );
  }
}
