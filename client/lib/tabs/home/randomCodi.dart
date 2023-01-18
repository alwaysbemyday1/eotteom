import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:provider/provider.dart';

class RandomCodi extends StatefulWidget {
  const RandomCodi({Key? key, this.phoneHeight, this.phoneWidth}) : super(key: key);
  final phoneHeight;
  final phoneWidth;

  @override
  State<RandomCodi> createState() => _RandomCodiState();
}

class _RandomCodiState extends State<RandomCodi> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      context.read<Position>().getRand(widget.phoneWidth);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (widget.phoneWidth-24)-8,
      height : (18 + 14) * 1.3 + (13 + 17 + 8) + ((widget.phoneWidth-24)-8) / 2 + 44 * 2 + 5 ,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  Text('내 옷장 속 랜덤 코디', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                  SizedBox(
                    height:14*1.3,
                    child: CupertinoButton(
                        padding: EdgeInsets.all(0),
                        child: Text('기록보기', style: TextStyle(fontSize: 14, color: CupertinoColors.black)),
                        onPressed: (){}
                    ),
                  )
                ]
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 13),
              child: Text('내 옷들 중에서 무작위로 조합해드려요', style: TextStyle(fontSize: 14),),
            ),
            Container (
                width: (widget.phoneWidth-24)-8, height: ((widget.phoneWidth-24)-8) / 2,
                margin: EdgeInsets.fromLTRB(0, 0, 0, 17),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        blurRadius: 2,
                      )
                    ]
                ),
                child:Container(
                  width: (widget.phoneWidth-24)-8, height: ((widget.phoneWidth-24)-8) / 2,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.fromLTRB(context.watch<Position>().topX, context.watch<Position>().topY, 0, 0),
                          child:Image.asset(
                              'assets/images/clothes/상의.png',
                              height: ((widget.phoneWidth-24)-8)/3,
                              width: ((widget.phoneWidth-24)-8)/3
                          )
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(context.watch<Position>().bottomX, context.watch<Position>().bottomY, 0, 0),
                          child:Image.asset(
                              'assets/images/clothes/하의.png',
                              height: ((widget.phoneWidth-24)-8)/2.5,
                              width: ((widget.phoneWidth-24)-8)/5
                          )
                      ),
                      Column(
                          children: [
                            Container(
                                margin: EdgeInsets.fromLTRB(context.watch<Position>().accessoryX, context.watch<Position>().accessoryY, 0, 0),
                                child:Image.asset(
                                    'assets/images/clothes/목도리.png',
                                    height: ((widget.phoneWidth-24)-8)/5,
                                    width: ((widget.phoneWidth-24)-8)/5
                                )
                            ),
                            Container(
                                margin: EdgeInsets.fromLTRB(context.watch<Position>().shoesX, context.watch<Position>().shoesY, 0, 0),
                                child:Image.asset(
                                    'assets/images/clothes/신발.png',
                                    height: ((widget.phoneWidth-24)-8)/5,
                                    width: ((widget.phoneWidth-24)-8)/5
                                )
                            ),
                          ],
                        ),
                    ],
                  ),
                )
            ),
            Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
                      width:(widget.phoneWidth-24)-8,
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
                              SizedBox(width: 10.8),
                              Text('다시 돌리기', style: TextStyle(fontSize: 14))
                            ],
                          ), onPressed: (){
                        context.read<Position>().getRand(widget.phoneWidth);
                      }
                      ),
                    ),
                    SizedBox(
                      width:(widget.phoneWidth-24)-8,
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

class Position extends ChangeNotifier {
  var topX = 0.0, topY = 0.0;
  var bottomX= 0.0, bottomY= 0.0;
  var shoesX= 0.0, shoesY= 0.0;
  var accessoryX= 0.0, accessoryY= 0.0;

  getRand(phoneWidth) {
    topX = (Random().nextInt((((phoneWidth-24)-8)*0.05).toInt())).toDouble();
    topY = (Random().nextInt((((phoneWidth-24)-8)*0.2858).toInt())).toDouble();
    bottomX =(Random().nextInt((((phoneWidth-24)-8)*0.1333).toInt())).toDouble();
    bottomY = (Random().nextInt((((phoneWidth-24)-8)*0.25).toInt())).toDouble();
    shoesX = (Random().nextInt((((phoneWidth-24)-8)*0.1333).toInt())).toDouble();
    shoesY = (Random().nextInt((((phoneWidth-24)-8)*0.05).toInt())).toDouble();
    accessoryX =(Random().nextInt((((phoneWidth-24)-8)*0.1333).toInt())).toDouble();
    accessoryY = (Random().nextInt((((phoneWidth-24)-8)*0.05).toInt())).toDouble();


    notifyListeners();
  }
}

// 다시돌리기 버턴 : state로 옷 위치 조정