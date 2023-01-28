import "package:provider/provider.dart";
import "package:flutter/material.dart";
import "package:eotteom/tabs/myoutfit/myoutfit.dart";

class OutfitLabel extends StatelessWidget {
  const OutfitLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: (context.watch<FilterProvider>().labelcheck) ? 1.0 : 0.3,
      alwaysIncludeSemantics: true,
      child: AbsorbPointer(
        absorbing: !(context.watch<FilterProvider>().labelcheck),
        child: SizedBox(
          height: 40,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: context.watch<FilterProvider>().outfitLabel.length,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: TextButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)
                        )
                      ),
                      backgroundColor: MaterialStateProperty.all(context
                                  .watch<FilterProvider>()
                                  .outfitLabelSelect[index] ? Color(0xff151515) : Color(0xffFFFFFF))
                    ),
                    child: Text(
                      context.watch<FilterProvider>().outfitLabel[index],
                      style: TextStyle(
                        backgroundColor: context
                                  .watch<FilterProvider>()
                                  .outfitLabelSelect[index] ? Color(0xff151515) : Color(0xffFFFFFF),
                          fontSize: 16,
                          color: context
                                  .watch<FilterProvider>()
                                  .outfitLabelSelect[index] ? Color(0xffFFFFFF) : Color(0xff151515),
                          fontFamily: "NotoSans",
                          ),
                    ),
                    onPressed: () {
                      context
                          .read<FilterProvider>()
                          .changeoutfitLabelSelect(index);
                    },
                  ),
                );
              })),
        ),
      ),
    );
  }
}
