import 'package:flutter/cupertino.dart';

class OtherCodi extends StatelessWidget {
  const OtherCodi({Key? key, this.phoneHeight, this.phoneWidth}) : super(key: key);
  final phoneHeight;
  final phoneWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height : 18 * 1.3 + 13 + (((phoneWidth-24) * 0.4 - 8) * 4 / 3) + 2,
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
                    Text('다른 사람들의 코디', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                    Text('더보기', style: TextStyle(fontSize: 14)),
                  ]
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                height:((phoneWidth - 24) * 0.4 - 8) / 3 * 4,
                child: Row(
                  children: [
                    Container(
                      width:(phoneWidth-24) * 0.4 -8,
                      height:((phoneWidth - 24) * 0.4 - 8) / 3 * 4,
                      margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                      child:Image.asset('assets/codi1.png', fit: BoxFit.fill),
                    ),
                    Container(
                      width:(phoneWidth-24) * 0.4 -8,
                      height:((phoneWidth - 24) * 0.4 - 8) / 3 * 4,
                      margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                      child:Image.asset('assets/codi2.png', fit: BoxFit.fill),
                    ),
                    Container(
                      width:(phoneWidth-24) * 0.4 -8,
                      height:((phoneWidth - 24) * 0.4 - 8) / 3 * 4,
                      margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                      child:Image.asset('assets/codi3.png', fit: BoxFit.fill),
                    ),
                    Container(
                      width:(phoneWidth-24) * 0.4 -8,
                      height:((phoneWidth - 24) * 0.4 - 8) / 3 * 4,
                      margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                      child:Image.asset('assets/codi4.png', fit: BoxFit.fill),
                    ),
                    Container(
                      width:(phoneWidth-24) * 0.4 -8,
                      height:((phoneWidth - 24) * 0.4 - 8) / 3 * 4,
                      margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                      child:Image.asset('assets/codi5.png', fit: BoxFit.fill),
                    ),
                  ],
                ),
              ),
            ),
          ]
      ),
    );
  }
}