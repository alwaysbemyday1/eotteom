import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:permission_handler/permission_handler.dart';

class WeatherCodi extends StatefulWidget {
  WeatherCodi({Key? key, this.phoneHeight, this.phoneWidth}) : super(key: key);
  final phoneHeight;
  final phoneWidth;

  @override
  State<WeatherCodi> createState() => _WeatherCodiState();
}

class _WeatherCodiState extends State<WeatherCodi> {
  var latitude = 0.0;
  var longitude = 0.0;
  var weather;
  var dt;

  final myKey = '448747d0f2affed088d9e676844b0d2d';

  getDateTime() {
    dt = DateTime.now();
  }

  getGeolocatorPermission() async {
    await Permission.location.request();
     setState( (){} );  // 허용을 먼저 하지 않으면 먼저 화면 구성이 돼버려서 중간에 동기화 될 수 있게
  }

  Future getWeather() async {
    var status_position = await Permission.location.status;

    if (status_position.isGranted) {
      var currentPosition = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      if (currentPosition != null) {
        latitude = currentPosition.latitude;
        longitude = currentPosition.longitude;

        http.Response response = await http.get(Uri.parse(
            'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&units=metric&appid=$myKey'));
        weather = jsonDecode(response.body);

        print(weather);
        return weather;
      } else {
        print('위치 정보를 받아오지 못했습니다.');
      }
    } else {
      print('위치 권한이 없습니다.');
    }
  }

  @override
  void initState() {
    super.initState();
    getGeolocatorPermission();
    getDateTime();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 21),
      width: (widget.phoneWidth-24)-8,
      height: 9 + 5 + 13 + (12 + 22 * 2 + 14 + 14 ) * 1.3 + 30,  // 사이간격 + lineheight + 소수점
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 9),
                child: FutureBuilder(
                    future: getWeather(),
                    builder: (context, snapshot) {
                      if(snapshot.hasData == false) {
                        return CupertinoActivityIndicator();
                      } else {
                        return Row(
                          children: [
                            Text('${weather['name']}' , style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
                            Image.network('http://openweathermap.org/img/wn/${weather['weather'][0]['icon']}@2x.png', width:12, height: 12,),
                            Text('${weather['main']['temp'].round()}°C' , style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
                            Text(dt.hour >= 12 ? ' 오후 ' : ' 오전 ', style: TextStyle(fontSize: 12)),
                            Text(dt.hour >= 12 ? '(${dt.hour - 12} ' : '(${dt.hour}', style: TextStyle(fontSize: 12)),
                            Text(':${dt.minute} 기준) 최고:${weather['main']['temp_max'].round()}°C 최저:${weather['main']['temp_min'].round()}°C', style: TextStyle(fontSize: 12)),
                          ],
                        );
                      }
                    }
                )
            ),
            Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('오늘은', style: TextStyle(fontSize:22)),
                    Text('얇은 옷을 여러겹 껴입으세요!', style: TextStyle(fontSize:22, fontWeight: FontWeight.w700),),
                  ],
                )
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 13),
              child: Text('셔츠, 면 티, 긴 바지, 조끼 등을 추천해요.', style: TextStyle(fontSize:14)),
            ),
            Container(
              height: 14 * 1.3,
              alignment: Alignment.centerRight,
              child: CupertinoButton(
                  padding: EdgeInsets.all(0),
                  child: Text('내 옷장에 있는 옷 보기', style: TextStyle(fontSize: 14, color: CupertinoColors.black)),
                  onPressed: (){}
              ),
            )
          ]
      ),
    );
  }
}