import 'package:flutter/cupertino.dart';

class MyCodi extends StatelessWidget {
  const MyCodi({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height : 300,
      padding: EdgeInsets.all(5),
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
                    child:Text('최근 나의 코디'),
                  ),
                  Container(
                    padding:EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child:Text('더보기', style: TextStyle(fontSize: 10, color: Color.fromRGBO(128,128,128, 1)),),
                  ),
                ]
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding:EdgeInsets.all(2.5),
                  child:Image.asset('assets/codi1.png', width:180, height:180),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding:EdgeInsets.all(2.5),
                      child:Image.asset('assets/codi2.png', width:130, height:120),
                    ),
                    Row(
                      children: [
                        Container(
                          padding:EdgeInsets.all(2.5),
                          child:Image.asset('assets/codi1.png', width:60, height:60),
                        ),
                        Container(
                          padding:EdgeInsets.all(2.5),
                          child:Image.asset('assets/codi4.png', width:60, height:60),
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