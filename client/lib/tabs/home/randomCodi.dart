import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RandomCodi extends StatelessWidget {
  const RandomCodi({Key? key, this.phoneHeight, this.phoneWidth}) : super(key: key);
  final phoneHeight;
  final phoneWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (phoneWidth-24)-8,
      height : (18 + 14) * 1.3 + (13 + 17 + 8) + ((phoneWidth-24)-8) / 2 + 44 * 2 + 5 ,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  Text('내 옷장 속 랜덤 코디', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                  Text('기록보기', style: TextStyle(fontSize: 14)),
                ]
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 13),
              child: Text('내 옷들 중에서 무작위로 조합해드려요', style: TextStyle(fontSize: 14),),
            ),
            Container (
              width: (phoneWidth-24)-8, height: ((phoneWidth-24)-8) / 2,
              margin: EdgeInsets.fromLTRB(0, 0, 0, 17),
              color: CupertinoColors.systemGrey,
            ),
            Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
                      width:(phoneWidth-24)-8,
                      height: 44,
                      decoration: BoxDecoration(
                        border: Border.all(color:CupertinoColors.black, width:1),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: CupertinoButton(
                          padding: EdgeInsets.all(0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(CupertinoIcons.repeat, size: 17),
                              Text('다시 돌리기', style: TextStyle(fontSize: 14))
                            ],
                          ), onPressed: (){}
                      ),
                    ),
                    SizedBox(
                      width:(phoneWidth-24)-8,
                      height: 44,
                      child: CupertinoButton(
                          padding: EdgeInsets.all(0),
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(22),
                          child:Text('이 코디 저장하기', style: TextStyle(fontSize: 14)),
                          onPressed: (){}
                      ),
                    )
                  ],
                )
            ),
          ]
      ),
    );
  }
}