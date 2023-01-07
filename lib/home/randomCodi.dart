import 'package:flutter/cupertino.dart';

class RandomCodi extends StatelessWidget {
  const RandomCodi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height : 320,
      padding: EdgeInsets.all(10),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  Container(
                    padding:EdgeInsets.fromLTRB(0, 0, 0, 2.5),
                    child:Text('내 옷장 속 랜덤 코디'),
                  ),
                  Container(
                    padding:EdgeInsets.fromLTRB(0, 0, 0, 5),
                    child:Text('기록보기', style: TextStyle(fontSize: 10, color: Color.fromRGBO(128,128,128, 1)),),
                  ),
                ]
            ),
            Container(
              padding:EdgeInsets.fromLTRB(0, 2.5, 0, 5),
              child: Text('내 옷들 중에서 무작위로 조합해드려요', style: TextStyle(fontSize: 13),),
              alignment: Alignment.centerLeft,
            ),
            Container (
              width: 330, height: 130,
              color: CupertinoColors.systemGrey,
            ),
            Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 50, width: 330,
                      child: CupertinoButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                child: Icon(CupertinoIcons.repeat, size: 20,),
                              ),
                              Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child:SizedBox(
                                    height: 40,
                                      child: Text('다시 돌리기', style: TextStyle(fontSize: 14)))
                              )
                            ],
                          ), onPressed: (){}
                      ),
                    ),
                    SizedBox(
                      height: 50, width: 330,
                      child: CupertinoButton(

                        color: CupertinoColors.black,
                        borderRadius: BorderRadius.circular(40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('이 코디 저장하기', style: TextStyle(fontSize: 14))
                            ],
                          ), onPressed: (){}
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