import 'dart:convert';
import 'dart:math';

import 'package:eotteom/style.dart';
import "package:eotteom/tabs/myoutfit/outfit/outfit.dart";
import 'package:eotteom/tabs/myoutfit/outfit/outfit_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import "package:eotteom/provider.dart";
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:image_picker/image_picker.dart';
import "package:provider/provider.dart";
import 'package:eotteom/tabs/myoutfit/enrolloufit/enroll_outfit.dart';
import 'package:http/http.dart' as http;

import 'enrolloufit/select_clothes_outfit.dart';
import 'enrolloufit/select_clothes_outfit_2.dart';

class Outfit extends StatelessWidget {
  const Outfit({super.key});

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
            padding: const EdgeInsets.only(bottom: 50),
            child: PlusMenu(),
          ),
          // floatingActionButton: Padding(
          //   padding: const EdgeInsets.only(bottom: 40),
          //   child: CircularMenu(
          //       alignment: Alignment.bottomRight,
          //       toggleButtonColor: Color(0xff131313),
          //       toggleButtonAnimatedIconData: AnimatedIcons.add_event,
          //       startingAngleInRadian: 0,
          //       endingAngleInRadian: 0,
          //       items: [
          //         CircularMenuItem(
          //             icon: FlutterRemix.camera_fill,
          //             iconColor: Color(0xff131313),
          //             color: Color(0xffFFFFFF),
          //             boxShadow: [
          //               BoxShadow(
          //                   color: Colors.black,
          //                   blurRadius: 10,
          //                   spreadRadius: -4),
          //             ],
          //             badgeLabel: '촬영하기',
          //             onTap: () {
          //               // callback
          //             }),
          //         CircularMenuItem(
          //             icon: FlutterRemix.image_2_fill,
          //             onTap: () {
          //               //callback
          //             }),
          //         CircularMenuItem(
          //             icon: FlutterRemix.t_shirt_2_fill,
          //             onTap: () {
          //               //callback
          //             }),
          //       ]),
          // ),
          backgroundColor: Colors.white,
          appBar: appbarOutfit,
          body: Cody(),
        ),
      ),
    );
  }
}

class PlusMenu extends StatefulWidget {
  const PlusMenu({super.key});

  @override
  State<PlusMenu> createState() => _PlusMenuState();
}

class _PlusMenuState extends State<PlusMenu> {
  var flag = false;

  List clothesList = [];
  Future getMyClothesList() async {
    http.Response response = await http.get(
        Uri.parse(
            'http://127.0.0.1:8000/api/clothes/list/${context.read<UserProvider>().userId}/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${context.read<UserProvider>().tokenAccess}',
        });

    var tmpClothesList = jsonDecode(response.body);
    clothesList = tmpClothesList['results'];

    return clothesList;
  }

  @override
  void initState() {
    getMyClothesList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      animatedIcon:
          flag == false ? AnimatedIcons.add_event : AnimatedIcons.menu_close,
      backgroundColor: Color(0xff131313),
      overlayColor: Colors.grey,
      child: Icon(FlutterRemix.close_fill),
      childMargin: EdgeInsets.only(left: 10),
      overlayOpacity: 0.5,
      spacing: 0,
      spaceBetweenChildren: 15,
      closeManually: false,
      onOpen: () {
        setState(() {
          flag = true;
        });
        context.read<EnrollOutfit>().resultImage = null;
      },
      onClose: (() {
        setState(() {
          flag = false;
        });
      }),
      children: [
        SpeedDialChild(
            child: Icon(FlutterRemix.t_shirt_2_fill),
            label: '옷장으로 등록',
            labelStyle: basicTextTheme2,
            labelBackgroundColor: Colors.transparent,
            labelShadow: [],
            onTap: () {
              Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
                  builder: (context) => SelectClothes2(
                      myClothesList: [], clothesList: clothesList)));
            }),
        SpeedDialChild(
            child: Icon(FlutterRemix.image_2_fill),
            label: '사진으로 등록',
            labelStyle: basicTextTheme2,
            labelBackgroundColor: Colors.transparent,
            labelShadow: [],
            onTap: () async {
              print('clothesList:');
              print(clothesList);
              await context.read<EnrollOutfit>().pickImage(ImageSource.gallery);
              Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
                  builder: (context) =>
                      OutfitEnroll(clothesList: clothesList)));
            }),
        SpeedDialChild(
            child: Icon(FlutterRemix.camera_fill),
            label: '촬영하기',
            labelStyle: basicTextTheme2,
            labelBackgroundColor: Colors.transparent,
            labelShadow: [],
            onTap: () {
              context.read<EnrollOutfit>().pickImage(ImageSource.camera);
              Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
                  builder: (context) =>
                      OutfitEnroll(clothesList: clothesList)));
            })
      ],
    );
  }
}
