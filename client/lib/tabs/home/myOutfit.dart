import 'dart:convert';

import 'package:eotteom/provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

class MyOutfit extends StatefulWidget {
  MyOutfit({super.key});

  @override
  State<MyOutfit> createState() => _MyOutfitState();
}

class _MyOutfitState extends State<MyOutfit> {
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
    myOutfitPictureList = [];
    return Sizer(builder: (context, orientation, deviceType) {
      return Container(
        height: 12 +
            18 * 1.3 +
            ((100.w - 32 - 40) / 2) / 5 * 6, // 사기간격 + lineheight + 사진 크기
        margin: EdgeInsets.fromLTRB(0, 0, 0, 26),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(16, 0, 16, 12),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('최근 나의 코디',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700)),
                      SizedBox(
                        height: 14 * 1.3,
                        child: CupertinoButton(
                            padding: EdgeInsets.all(0),
                            child: Text('더보기',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: CupertinoColors.black)),
                            onPressed: () {}),
                      )
                    ]),
              ),
              SizedBox(
                height: ((100.w - 32 - 40) / 2) / 5 * 6,
                child: FutureBuilder(
                    future: getMyOutfitList(context),
                    builder: (context, snapshot) {
                      if (snapshot.hasData == false) {
                        return CupertinoActivityIndicator();
                      } else {
                        return GridView(
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent:
                                      ((100.w - 32 - 40) / 2) / 5 * 6,
                                  childAspectRatio: 6 / 5,
                                  mainAxisSpacing: 8),
                          children: snapshot.data,
                        );
                      }
                    }),
              ),
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Container(
              //     height: ((100.w - 32 - 40) / 3 + 24) / 189 * 236,
              //     child: FutureBuilder(
              //         future: getMyOutfitList(context),
              //         builder: (context, snapshot) {
              //           if (snapshot.hasData == false) {
              //             return CupertinoActivityIndicator();
              //           } else {
              //             return Row(
              //                 mainAxisAlignment: MainAxisAlignment.start,
              //                 children: snapshot.data);
              //           }
              //         }),
              //   ),
              // ),
            ]),
      );
    });
  }
}
