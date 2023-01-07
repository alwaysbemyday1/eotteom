import 'package:flutter/cupertino.dart';

class WeatherCodi extends StatelessWidget {
  const WeatherCodi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height : 300,
      padding: EdgeInsets.all(10),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text('대구 섭씨 5도(오전 09:00 기준), 최고:14도, 최저:0도', style: TextStyle(fontSize: 13),),
            ),
            Container(
              child: Text('오늘은 얇은 옷을 여러겹 껴입으세요!'),
            ),
            Container(
              child: Text('셔츠, 면 티, 긴 바지, 조끼 등을 추천해요.'),
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
            Container(
                alignment: Alignment.centerRight,
                child: Text('내 옷장에 있는 옷 더보기', style: TextStyle(fontSize: 10, color: Color.fromRGBO(128,128,128, 1)),)
            )
          ]
      ),
    );
  }
}