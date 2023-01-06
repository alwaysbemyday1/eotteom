import 'package:flutter/cupertino.dart';

class OtherCodi extends StatelessWidget {
  const OtherCodi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      height : 300,
      padding: EdgeInsets.all(5),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:[
                  Container(
                    padding:EdgeInsets.all(5),
                    child:Text('다른 사람들의 코디'),
                  ),
                  Container(
                    padding:EdgeInsets.all(5),
                    child:Text('더보기', style: TextStyle(fontSize: 10, color: Color.fromRGBO(128,128,128, 1)),),
                  ),
                ]
            ),
            Container(
              padding: EdgeInsets.fromLTRB(40, 5, 0, 5),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      padding:EdgeInsets.all(2.5),
                      child:Image.asset('assets/codi1.png', width:100, height:100),
                    ),
                    Container(
                      padding:EdgeInsets.all(2.5),
                      child:Image.asset('assets/codi2.png', width:100, height:100),
                    ),
                    Container(
                      padding:EdgeInsets.all(2.5),
                      child:Image.asset('assets/codi3.png', width:100, height:100),
                    ),
                    Container(
                      padding:EdgeInsets.all(2.5),
                      child:Image.asset('assets/codi4.png', width:100, height:100),
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