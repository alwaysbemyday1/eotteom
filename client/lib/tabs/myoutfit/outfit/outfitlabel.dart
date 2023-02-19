import "package:provider/provider.dart";
import "package:flutter/material.dart";
import "package:eotteom/provider.dart";

class OutfitLabel extends StatelessWidget {
  const OutfitLabel({super.key});

  @override
  Widget build(BuildContext context) {
    Padding _getSelectBox(int index) {
      return Padding(
        padding: const EdgeInsets.all(4.0),
        child: SizedBox(
          height: 40,
          child: TextButton(
              child: Text(
                context.watch<FilterProvider>().outfitLabel[index],
                style: TextStyle(
                  fontWeight: context.watch<FilterProvider>().outfitLabelSelect[index] ? FontWeight.w700 : FontWeight.w400,
                  backgroundColor: Color(0xffFFFFFF),
                  fontSize: 16,
                  color: Color(0xff151515),
                  fontFamily: "NotoSans",
                ),
              ),
              onPressed: () {
                context.read<FilterProvider>().changeoutfitLabelSelect(index);
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.only(left: 14, right: 14)),
                side: MaterialStateProperty.all(BorderSide(
                  color: context.watch<FilterProvider>().outfitLabelSelect[index] ? Color(0xff131313) : Color(0xffCACACA)
                )),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(39))),
                  backgroundColor: MaterialStateProperty.all(
                      Color(0xffFFFFFF)))),
        ),
      );
    }

    return Opacity(
      opacity: (context.watch<FilterProvider>().labelcheck) ? 1.0 : 0.3,
      alwaysIncludeSemantics: true,
      child: AbsorbPointer(
        absorbing: !(context.watch<FilterProvider>().labelcheck),
        child: Column(
          children: [
            Row(
              children: [
                _getSelectBox(0),
                _getSelectBox(1),
                _getSelectBox(2),
                _getSelectBox(3)
              ],
            ),
            Row(
              children: [
                _getSelectBox(4),
                _getSelectBox(5),
                _getSelectBox(6),
                _getSelectBox(7)
              ],
            ),
            Row(
              children: [
                _getSelectBox(8),
                _getSelectBox(9),
                _getSelectBox(10),
                _getSelectBox(11),
              ],
            ),
            Row(
              children: [
                _getSelectBox(12),
                _getSelectBox(13),
                _getSelectBox(14)
              ],
            )
          ],
        ),
      ),
    );
  }
}
