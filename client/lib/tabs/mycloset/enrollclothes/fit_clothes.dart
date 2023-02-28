
// import 'package:eotteom/provider.dart';
// import 'package:eotteom/style.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:sizer/sizer.dart';

// class Fit extends StatefulWidget {
//   Fit({super.key});

//   @override
//   State<Fit> createState() => _FitState();
// }

// class _FitState extends State<Fit> {
//   String fit = '';
//   List<String> fitList = ['슬림핏', '레귤러핏', '오버핏'];
//   changeFit(newFit) {
//     setState(() {
//       fit = newFit;
//     });
//   }

//   List<Widget> childs = [];
//   List<Widget> getList() {
//     childs = [];
//     for (int i = 0; i < fitList.length; i++) {
//       childs.add(CupertinoButton(
//           padding: EdgeInsets.all(0),
//           child: Container(
//             alignment: Alignment.center,
//             margin: EdgeInsets.only(right: i % 3 == 2 ? 0 : 9),
//             height: (100.w - 32 - 45) / 6,
//             width: (100.w - 32 - 18) / 3,
//             decoration: BoxDecoration(
//                 color: Color(0xffFFFFFF),
//                 border: Border.all(
//                     width: 1,
//                     color: fit != fitList[i]
//                         ? Color(0xffCACACA)
//                         : Color(0xff131313)),
//                 borderRadius: BorderRadius.circular(5)),
//             child: Text(fitList[i],
//                 style: TextStyle(
//                     fontSize: 16,
//                     fontFamily: "NotoSans",
//                     color: fit != fitList[i]
//                         ? Color(0xff9B9B9B)
//                         : Color(0xff131313),
//                     fontWeight: FontWeight.w400,
//                     height: 1.3)),
//           ),
//           onPressed: () {
//             changeFit(fitList[i]);

//             // context.read<EnrollClothes>().changeFit(fitList[i]);
//           }));
//     }

//     return childs;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         height: 16 * 1.3 + 13 + (100.w - 32 - 45) / 6 + 1,
//         width: 100.w - 32,
//         constraints: BoxConstraints(
//             minHeight: 16 * 1.3 + 13 + (100.w - 32 - 45) / 6 + 1,
//             minWidth: 100.w - 32),
//         margin: EdgeInsets.fromLTRB(16, 0, 16, 28),
//         child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//           Container(
//               height: 16 * 1.3,
//               width: 100.w - 32,
//               margin: EdgeInsets.fromLTRB(0, 0, 0, 13),
//               child: Text(
//                 '핏',
//                 style: enrollTitleTheme2,
//               )),
//           Container(
//             height: (100.w - 32 - 45) / 6,
//             width: 100.w - 32,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: getList(),
//             ),
//           )
//         ]));
//   }
// }

