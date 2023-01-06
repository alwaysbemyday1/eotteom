import 'package:flutter/cupertino.dart';

class MyCodi extends StatelessWidget {
  const MyCodi({super.key});

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
                  width: 200, height: 200,
                  padding:EdgeInsets.fromLTRB(0, 0, 2.5, 0),
                  child:Image.asset('assets/codi1.png'),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 130, height : 130,
                      padding:EdgeInsets.fromLTRB(2.5, 0, 0, 2.5),
                      child:Image.asset('assets/codi2.png'),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 65, height : 70,
                          padding:EdgeInsets.fromLTRB(2.5, 2.5, 2.5, 0),
                          child:Image.asset('assets/codi1.png'),
                        ),
                        Container(
                          width: 65, height : 70,
                          padding:EdgeInsets.fromLTRB(2.5, 2.5, 0, 0),
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