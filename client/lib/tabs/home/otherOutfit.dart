import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

import '../../provider.dart';

class OtherOutfit extends StatefulWidget {
  OtherOutfit({Key? key}) : super(key: key);

  @override
  State<OtherOutfit> createState() => _OtherOutfitState();
}

class _OtherOutfitState extends State<OtherOutfit> {
  List<Container> otherOutfitPictureList = [];

  Future getMyOutfitList(BuildContext context) async {
    http.Response response = await http.get(
        Uri.parse('http://127.0.0.1:8000/api/outfits/list/others/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${context.read<UserProvider>().tokenAccess}',
        });
    var tmpMyOutfitList = jsonDecode(response.body);
    var myOutfitList = tmpMyOutfitList['results'];
    for (int i = 0; i < myOutfitList.length; i++) {
      otherOutfitPictureList.add(Container(
          width: (100.w - 32 - 40) / 2,
          height: ((100.w - 32 - 40) / 2) / 5 * 6,
          child: Image.memory(
            base64Decode(myOutfitList[i]['image_memory']),
            fit: BoxFit.fill,
          )));
    }

    return otherOutfitPictureList;
  }

  @override
  Widget build(BuildContext context) {
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
                      Text('다른 사람들의 코디',
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
            ]),
      );
    });
  }
}
