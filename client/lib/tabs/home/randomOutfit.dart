import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

import '../../provider.dart';
import '../add/addoutfit.dart';

class RandomOutfit extends StatefulWidget {
  const RandomOutfit({Key? key}) : super(key: key);

  @override
  State<RandomOutfit> createState() => _RandomOutfitState();
}

class _RandomOutfitState extends State<RandomOutfit> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<Position>().getRand(100.w);
    });
  }

  List<Container> myOutfitPictureList = [];

  Future getMyOutfitList(BuildContext context) async {
    http.Response response = await http.get(
        Uri.parse(
            'http://127.0.0.1:8000/api/outfits/list/${context.read<UserProvider>().userId}/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${context.read<UserProvider>().tokenAccess}',
        });
    var tmpMyOutfitList = jsonDecode(response.body);
    var myOutfitList = tmpMyOutfitList['results'];
    for (int i = 0; i < myOutfitList.length; i++) {
      myOutfitPictureList.add(Container(
          width: (100.w - 32 - 40) / 2,
          height: ((100.w - 32 - 40) / 2) / 5 * 6,
          child: Image.memory(
            base64Decode(myOutfitList[i]['image_memory']),
            fit: BoxFit.fill,
          )));
    }

    return myOutfitPictureList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (100.w - 24) - 8,
      height:
          (18 + 14) * 1.3 + (13 + 17 + 8) + ((100.w - 24) - 8) / 2 + 44 * 2 + 5,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('내 옷장 속 랜덤 코디',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                  SizedBox(
                    height: 14 * 1.3,
                    child: CupertinoButton(
                        padding: EdgeInsets.all(0),
                        child: Text('기록보기',
                            style: TextStyle(
                                fontSize: 14, color: CupertinoColors.black)),
                        onPressed: () {}),
                  )
                ]),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 13),
              child: Text(
                '내 옷들 중에서 무작위로 조합해드려요',
                style: TextStyle(fontSize: 14),
              ),
            ),
            Container(
                width: (100.w - 24) - 8,
                height: ((100.w - 24) - 8) / 2,
                margin: EdgeInsets.fromLTRB(0, 0, 0, 17),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        blurRadius: 2,
                      )
                    ]),
                child: Container(
                  width: (100.w - 24) - 8,
                  height: ((100.w - 24) - 8) / 2,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.fromLTRB(
                              context.watch<Position>().topX,
                              context.watch<Position>().topY,
                              0,
                              0),
                          child: Image.asset('assets/images/clothes/top.png',
                              height: ((100.w - 24) - 8) / 3,
                              width: ((100.w - 24) - 8) / 3)),
                      Container(
                          margin: EdgeInsets.fromLTRB(
                              context.watch<Position>().bottomX,
                              context.watch<Position>().bottomY,
                              0,
                              0),
                          child: Image.asset('assets/images/clothes/bottom.png',
                              height: ((100.w - 24) - 8) / 2.5,
                              width: ((100.w - 24) - 8) / 5)),
                      Column(
                        children: [
                          Container(
                              margin: EdgeInsets.fromLTRB(
                                  context.watch<Position>().accessoryX,
                                  context.watch<Position>().accessoryY,
                                  0,
                                  0),
                              child: Image.asset(
                                  'assets/images/clothes/muffler.png',
                                  height: ((100.w - 24) - 8) / 5,
                                  width: ((100.w - 24) - 8) / 5)),
                          Container(
                              margin: EdgeInsets.fromLTRB(
                                  context.watch<Position>().shoesX,
                                  context.watch<Position>().shoesY,
                                  0,
                                  0),
                              child: Image.asset(
                                  'assets/images/clothes/shoes.png',
                                  height: ((100.w - 24) - 8) / 5,
                                  width: ((100.w - 24) - 8) / 5)),
                        ],
                      ),
                    ],
                  ),
                )),
            Container(
                child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
                  width: (100.w - 24) - 8,
                  height: 44,
                  decoration: BoxDecoration(
                    border: Border.all(color: CupertinoColors.black, width: 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: CupertinoButton(
                      padding: EdgeInsets.all(0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(FlutterRemix.refresh_line, size: 17.64),
                          SizedBox(width: 10.8),
                          Text('다시 돌리기', style: TextStyle(fontSize: 14))
                        ],
                      ),
                      onPressed: () {
                        context.read<Position>().getRand(100.w);
                      }),
                ),
                SizedBox(
                  width: (100.w - 24) - 8,
                  height: 44,
                  child: CupertinoButton(
                      padding: EdgeInsets.all(0),
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5),
                      child: Text('이 코디 저장하기', style: TextStyle(fontSize: 14)),
                      onPressed: () {}),
                )
              ],
            )),
          ]),
    );
  }
}
