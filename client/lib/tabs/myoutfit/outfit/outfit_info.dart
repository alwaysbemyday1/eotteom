import "package:flutter/material.dart";
import "package:sizer/sizer.dart";
import "package:eotteom/style.dart";

class OutfitInfo extends StatelessWidget {
  const OutfitInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          backgroundColor: Color(0xffF5F5F5),
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Color(0xffF5F5F5),
            iconTheme: IconThemeData(color: Color(0xff151515)),
          ),
          body: SingleChildScrollView(
            child: SizedBox(
              height: 120.h,
              width: 100.w,
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 16, left: 16, right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '상의-니트',
                          style: basicTextTheme2,
                        ), // 데이터에 맞게 렌더링 할 것
                        SizedBox(
                          height: 7,
                        ),
                        Container(
                          width: 100.w - 32,
                          height: 100.w - 32,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/example/cloth1.jpg"),
                                  fit: BoxFit.fill)),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        SizedBox(
                          width: 100.w - 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '가격',
                                        style: basicTextTheme,
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Text(
                                        '100,000원',
                                        style: enrollTitleTheme2,
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '핏 ',
                                        style: basicTextTheme,
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Text(
                                        '레귤러핏',
                                        style: enrollTitleTheme2,
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '사이즈',
                                        style: basicTextTheme,
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Text(
                                        'S',
                                        style: enrollTitleTheme2,
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '브랜드',
                                        style: basicTextTheme,
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Text(
                                        '오뚜기',
                                        style: enrollTitleTheme2,
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 38,
                  ),
                  Container(
                    width: 100.w,
                    height: 8,
                    color: Color(0xffF8F8F8),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: 100.w - 32,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '이 옷을 사용한 코디',
                          style: enrollTitleTheme2,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        SizedBox(
                          height: 120,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: 30,
                              itemBuilder: ((context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 8, right: 8),
                                  child: Container(
                                    height: (30.w)*6/5,
                                    width: 30.w,
                                    color: Colors.red,
                                  ),
                                );
                              })),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 55,)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
