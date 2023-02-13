import 'package:eotteom/provider.dart';
import 'package:eotteom/tabs/myoutfit/outfit/outfit_info.dart';
import "package:flutter/material.dart";
import "package:sizer/sizer.dart";
import "package:provider/provider.dart";
import "package:http/http.dart" as http;
import "dart:convert";

class OutfitRender extends StatefulWidget {
  const OutfitRender({super.key});

  @override
  State<OutfitRender> createState() => _OutfitRenderState();
}

class _OutfitRenderState extends State<OutfitRender> {
  List<bool> liked = [false, false, false, false, false, false];
  @override
  Widget build(BuildContext context) {
    String userId = context.watch<UserProvider>().userId;
    String tokenAccess = context.watch<UserProvider>().tokenAccess;
    return Expanded(
      child: FutureBuilder(
        future: _getImage(userId, tokenAccess),
        builder: ((context, snapshot) {
          if (snapshot.hasData == false) {
            return Text('나의 코디를 등록해보세요!');
          } else {
            var jsonBody = snapshot.data as Map<dynamic, dynamic>;
            List outfitList = jsonBody['results'];
            return Sizer(builder: ((context, orientation, deviceType) {
              return SizedBox(
                width: 100.w - 32,
                child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        childAspectRatio: 5 / 6),
                    itemCount: outfitList.length,
                    itemBuilder: ((context, index) {
                      return SizedBox(
                        child: Stack(
                          children: [
                            InkWell(
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: Image.memory(base64Decode(outfitList[index]['image_memory'])).image
                                  ),
                                    borderRadius: BorderRadius.circular(5.0),),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => OutfitInfo(),
                                    ));
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 7, right: 7),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  constraints: BoxConstraints(),
                                  icon: liked[index]
                                      ? Icon(Icons.favorite)
                                      : Icon(Icons.favorite_border),
                                  color: Color(0xffFFFFFF),
                                  onPressed: () {
                                    setState(() {
                                      liked[index] = !liked[index];
                                    });
                                  },
                                  iconSize: (100.w - 48) / 3 * (20 / 109),
                                ),
                              ),
                            )
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

  Future<Map<String, dynamic>> _getImage(String userId, String tokenAccess) async {
    String url = "http://127.0.0.1:8000/api/outfits/list/${userId}/";
    http.Response response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${tokenAccess}',
    });

    var jsonBody = json.decode(response.body);

    return jsonBody;
  }
}
