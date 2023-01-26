import 'package:eotteom/provider.dart';
import 'package:eotteom/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class Picture extends StatefulWidget {
  Picture({super.key});

  @override
  State<Picture> createState() => _PictureState();
}

class _PictureState extends State<Picture> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(16, 0, 16, 32),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              margin: EdgeInsets.only(bottom: 13),
              child: Text('사진', style: enrollTitleTheme)),
          CupertinoButton(
            padding: EdgeInsets.all(0),
            onPressed: () {
              context.read<EnrollClothes>().pickImage(ImageSource.gallery);
            },
            child: Container(
                alignment: Alignment.center,
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    color: Color(0xfff3f3f3),
                    borderRadius: BorderRadius.circular(5)),
                child: context.watch<EnrollClothes>().resultImage == null
                    ? Text('no image selected!', style: headLineTextTheme)
                    : Image.file(context.watch<EnrollClothes>().resultImage!,
                        height: 200, width: 200, fit: BoxFit.fill)),
          )
        ]));
  }
}
