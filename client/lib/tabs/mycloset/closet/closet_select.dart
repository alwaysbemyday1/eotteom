import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:eotteom/provider.dart";

class SelectCategory extends StatelessWidget {
  SelectCategory({super.key});

  @override
  Widget build(BuildContext context) {
    var whichcategory = context.watch<ClosetProvider>().totalMap.keys.toList()[
        context
            .watch<ClosetProvider>()
            .firstindex]; // ["상의", "하의", "아우터", "신발", "원피스"] 이중에서 카테고리 선택
    List<String> smallCategory =
        context.watch<ClosetProvider>().totalMap[whichcategory]!;
    List categoryPress =
        context.read<ClosetProvider>().boolCallback(whichcategory);
    return SizedBox(
      height: 35,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoryPress.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: TextButton(
                child: Text(
                  smallCategory[index],
                  style: TextStyle(
                      decoration: categoryPress[index]
                          ? TextDecoration.underline
                          : TextDecoration.none,
                      decorationThickness: 2,
                      color: Color(0xff151515),
                      fontSize: 16,
                      fontWeight: categoryPress[index]
                          ? FontWeight.w700
                          : FontWeight.w400),
                ),
                onPressed: () {
                  context.read<ClosetProvider>().selectSecondIndex(index);
                },
              ),
            );
          })),
    );
  }
}
