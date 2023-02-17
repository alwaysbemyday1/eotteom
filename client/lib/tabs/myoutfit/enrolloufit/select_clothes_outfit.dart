import 'package:eotteom/provider.dart';
import 'package:eotteom/tabs/mycloset/closet/closet_select.dart';
import 'package:eotteom/tabs/mycloset/closet/cloth_render.dart';
import 'package:eotteom/tabs/mycloset/closet/dropdowncloset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';

import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class SelectClothes extends StatefulWidget {
  const SelectClothes({super.key});

  @override
  State<SelectClothes> createState() => _SelectClothesState();
}

class _SelectClothesState extends State<SelectClothes> {
  @override
  Widget build(BuildContext context) {
    var categories = context.watch<ClothProvider>().totalMap.keys.toList();
    var categoryPressed = context.watch<ClothProvider>().categoryPress;
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                elevation: 0.0,
                backgroundColor: Colors.white,
                title: const Text(
                  '코디한 옷을 모두 선택해주세요',
                  style: TextStyle(
                    fontFamily: "NotoSans",
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                ),
                centerTitle: true,
                leading: Material(
                  color: Colors.white,
                  child: IconButton(
                    icon: Icon(
                      FlutterRemix.close_fill,
                      size: 30,
                      color: Color(0xff131313),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                )),
            body: Sizer(
              builder: (context, orientation, deviceType) {
                return SizedBox(
                  height: 200.h,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 18),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: DropDownCloset(),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                context.read<ClothProvider>().categories.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, right: 8),
                                child: TextButton(
                                  child: Text(
                                    categories[index],
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xff151515),
                                        decoration: categoryPressed[index]
                                            ? TextDecoration.underline
                                            : TextDecoration.none,
                                        decorationThickness: 2,
                                        fontSize: 16,
                                        fontFamily: "NotoSans"),
                                  ),
                                  onPressed: () {
                                    context
                                        .read<ClothProvider>()
                                        .selectFirstIndex(index);
                                  },
                                ),
                              );
                            }),
                      ),
                      SelectCategory(),
                      ClothRender(),
                    ],
                  ),
                );
              },
            )),
      );
    });
  }
}
