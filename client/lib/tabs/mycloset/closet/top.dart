
// Padding(
//           padding: const EdgeInsets.only(left: 16, right: 16),
//           child: SingleChildScrollView(
//             scrollDirection: Axis.vertical,
//             child: GridView.builder(
//                 shrinkWrap: true,
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 3,
//                     childAspectRatio: 1,
//                     mainAxisSpacing: 8,
//                     crossAxisSpacing: 8),
//                 itemCount: imagelist.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Stack(
//                     children: [
//                       ClipRRect(
//                         child: Image.asset(
//                             "assets/images/example/cloth${index + 1}.png",
//                             width: imageWidth,
//                             height: imageWidth),
//                         borderRadius: BorderRadius.circular(4.0),
//                       ),
//                       Align(
//                         alignment: Alignment.topRight,
//                         child: IconButton(
//                           iconSize: 18,
//                           padding: const EdgeInsets.all(0),
//                           constraints: BoxConstraints(),
//                           icon: _likedstate[index]
//                               ? Icon(
//                                   Icons.star,
//                                   color: Colors.yellow,
//                                 )
//                               : Icon(
//                                   Icons.star_border_outlined,
//                                   color: Colors.black,
//                                 ),
//                           onPressed: () {
//                             setState(() {
//                               _likedstate[index] = !_likedstate[index];
//                             });
//                           },
//                         ),
//                       )
//                     ],
//                   );
//                 }),
//           ),
//         )