import "package:eotteom/model/outfit_model.dart";
import "package:eotteom/tabs/myoutfit/outfit/outfit.dart";
import 'package:eotteom/tabs/myoutfit/outfit/outfit_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import "package:eotteom/provider.dart";
import "package:provider/provider.dart";
import "package:eotteom/tabs/myoutfit/enrolloufit/enroll.dart";
import "package:http/http.dart" as http;
import "dart:convert";

class Outfit extends StatefulWidget {
  const Outfit({super.key});

  @override
  State<Outfit> createState() => _OutfitState();
}

class _OutfitState extends State<Outfit> {
  final outfitmodelProvider = OutfitModelProvider();
  // @override
  // void initState() {
  //   print("outfit 위젯 생성");
  //   // TODO: implement initState
  //   super.initState();
  //   String userId = context.read<UserProvider>().userId;
  //   String tokenAccess = context.read<UserProvider>().tokenAccess;
  //   outfitmodelProvider.getOutfitModel(userId, tokenAccess);
  //   // WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
  //   //   await Provider.of<OutfitModelProvider>(context, listen: false).getOutfitModel(userId, tokenAccess);
  //   // });
  //   print("데이터 다 불러와줌");
  // }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FilterProvider(),
      child: MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [const Locale('ko')],
        locale: Locale('ko'),
        home: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 40, right: 16),
            child: FloatingActionButton(
                backgroundColor: Color(0xff151515),
                child: Icon(Icons.add),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).push(
                      MaterialPageRoute(builder: (context) => OutfitEnroll()));
                }),
          ),
          backgroundColor: Colors.white,
          appBar: appbarOutfit,
          body: Cody(),
        ),
      ),
    );
  }
  // _getOutfitModel() async {
  //   String userId = context.read<UserProvider>().userId;
  //   String tokenAccess = context.read<UserProvider>().tokenAccess;
  //   String url = "http://127.0.0.1:8000/api/outfits/list/${userId}/";
  //   http.Response response = await http.get(Uri.parse(url), headers: {
  //     'Content-Type': 'application/json',
  //     'Accept': 'application/json',
  //     'Authorization': 'Bearer $tokenAccess',
  //   });

  //   if (response.statusCode == 200) {
  //     var jsonBody = jsonDecode(utf8.decode(response.bodyBytes));
  //     OutfitModel outfitModel = OutfitModel.fromJson(jsonBody);
  //     context.watch<OutfitModelProvider>().setOutfitModelValueFromJson(outfitModel);
  //   } else {
  //     throw Exception("앨범 로딩 실패");
  //   }
  // }
}
