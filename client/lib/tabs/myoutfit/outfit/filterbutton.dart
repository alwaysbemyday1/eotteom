import 'package:eotteom/provider.dart';
import "package:provider/provider.dart";
import 'package:eotteom/tabs/myoutfit/outfit/outfitlabel.dart';
import "package:flutter/material.dart";
import "package:eotteom/tabs/myoutfit/outfit/checkbox.dart";
import 'package:sizer/sizer.dart';
import "daterangepicker.dart";
import "package:flutter_remix/flutter_remix.dart";

ButtonStyle buttonStyle = ButtonStyle(
    shape: MaterialStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
        side: BorderSide(color: Colors.black))));

ButtonStyle searchbuttonStyle = ButtonStyle(
    shape: MaterialStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
        side: BorderSide(color: Colors.black))),
    backgroundColor: MaterialStateProperty.all(Colors.black));

class FilterButton extends StatefulWidget {
  FilterButton({Key? key, this.changeFilter}) : super(key: key);
  final changeFilter;
  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return TextButton(
          style: buttonStyle,
          child: Text(
            '필터',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            showModalBottomSheet(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                isScrollControlled: true,
                context: context,
                builder: ((context) => DraggableScrollableSheet(
                      expand: false,
                      builder: ((context, scrollController) => Container(
                            color: Color(0xffFFFFFF),
                            height: 160.h,
                            child: SingleChildScrollView(
                              controller: scrollController,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Padding(
                                        padding:
                                            EdgeInsets.only(left: 30, top: 27),
                                        child: Text(
                                          '필터',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 18),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 32, top: 32),
                                        child: IconButton(
                                          icon: const Icon(
                                              FlutterRemix.close_fill,
                                              size: 24),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 23,
                                  ),
                                  const Divider(
                                    thickness: 1,
                                    color: Color(0xffCACACA),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CheckboxWeather(),
                                        IconButton(
                                          icon: const Icon(
                                              FlutterRemix.refresh_line),
                                          onPressed: () {
                                            setState(() {
                                              context
                                                  .read<FilterProvider>()
                                                  .resetFilter();
                                            });
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: MonthRangePick(),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 24, right: 24),
                                    child: Divider(
                                      thickness: 1,
                                      color: Color(0xffCACACA),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: CheckboxLabel(),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Align(
                                      child: OutfitLabel(),
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 24, top: 38),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                            backgroundColor: Colors.black,
                                            fixedSize: const Size(156, 44),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(22))),
                                        onPressed: () {
                                          List<String> changeSelectedFilter = Provider.of<FilterProvider>(context, listen: false).getSelectOutfitLabelList();
                                          widget.changeFilter(changeSelectedFilter);
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(
                                          '검색',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 75,
                                  )
                                ],
                              ),
                            ),
                          )),
                    )));
          },
        );
      },
    );
  }
}
