import 'package:flutter/cupertino.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('weatherCodi()'),
        MyCodi(),
        Text('otherCodi()'),
        Text('randomCodi()'),
      ],
    );
  }
}

class MyCodi extends StatelessWidget {
  const MyCodi({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
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
                    child:Text('최근 나의 코디'),
                  ),
                  Container(
                    padding:EdgeInsets.all(5),
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
                  child:Image.asset('assets/codi1.png', width:150, height:150),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding:EdgeInsets.all(2.5),
                      child:Image.asset('assets/codi2.png', width:100, height:100),
                    ),
                    Row(
                      children: [
                        Container(
                          padding:EdgeInsets.all(2.5),
                          child:Image.asset('assets/codi1.png', width:50, height:50),
                        ),
                        Container(
                          padding:EdgeInsets.all(2.5),
                          child:Image.asset('assets/codi4.png', width:50, height:50),
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