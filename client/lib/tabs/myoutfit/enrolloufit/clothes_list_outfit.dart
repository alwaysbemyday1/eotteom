import 'dart:convert';

import 'package:eotteom/provider.dart';
import 'package:eotteom/tabs/mycloset/closet/cloth_info.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import "package:sizer/sizer.dart";
import 'package:http/http.dart' as http;

class ClothesList extends StatefulWidget {
  const ClothesList({super.key});

  @override
  State<ClothesList> createState() => _ClothesListState();
}

class _ClothesListState extends State<ClothesList> {
  var clothesList = [];

  Future getMyOutfitList() async {
    http.Response response = await http.get(
        Uri.parse(
            'http://127.0.0.1:8000/api/clothes/list/${context.read<UserProvider>().userId}/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${context.read<UserProvider>().tokenAccess}',
        });

    var tmpClothesList = jsonDecode(response.body);
    clothesList = tmpClothesList['results'];

    return clothesList;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Sizer(builder: ((context, orientation, deviceType) {
        return SizedBox(
          width: 100.w - 32,
          child: FutureBuilder(
              future: getMyOutfitList(),
              builder: (context, snapshot) {
                if (snapshot.hasData == false) {
                  return CupertinoActivityIndicator();
                } else {
                  return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8),
                      itemCount: clothesList.length,
                      itemBuilder: ((context, index) {
                        return Stack(
                          children: [
                            InkWell(
                              child: Container(
                                  width: (100.w - 48) / 3,
                                  height: (100.w - 48) / 3,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Image.memory(
                                    base64Decode(
                                        clothesList[index]['image_memory']),
                                    fit: BoxFit.fill,
                                  )),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ClothInfo(),
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
                                  // icon: clothesList[index]['likes']
                                  //     ? Icon(Icons.favorite)
                                  //     : Icon(Icons.favorite_border),
                                  icon: Icon(Icons.favorite_border),
                                  color: Color(0xffFFFFFF),
                                  onPressed: () {},
                                  iconSize: (100.w - 48) / 3 * (20 / 109),
                                ),
                              ),
                            )
                          ],
                        );
                      }));
                }
              }),
        );
      })),
    );
  }
}
