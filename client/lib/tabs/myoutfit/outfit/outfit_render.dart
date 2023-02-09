import "package:flutter/material.dart";
import "package:sizer/sizer.dart";

class OutfitRender extends StatefulWidget {
  const OutfitRender({super.key});

  @override
  State<OutfitRender> createState() => _OutfitRenderState();
}

class _OutfitRenderState extends State<OutfitRender> {
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
                    crossAxisCount: 3, mainAxisSpacing: 8, crossAxisSpacing: 8, childAspectRatio: 5/6),

                itemCount: 6,
                itemBuilder: ((context, index) {
                  return SizedBox(
                    child: Stack(
                      children: [
                        InkWell(
                          child: Container(

                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/example/cloth1.jpg"),
                                  fit: BoxFit.fill)),
                        ),
                        onTap: () {},

                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 7, right: 7),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),

                              icon: liked[index] ? Icon(Icons.favorite) : Icon(Icons.favorite_border),

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

      })),
    );
  }
}
