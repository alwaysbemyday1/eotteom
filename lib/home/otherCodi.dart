import 'package:flutter/cupertino.dart';

class OtherCodi extends StatelessWidget {
  const OtherCodi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height : 300,
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
                    padding:EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child:Text('다른 사람 코디'),
                  ),
                  Container(
                    padding:EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child:Text('더보기', style: TextStyle(fontSize: 10, color: Color.fromRGBO(128,128,128, 1)),),
                  ),
                ]
            ),
            Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      padding:EdgeInsets.all(2.5),
                      child:Image.asset('assets/codi1.png', width:130, height:130),
                    ),
                    Container(
                      padding:EdgeInsets.all(2.5),
                      child:Image.asset('assets/codi2.png', width:130, height:130),
                    ),
                    Container(
                      padding:EdgeInsets.all(2.5),
                      child:Image.asset('assets/codi3.png', width:130, height:130),
                    ),
                    Container(
                      padding:EdgeInsets.all(2.5),
                      child:Image.asset('assets/codi4.png', width:130, height:130),
                    ),
                    Container(
                      padding:EdgeInsets.all(2.5),
                      child:Image.asset('assets/codi5.png', width:130, height:130),
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