import 'package:flutter/cupertino.dart';

class MyCodi extends StatelessWidget {
  const MyCodi({super.key, this.phoneHeight, this.phoneWidth});
  final phoneHeight;
  final phoneWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (phoneWidth - 24) - 8,
      height : 12 + 18 * 1.3 + (phoneWidth - 24) * 0.6, // 사기간격 + lineheight + 사진 크기
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
                  children:[
                    Text('최근 나의 코디', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                    Text('더보기', style: TextStyle(fontSize: 14, color: CupertinoColors.black)),
                  ]
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: (phoneWidth-24)*0.6-8,
                  height: (phoneWidth-24)*0.6-8,
                  margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                  child:Image.asset('assets/codi6.png', fit: BoxFit.fill,),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: (phoneWidth-24)*0.4-8,
                      height : (phoneWidth-24)*0.4-8,
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
                      child:Image.asset('assets/codi2.png'),
                    ),
                    Row(
                      children: [
                        Container(
                          width: (phoneWidth-24)*0.2-8,
                          height : (phoneWidth-24)*0.2-8,
                          margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                          child:Image.asset('assets/codi3.png'),
                        ),
                        Container(
                          width: (phoneWidth-24)*0.2-8,
                          height : (phoneWidth-24)*0.2-8,
                          child:Image.asset('assets/codi4.png'),
                        ),
                      ],
                    )
                  ],
                )
              ],
            )
          ]
      ),
    );
  }
}