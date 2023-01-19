import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

class OtherOutfit extends StatelessWidget {
  const OtherOutfit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 18 * 1.3 + 13 + (((100.w - 24) * 0.4 - 8) * 4 / 3) + 2,
      margin: EdgeInsets.fromLTRB(0, 0, 0, 26),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: (100.w - 24) - 8,
              margin: EdgeInsets.fromLTRB(0, 0, 0, 12),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('다른 사람들의 코디',
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                height: ((100.w - 24) * 0.4 - 8) / 3 * 4,
                child: Row(
                  children: [
                    Container(
                      width: (100.w - 24) * 0.4 - 8,
                      height: ((100.w - 24) * 0.4 - 8) / 3 * 4,
                      margin: EdgeInsets.fromLTRB(16, 0, 8, 0),
                      child: Image.asset('assets/images/codies/codi1.png',
                          fit: BoxFit.fill),
                    ),
                    Container(
                      width: (100.w - 24) * 0.4 - 8,
                      height: ((100.w - 24) * 0.4 - 8) / 3 * 4,
                      margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                      child: Image.asset('assets/images/codies/codi2.png',
                          fit: BoxFit.fill),
                    ),
                    Container(
                      width: (100.w - 24) * 0.4 - 8,
                      height: ((100.w - 24) * 0.4 - 8) / 3 * 4,
                      margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                      child: Image.asset('assets/images/codies/codi3.png',
                          fit: BoxFit.fill),
                    ),
                    Container(
                      width: (100.w - 24) * 0.4 - 8,
                      height: ((100.w - 24) * 0.4 - 8) / 3 * 4,
                      margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                      child: Image.asset('assets/images/codies/codi4.png',
                          fit: BoxFit.fill),
                    ),
                    Container(
                      width: (100.w - 24) * 0.4 - 8,
                      height: ((100.w - 24) * 0.4 - 8) / 3 * 4,
                      margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                      child: Image.asset('assets/images/codies/codi5.png',
                          fit: BoxFit.fill),
                    ),
                  ],
                ),
              ),
            ),
          ]),
    );
  }
}
