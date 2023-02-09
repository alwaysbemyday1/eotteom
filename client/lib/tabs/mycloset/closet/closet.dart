import 'package:eotteom/tabs/mycloset/closet/closetdropdown.dart';
import 'package:eotteom/tabs/mycloset/closet/cloth_render.dart';
import 'package:flutter/cupertino.dart';
import 'package:eotteom/tabs/mycloset/closet/closet_select.dart';
import "package:eotteom/provider.dart";
import 'package:flutter/material.dart';
import "package:provider/provider.dart";
import "package:eotteom/tabs/mycloset/enrollclothes/enroll.dart";
import "package:sizer/sizer.dart";


class Closet extends StatefulWidget {
  Closet({super.key});

  @override
  State<Closet> createState() => _ClosetState();
}

class _ClosetState extends State<Closet> {
  @override
  Widget build(BuildContext context) {
    var categories = context.watch<ClosetProvider>().totalMap.keys.toList();
    var categoryPressed = context.watch<ClosetProvider>().categoryPress;
    return Sizer(
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
                  itemCount: context.read<ClosetProvider>().categories.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
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
                          context.read<ClosetProvider>().selectFirstIndex(index);
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
    );
  }
}
