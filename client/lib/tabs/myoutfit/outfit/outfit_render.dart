import 'package:eotteom/provider.dart';
import 'package:eotteom/style.dart';
import 'package:eotteom/tabs/myoutfit/outfit/outfit_info.dart';
import "package:flutter/material.dart";
import "package:sizer/sizer.dart";
import "package:provider/provider.dart";
import "package:http/http.dart" as http;
import "dart:convert";

class OutfitRender extends StatefulWidget {
  OutfitRender({super.key});

  @override
  State<OutfitRender> createState() => _OutfitRenderState();
}

class _OutfitRenderState extends State<OutfitRender> {
  List<bool> liked = [false, false, false, false, false, false, false];
  @override
  Widget build(BuildContext context) {
    print("outfit render widget 만들어짐");
    String userId = context.watch<UserProvider>().userId;
    String tokenAccess = context.watch<UserProvider>().tokenAccess;
    return Expanded(
      // child: Text('${Provider.of<OutfitModelProvider>(context).count}')
      child: FutureBuilder(
        future: _getImage(userId, tokenAccess),
        builder: ((context, snapshot) {
          if (snapshot.hasData == false) {
            return Center(
                child: Text(
              '나의 코디를 등록해보세요!',
              style: headLineTextTheme,
            ));
          } else {
            var jsonBody = snapshot.data;
            List outfitList = jsonBody['results'];
            List filteredOutfitlist = _getStyleFilter(outfitList);
            // setState(() {
            //   List filteredOutfitlist = _getStyleFilter(outfitList);
            // });
            return Sizer(builder: ((context, orientation, deviceType) {
              return SizedBox(
                width: 100.w - 32,
                child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),

                    // shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            childAspectRatio: 5 / 6),
                    itemCount: filteredOutfitlist.length,
                    itemBuilder: ((context, index) {
                      return SizedBox(
                        child: Stack(
                          children: [
                            InkWell(
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: Image.memory(base64Decode(
                                              filteredOutfitlist[index]
                                                  ['image_memory']))
                                          .image),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => OutfitInfo(
                                          jsonBody: jsonBody,
                                          index: filteredOutfitlist[index]
                                              ["id"]),
                                    ));
                              },
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.only(top: 7, right: 7),
                            //   child: Align(
                            //     alignment: Alignment.topRight,
                            //     child: IconButton(
                            //       padding: EdgeInsets.zero,
                            //       constraints: BoxConstraints(),
                            //       icon: liked[index]
                            //           ? Icon(Icons.favorite)
                            //           : Icon(Icons.favorite_border),
                            //       color: Color(0xffFFFFFF),
                            //       onPressed: () {
                            //         setState(() {
                            //           liked[index] = !liked[index];
                            //         });
                            //       },
                            //       iconSize: (100.w - 48) / 3 * (20 / 109),
                            //     ),
                            //   ),
                            // )
                            // 좋아요 부분
                          ],
                        ),
                      );
                    })),
              );
            }));
          }
        }),
      ),
    );
  }

  Future _getImage(String userId, String tokenAccess) async {
    String url = "http://127.0.0.1:8000/api/outfits/list/${userId}/";
    http.Response response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${tokenAccess}',
    });

    var jsonBody = jsonDecode(utf8.decode(response.bodyBytes));

    return jsonBody;
  }

  _getStyleFilter(List outfitList) {
    List filteredOutfitlist = [];
    List<String> selectedOutfitlabellist =
        Provider.of<FilterProvider>(context, listen: false)
            .getSelectOutfitLabelList();
    if ((selectedOutfitlabellist.isEmpty == true) |
        (selectedOutfitlabellist.length == 15)) {
      return outfitList; // 그대로 반환
    } else {
      for (var outfit in outfitList) {
        if (selectedOutfitlabellist.contains(outfit["style"]) == true) {
          filteredOutfitlist.add(outfit);
        }
      }
      return filteredOutfitlist;
    }
  }
}
