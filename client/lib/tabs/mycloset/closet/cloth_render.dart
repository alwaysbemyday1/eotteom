import 'package:eotteom/tabs/mycloset/closet/cloth_info.dart';
import "package:flutter/material.dart";
import "package:sizer/sizer.dart";

class ClothRender extends StatefulWidget {
  const ClothRender({super.key});

  @override
  State<ClothRender> createState() => _ClothRenderState();
}

class _ClothRenderState extends State<ClothRender> {
  List<bool> liked = [false, false, false, false, false, false];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Sizer(builder: ((context, orientation, deviceType) {
        return SizedBox(
          width: 100.w - 32,
          child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, mainAxisSpacing: 8, crossAxisSpacing: 8),
              itemCount: 6,
              itemBuilder: ((context, index) {
                return Stack(
                  children: [
                    InkWell(
                      child: Container(
                        width: (100.w - 48) / 3,
                        height: (100.w - 48) / 3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/example/cloth1.jpg"),
                                fit: BoxFit.fill)),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ClothInfo(),)
                        );
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
                );
              })),
        );
      })),
    );
  }
}
