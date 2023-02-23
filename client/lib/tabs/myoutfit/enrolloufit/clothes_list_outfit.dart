import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:sizer/sizer.dart';

class ClothesListView extends StatefulWidget {
  const ClothesListView(
      {super.key,
      this.clothesList,
      this.myClothesList,
      this.selectClothes,
      this.bigCategory,
      this.smallCategory});

  final clothesList;
  final myClothesList;
  final selectClothes;
  final bigCategory;
  final smallCategory;
  @override
  State<ClothesListView> createState() => _ClothesListViewState();
}

class _ClothesListViewState extends State<ClothesListView> {
  List<String> bigCategoryList = ['상의', '하의', '아우터', '신발', '악세사리'];
  Map<String, List<String>> smallCategoryList1 = {
    '상의': ['니트', '맨투맨'],
    '하의': ['청바지', '치마'],
    '아우터': ['코트', '패딩'],
    '신발': ['슬리퍼', '운동화'],
    '악세사리': ['장갑', '가방']
  };
  List<String> smallCategoryList2 = [
    '맨투맨',
    '니트',
    '청바지',
    '치마',
    '코트',
    '패딩',
    '운동화',
    '슬리퍼',
    '장갑',
    '가방'
  ];

  var filteredList = [];
  getFilteredList(bigCategory, smallCategory) {
    filteredList = [];
    for (int i = 0; i < widget.clothesList.length; i++) {
      if (smallCategoryList2[widget.clothesList[i]['minor_category'] - 1] ==
          smallCategory) {}
    }

    return filteredList;
  }

  @override
  void initState() {
    print('clothesList' + widget.clothesList);
    getFilteredList(widget.bigCategory, widget.smallCategory);
    print('filteredList' + filteredList.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 8, crossAxisSpacing: 8),
        itemCount: filteredList.length,
        itemBuilder: ((context, index) {
          return Stack(
            children: [
              InkWell(
                child: Container(
                    width: (100.w - 48) / 3,
                    height: (100.w - 48) / 3,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: MemoryImage(base64Decode(
                              filteredList[index]['image_memory']))),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: widget.myClothesList.contains(filteredList[index])
                        ? Align(
                            alignment: Alignment.center,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              icon: Icon(
                                FlutterRemix.check_fill,
                                color: Color(0xffFFFFFF),
                              ),
                              onPressed: () {},
                              iconSize: 50,
                            ),
                          )
                        : SizedBox(height: 0, width: 0)),
                onTap: () {
                  widget.selectClothes(filteredList[index]);
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
              ),
            ],
          );
        }));
  }
}
