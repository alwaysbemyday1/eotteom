import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

class MyOutfit extends StatelessWidget {
  const MyOutfit({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (100.w - 24) - 8,
      height: 12 + 18 * 1.3 + (100.w - 24) * 0.6, // 사기간격 + lineheight + 사진 크기
      margin: EdgeInsets.fromLTRB(0, 0, 0, 26),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 12),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('최근 나의 코디',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700)),
                    SizedBox(
                      height: 14 * 1.3,
                      child: CupertinoButton(
                          padding: EdgeInsets.all(0),
                          child: Text('더보기',
                              style: TextStyle(
                                  fontSize: 14, color: CupertinoColors.black)),
                          onPressed: () {}),
                    )
                  ]),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: (100.w - 24) * 0.6 - 8,
                  height: (100.w - 24) * 0.6 - 8,
                  margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                  child: Image.asset(
                    'assets/images/codies/codi6.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: (100.w - 24) * 0.4 - 8,
                      height: (100.w - 24) * 0.4 - 8,
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
                      child: Image.asset('assets/images/codies/codi2.png'),
                    ),
                    Row(
                      children: [
                        Container(
                          width: (100.w - 24) * 0.2 - 8,
                          height: (100.w - 24) * 0.2 - 8,
                          margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                          child: Image.asset('assets/images/codies/codi3.png'),
                        ),
                        Container(
                          width: (100.w - 24) * 0.2 - 8,
                          height: (100.w - 24) * 0.2 - 8,
                          child: Image.asset('assets/images/codies/codi4.png'),
                        ),
                      ],
                    )
                  ],
                )
              ],
            )
          ]),
    );
  }
}
