import "package:flutter/material.dart";
import "package:sizer/sizer.dart";
import "package:eotteom/style.dart";
import "package:flutter_remix/flutter_remix.dart";

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
              height: 170.h,
              width: 100.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 16, left: 16, right: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/example/cloth1.jpg"),
                                                fit: BoxFit.fill)),
                                      ),
                                      SizedBox(
                                        width: 14,
                                      ),
                                      Text(
                                        '임태규',
                                        style: basicTextTheme2,
                                      ),
                                    ],
                                  ),
                                  Icon(FlutterRemix.more_2_fill)
                                ],
                              ),
                              SizedBox(
                                height: 14,
                              ),
                              Container(
                                width: 100.w - 32,
                                height: (100.w - 32) * (6 / 5),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/example/cloth1.png"),
                                        fit: BoxFit.fill)),
                              ),
                              SizedBox(
                                height: 11,
                              ),
                              Row(
                                children: [
                                  Text(
                                    '편한 옷들',
                                    style: basicTextTheme2,
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    '#겨울',
                                    style: basicTextTheme2,
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    '#댄디룩',
                                    style: basicTextTheme2,
                                  ),
                                ],
                              ),
                              Text(
                                '2022. 1. 31 화',
                                style: enrollHintTheme,
                              ),
                              SizedBox(
                                height: 28,
                              ),
                            ],
                          )),
                    ],
                  ),
                  Container(
                    width: 100.w,
                    height: 8,
                    color: Color(0xffF8F8F8),
                  ),
                  SizedBox(
                    height: 26,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '코디 정보',
                          style: enrollTitleTheme,
                        ),
                        SizedBox(
                          height: 13,
                        ),
                        SizedBox(
                          height: 60.w,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: ((context, index) {
                                return SizedBox(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8),
                                        child: Container(
                                          height: 30.75.w,
                                          width: 25.6.w,
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(5.0)),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 11,
                                      ),
                                      Text(
                                        '상의 > 후디',
                                        style: enrollTitleTheme2,
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '색상 : 핑크',
                                            style: enrollHintTheme,
                                          ),
                                          Text(
                                            '사이즈 : M',
                                            style: enrollHintTheme,
                                          ),
                                          Text(
                                            '핏 : 레귤러핏',
                                            style: enrollHintTheme,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              })),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 100.w,
                    height: 8,
                    color: Color(0xffF8F8F8),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('다른 내 코디 둘러보기', style: enrollTitleTheme2,),
                        SizedBox(height: 12,),
                        SizedBox(
                          height: 30.75.w, // ListView.builder는 기본적으로 요소가 builder 안에 꽉 차도록 됨.
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: ((context, index) {
                                return SizedBox(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(right: 8),
                                        child: Container(
                                          height: 30.75.w,
                                          width: 25.6.w,
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(5.0)),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              })),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30,)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
