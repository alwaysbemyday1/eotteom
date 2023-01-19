import "package:flutter/material.dart";
import "package:sizer/sizer.dart";

class Top extends StatelessWidget {
  Top({super.key});

  final imagelist = [
    "assets/images/example/cloth1.png",
    "assets/images/example/cloth2.png",
    "assets/images/example/cloth3.png",
    "assets/images/example/cloth4.png",
    "assets/images/example/cloth5.png",
  ];

  final imageWidth =
      100.w - 24; // phone의 너비에서 양쪽 16px, 사진 사이 간격 8px 빼서 24px 빼주면 됨.

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8),
                itemCount: imagelist.length,
                itemBuilder: (BuildContext context, int index) {
                  return ClipRRect(
                    child: Image.asset(
                        "assets/images/example/cloth${index + 1}.png",
                        width: imageWidth,
                        height: imageWidth),
                    borderRadius: BorderRadius.circular(4.0),
                  );
                }),
          ),
        );
      },
    );
  }
}
