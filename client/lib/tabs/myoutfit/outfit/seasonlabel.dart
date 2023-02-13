import "package:provider/provider.dart";
import "package:flutter/material.dart";
import "package:eotteom/provider.dart";

class SeasonLabel extends StatelessWidget {
  const SeasonLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: (context.watch<FilterProvider>().seasoncheck) ? 1.0 : 0.3,
      alwaysIncludeSemantics: true,
      child: AbsorbPointer(
        absorbing: !(context.watch<FilterProvider>().seasoncheck),
        child: SizedBox(
          height: 40,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: context.watch<FilterProvider>().seasonLabel.length,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: TextButton(
                    style: ButtonStyle(
                      side: context
                                  .watch<FilterProvider>()
                                  .seasonLabelSelect[index] ? MaterialStateProperty.all(BorderSide(color: Color(0xff131313))) : null,
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)
                        )
                      ),
                      backgroundColor: MaterialStateProperty.all(const Color(0xffFFFFFF))
                    ),
                    child: Text(
                      context.watch<FilterProvider>().seasonLabel[index],
                      style: TextStyle(
                          fontSize: 16,
                          color: const Color(0xff131313),
                          fontWeight: context
                                  .watch<FilterProvider>()
                                  .seasonLabelSelect[index] ? FontWeight.w700 : FontWeight.w500,
                          fontFamily: "NotoSans",
                          ),
                    ),
                    onPressed: () {
                      context
                          .read<FilterProvider>()
                          .changeseasonLabelSelect(index);
                    },
                  ),
                );
              })),
        ),
      ),
    );
  }
}
