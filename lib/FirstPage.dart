import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_diet_tips/CreatePlanPage.dart';
import 'package:flutter_diet_tips/util/ConstantData.dart';
import 'package:flutter_diet_tips/util/ConstantWidget.dart';
import 'package:flutter_diet_tips/util/DataFile.dart';
import 'package:flutter_diet_tips/util/PrefData.dart';
import 'package:flutter_diet_tips/util/SizeConfig.dart';
import 'package:numberpicker/numberpicker.dart';

import 'generated/l10n.dart';
import 'model/DietModel.dart';

class FirstPage extends StatefulWidget {
  // final ValueChanged<bool> onChanged;

  // FirstPage(this.onChanged);

  @override
  _FirstPage createState() {
    return _FirstPage();
    // return _FirstPage(this.onChanged);
  }
}

class _FirstPage extends State<FirstPage> {
  int _position = 0;
  int _dietPosition = 0;
  int _itemPosition = 0;
  int _itemAboutPosition = 0;
  int _motivatePosition = 0;
  int _variedPosition = 0;
  double tabHeight = 0;
  double tabWidth = 0;
  double tabRadius = 0;
  double? margin;
  bool isCm = true;
  bool isKg = true;

  List<String> selectMealList = [];
  List<DietModel> mealList = DataFile.getMealList();
  List<DietModel> dietList = DataFile.getDietList();
  List<DietModel> motivateList = DataFile.getMotivateList();
  List<DietModel> variedList = DataFile.getVariedList();
  List<String> itemList = ["Chicken", "Wheat", "Peanut", "Soy", "Eggs"];
  List<String> hearAboutList = [
    "In social media ad",
    "From a person I follow",
    "From my friend",
    "On TV",
    "On the radio",
    "Other"
  ];

  bool isMale = true;

  int cm = 80;
  int inch = 25;
  int ft = 25;
  int kg = 25;
  int age = 22;
  double lbs = 25;

  Future<bool> _requestPop() {
    if (_position > 0) {
      setState(() {
        _position--;
      });
    } else {
      if (Platform.isIOS) {
        exit(0);
      } else {
        SystemNavigator.pop();
      }
      // Future.delayed(const Duration(milliseconds: 200), () {
      //   SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      // });
    }

    return new Future.value(false);
  }

  // int totalPosition = 6;

  List<Widget> widgetList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setLbsValue();
  }

  setLbsValue() {
    lbs = kg * 2.205;
    lbs = double.parse((lbs).toStringAsFixed(0));

    double total = (cm / 2.54);
    double value = (total / 12);
    double value1 = (total - 12) * value.toInt();

    print("total----$total------$value--------$value1");

    ft = value.toInt();
    inch = value1.toInt();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    double defMargin = getScreenPercentSize(context, 2);

    margin = getScreenPercentSize(context, 2);
    if (widgetList.length <= 0) {
      getPositionWidget();
    }

    setState(() {});

    return WillPopScope(
        child: Scaffold(
          backgroundColor: cellColor,
          appBar: AppBar(
            backgroundColor: cellColor,
            elevation: 0,
            title: Text(""),
            leading: IconButton(
              icon: Icon(
                Icons.keyboard_backspace_sharp,
                color: textColor,
              ),
              onPressed: _requestPop,
            ),
          ),
          body: Stack(
            children: [
              Container(
                // child:getHearAboutUsDiet(),
                child:
                    widgetList.length > 0 ? widgetList[_position] : Container(),
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: defMargin),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: InkWell(
                      child: Container(
                          height: getScreenPercentSize(context, 7),
                          margin: EdgeInsets.only(bottom: (defMargin * 2)),
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.all(
                                  Radius.circular((defMargin / 2)))),
                          child: InkWell(
                            child: Center(
                              child: getCustomTextWithoutAlign(
                                  S.of(context).continueText,
                                  Colors.white,
                                  FontWeight.w500,
                                  ConstantData.font22Px),
                            ),
                          )),
                      onTap: () {
                        if (_position < (widgetList.length - 1)) {
                          _position++;

                          setState(() {});
                        } else {
                          PrefData.setIsFirstTime(false);
                          // Navigator.of(context).pop(true);
                          //
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CreatePlanPage(),
                              ));
                        }
                      },
                    ),
                  )),
              Container(
                height: getScreenPercentSize(context, 0.7),
                child: Row(
                  children: [
                    for (int i = 0; i < widgetList.length; i++)
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(horizontal: 3),
                          color: (i <= _position)
                              ? primaryColor
                              : Colors.grey.shade200,
                          height: double.infinity,
                        ),
                        flex: 1,
                      )
                  ],
                ),
              )
            ],
          ),
        ),
        onWillPop: _requestPop);
  }

  getPositionWidget() {
    widgetList.add(firstWidget());
    widgetList.add(getMotivates());
    widgetList.add(ageWidget());
    widgetList.add(heightWidget());
    widgetList.add(weightWidget());
    widgetList.add(goalWeightWidget());
    widgetList.add(getCurrentDiet());
    widgetList.add(getSearchDiet());
    widgetList.add(getMealDiet());
    widgetList.add(getVaried());
    widgetList.add(getHearAboutUsDiet());

    // if (_position == 0) {
    //   return firstWidget();
    // } else if (_position == 1) {
    //   return getCurrentDiet();
    // } else if (_position == 2) {
    //   return ageWidget();
    // } else if (_position == 3) {
    //   return heightWidget();
    // } else if (_position == 4) {
    //   return weightWidget();
    // } else if (_position == 5) {
    //   return goalWeightWidget();
    // }
  }

  Widget getHearAboutUsDiet() {
    SizeConfig().init(context);

    return StatefulBuilder(
      builder: (context, setState) => Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.all(margin!),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getHeaderText("Where did you hear\nabout us?"),
            Expanded(
              child: ListView.separated(
                itemCount: hearAboutList.length,
                scrollDirection: Axis.vertical,
                separatorBuilder: (context, index) {
                  return Container(
                    color: subTextColor.withOpacity(0.1),
                    height: 0.5,
                  );
                },
                itemBuilder: (context, index) {
                  bool isSelect = (index == _itemAboutPosition);
                  return InkWell(
                    onTap: () {
                      setState(() {
                        _itemAboutPosition = index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: (margin! / 2)),
                      padding: EdgeInsets.symmetric(vertical: (margin!)),
                      child: Row(
                        children: [
                          // SizedBox(
                          //   width: margin,
                          // ),

                          Expanded(
                            child: getTextWidget(
                                hearAboutList[index],
                                textColor,
                                TextAlign.start,
                                FontWeight.bold,
                                getScreenPercentSize(context, 1.8)),
                          ),

                          Icon(
                            (isSelect) ? Icons.check_circle : Icons.circle,
                            color: isSelect
                                ? primaryColor
                                : subTextColor.withOpacity(0.1),
                            size: getScreenPercentSize(context, 4),
                          ),

                          // SizedBox(width: margin,)
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getSearchDiet() {
    SizeConfig().init(context);

    return StatefulBuilder(
      builder: (context, setState) => Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.all(margin!),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getHeaderText("Select items that\nyou don't eat!"),

            // Container(
            //   // margin: EdgeInsets.all(
            //   //     getScreenPerce ntSize(context, 2)),
            //   padding: EdgeInsets.symmetric(
            //       horizontal: getScreenPercentSize(
            //           context, 1)),
            //   height: searchHeight,
            //
            //
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.all(Radius.circular(
            //           getPercentSize(searchHeight, 15))),
            //       border: Border.all(
            //           color: subTextColor.withOpacity(0.1),
            //           width: 1.5)),
            //
            //   child: Row(
            //     children: [
            //
            //       Expanded(
            //         child: TextField(
            //           style: TextStyle(
            //               color: textColor,
            //               fontSize:
            //               getPercentSize(
            //                   searchHeight, 30) ),
            //           // controller: textEditingController,
            //           textAlign: TextAlign.start,
            //           textAlignVertical: TextAlignVertical.center,
            //           decoration: InputDecoration(
            //               border: InputBorder.none,
            //               contentPadding: EdgeInsets.only(bottom: searchHeight/2.7),
            //               hintStyle: TextStyle(
            //                   color: Colors.grey,
            //                   fontSize:
            //                   getPercentSize(
            //                       searchHeight, 30)),
            //               hintText: "Searching food.."),
            //         ),
            //       ),
            //       Icon(CupertinoIcons.search,
            //           color: subTextColor,
            //           size: getPercentSize(
            //               (searchHeight / 1.3), 50)),
            //     ],
            //   ),
            // ),

            Expanded(
              child: ListView.separated(
                itemCount: itemList.length,
                scrollDirection: Axis.vertical,
                separatorBuilder: (context, index) {
                  return Container(
                    color: subTextColor.withOpacity(0.1),
                    height: 0.5,
                  );
                },
                itemBuilder: (context, index) {
                  bool isSelect = (index == _itemPosition);
                  return InkWell(
                    onTap: () {
                      setState(() {
                        _itemPosition = index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: (margin! / 2)),
                      padding: EdgeInsets.symmetric(vertical: (margin!)),
                      // decoration: BoxDecoration(
                      //     color: isSelect ? primaryColor : Colors.transparent,
                      //     borderRadius: BorderRadius.all(Radius.circular(
                      //         getScreenPercentSize(context, 1.5))),
                      //     border: Border.all(
                      //         color: isSelect
                      //             ? Colors.transparent
                      //             : subTextColor.withOpacity(0.1),
                      //         width: 1.5)),
                      child: Row(
                        children: [
                          // SizedBox(
                          //   width: margin,
                          // ),

                          Expanded(
                            child: getTextWidget(
                                dietList[index].title!,
                                textColor,
                                TextAlign.start,
                                FontWeight.bold,
                                getScreenPercentSize(context, 1.8)),
                          ),

                          Icon(
                            (isSelect) ? Icons.check_circle : Icons.circle,
                            color: isSelect
                                ? primaryColor
                                : subTextColor.withOpacity(0.1),
                            size: getScreenPercentSize(context, 4),
                          ),

                          // SizedBox(width: margin,)
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getMealDiet() {
    SizeConfig().init(context);

    return StatefulBuilder(
      builder: (context, setState) => Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.all(margin!),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getHeaderText("Which meals do you \nusually have?"),
            Expanded(
              child: ListView.builder(
                itemCount: mealList.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  bool isSelect = (selectMealList.contains(index.toString()));
                  return InkWell(
                    onTap: () {
                      setState(() {
                        if (!selectMealList.contains(index.toString())) {
                          selectMealList.add(index.toString());
                        } else {
                          selectMealList.remove(index.toString());
                        }
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: (margin! / 2)),
                      padding: EdgeInsets.symmetric(
                          horizontal: (margin!), vertical: (margin!)),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(
                              getScreenPercentSize(context, 1.5))),
                          border: Border.all(
                              color: subTextColor.withOpacity(0.1),
                              width: 1.5)),
                      child: Row(
                        children: [
                          Image.asset(
                            ConstantData.assetsPath + mealList[index].image!,
                            height: getScreenPercentSize(context, 4),
                          ),
                          SizedBox(
                            width: margin,
                          ),
                          Expanded(
                            child: getTextWidget(
                                mealList[index].title!,
                                textColor,
                                TextAlign.start,
                                FontWeight.bold,
                                getScreenPercentSize(context, 1.8)),
                          ),
                          Icon(
                            (isSelect) ? Icons.check_circle : Icons.circle,
                            color: isSelect
                                ? primaryColor
                                : subTextColor.withOpacity(0.1),
                            size: getScreenPercentSize(context, 4),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getCurrentDiet() {
    SizeConfig().init(context);

    return StatefulBuilder(
      builder: (context, setState) => Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.all(margin!),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getHeaderText("Are you currently\nfollowing a diet?"),
            Expanded(
              child: ListView.builder(
                itemCount: dietList.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  bool isSelect = (index == _dietPosition);
                  return InkWell(
                    onTap: () {
                      setState(() {
                        _dietPosition = index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: (margin! / 2)),
                      padding: EdgeInsets.symmetric(
                          horizontal: (margin!), vertical: (margin!)),
                      decoration: BoxDecoration(
                          color: isSelect ? primaryColor : Colors.transparent,
                          borderRadius: BorderRadius.all(Radius.circular(
                              getScreenPercentSize(context, 1.5))),
                          border: Border.all(
                              color: isSelect
                                  ? Colors.transparent
                                  : subTextColor.withOpacity(0.1),
                              width: 1.5)),
                      child: Row(
                        children: [
                          Image.asset(
                            ConstantData.assetsPath + dietList[index].image!,
                            height: getScreenPercentSize(context, 4),
                          ),
                          SizedBox(
                            width: margin,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                getTextWidget(
                                    dietList[index].title!,
                                    isSelect ? Colors.white : textColor,
                                    TextAlign.start,
                                    FontWeight.bold,
                                    getScreenPercentSize(context, 1.8)),
                                getTextWidget(
                                    dietList[index].subTitle!,
                                    isSelect ? Colors.white : Colors.grey,
                                    TextAlign.start,
                                    FontWeight.w500,
                                    getScreenPercentSize(context, 1.5)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getMotivates() {
    SizeConfig().init(context);

    return StatefulBuilder(
      builder: (context, setState) => Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.all(margin!),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getHeaderText("What motives you\nthe most?"),
            Expanded(
              child: ListView.builder(
                itemCount: motivateList.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  bool isSelect = (index == _motivatePosition);
                  return InkWell(
                    onTap: () {
                      setState(() {
                        _motivatePosition = index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: (margin! / 2)),
                      padding: EdgeInsets.symmetric(
                          horizontal: (margin!), vertical: (margin!)),
                      decoration: BoxDecoration(
                          color: isSelect ? primaryColor : Colors.transparent,
                          borderRadius: BorderRadius.all(Radius.circular(
                              getScreenPercentSize(context, 1.5))),
                          border: Border.all(
                              color: isSelect
                                  ? Colors.transparent
                                  : subTextColor.withOpacity(0.1),
                              width: 1.5)),
                      child: Row(
                        children: [
                          Image.asset(
                            ConstantData.assetsPath +
                                motivateList[index].image!,
                            height: getScreenPercentSize(context, 4),
                          ),
                          SizedBox(
                            width: margin,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                getTextWidget(
                                    motivateList[index].title!,
                                    isSelect ? Colors.white : textColor,
                                    TextAlign.start,
                                    FontWeight.bold,
                                    getScreenPercentSize(context, 1.8)),
                                getTextWidget(
                                    motivateList[index].subTitle!,
                                    isSelect ? Colors.white : Colors.grey,
                                    TextAlign.start,
                                    FontWeight.w500,
                                    getScreenPercentSize(context, 1.5)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getVaried() {
    SizeConfig().init(context);

    return StatefulBuilder(
      builder: (context, setState) => Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.all(margin!),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getHeaderText("How varied do you\nwant your diet to be?"),
            Expanded(
              child: ListView.builder(
                itemCount: variedList.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  bool isSelect = (index == _variedPosition);
                  return InkWell(
                    onTap: () {
                      setState(() {
                        _variedPosition = index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: (margin! / 2)),
                      padding: EdgeInsets.symmetric(
                          horizontal: (margin!), vertical: (margin!)),
                      decoration: BoxDecoration(
                          color: isSelect ? primaryColor : Colors.transparent,
                          borderRadius: BorderRadius.all(Radius.circular(
                              getScreenPercentSize(context, 1.5))),
                          border: Border.all(
                              color: isSelect
                                  ? Colors.transparent
                                  : subTextColor.withOpacity(0.1),
                              width: 1.5)),
                      child: Row(
                        children: [
                          SizedBox(
                            width: margin,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                getTextWidget(
                                    variedList[index].title!,
                                    isSelect ? Colors.white : textColor,
                                    TextAlign.start,
                                    FontWeight.bold,
                                    getScreenPercentSize(context, 1.8)),
                                getTextWidget(
                                    variedList[index].subTitle!,
                                    isSelect ? Colors.white : Colors.grey,
                                    TextAlign.start,
                                    FontWeight.w500,
                                    getScreenPercentSize(context, 1.5)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  getHeaderView(String s, String subTitle) {
    Widget space = SizedBox(
      height: margin,
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        space,
        getTitleWidget(s),
        space,
        getSubTitleWidget(subTitle),
      ],
    );
  }

  getTitleWidget(String s) {
    return getTextWidget(s, Colors.black, TextAlign.start, FontWeight.bold,
        getScreenPercentSize(context, 2.5));
  }

  getSubTitleWidget(String s) {
    return getTextWidget(s, Colors.grey, TextAlign.start, FontWeight.w300,
        getScreenPercentSize(context, 1.8));
  }

  Widget heightWidget() {
    TextEditingController textEditingController =
        new TextEditingController(text: cm.toString());
    TextEditingController textEditingController1 =
        new TextEditingController(text: ft.toString());
    TextEditingController textEditingControllerInch =
        new TextEditingController(text: inch.toString());

    return StatefulBuilder(
      builder: (context, setState) => Container(
        margin: EdgeInsets.all(margin!),
        child: Stack(
          children: [
            getHeaderText(
              S.of(context).howTallAreYou,
            ),

            Container(
              margin: EdgeInsets.only(bottom: getScreenPercentSize(context, 5)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: (margin!)),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IntrinsicWidth(
                            child: getTextField((isCm)
                                ? textEditingController
                                : textEditingController1),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          getTextWidget(
                              (isCm) ? "Cm" : "Ft",
                              subTextColor,
                              TextAlign.end,
                              FontWeight.w600,
                              getScreenPercentSize(context, 2)),
                          SizedBox(
                            width: 10,
                          ),
                          Visibility(
                            visible: (!isCm),
                            child: IntrinsicWidth(
                              child: getTextField(textEditingControllerInch),
                            ),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Visibility(
                            visible: (!isCm),
                            child: getTextWidget(
                                "In",
                                subTextColor,
                                TextAlign.end,
                                FontWeight.w600,
                                getScreenPercentSize(context, 2)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getScreenPercentSize(context, 0.5),
                  ),
                  getTabWidget(setState)
                ],
              ),
            )

            // getTextWidget(
            //     S.of(context).howTallAreYou,
            //     Colors.black,
            //     TextAlign.left,
            //     FontWeight.bold,
            //     getScreenPercentSize(context, 4.2)),
            // SizedBox(
            //   height: getScreenPercentSize(context, 0.5),
            // ),
            // getTextWidget(
            //     S.of(context).toGiveYouABetterExperienceNweNeedToKnowHeight,
            //     Colors.black54,
            //     TextAlign.left,
            //     FontWeight.w300,
            //     getScreenPercentSize(context, 2)),
            // SizedBox(
            //   height: getScreenPercentSize(context, 3),
            // ),
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Container(
            //       height: (height * 1.3),
            //       width: height,
            //       margin: EdgeInsets.symmetric(
            //           horizontal:
            //               getScreenPercentSize(context, 1)),
            //       padding: EdgeInsets.symmetric(
            //           vertical:
            //               getScreenPercentSize(context, 2.5)),
            //       child: Stack(
            //         children: [
            //           Container(
            //             width: (subHeight * 1.2),
            //             height: subHeight,
            //             margin: EdgeInsets.only(top: cellHeight / 2),
            //             padding: EdgeInsets.only(
            //                 left: cellHeight / 2, bottom: cellHeight / 3),
            //             decoration: BoxDecoration(
            //               color: backgroundColor,
            //               borderRadius: BorderRadius.all(
            //                 Radius.circular(
            //                     getPercentSize(subHeight, 15)),
            //               ),
            //             ),
            //             child: Row(
            //               crossAxisAlignment: CrossAxisAlignment.end,
            //               children: [
            //                 getTextWidget(
            //                     cm.toString(),
            //                     Colors.black,
            //                     TextAlign.end,
            //                     FontWeight.w300,
            //                     getPercentSize(subHeight, 25)),
            //                 getTextWidget(
            //                     S.of(context).cm,
            //                     primaryColor,
            //                     TextAlign.end,
            //                     FontWeight.w300,
            //                     getPercentSize(subHeight, 15)),
            //               ],
            //             ),
            //           ),
            //           Container(
            //             width: cellHeight,
            //             height: cellHeight,
            //             margin: EdgeInsets.only(left: (cellHeight / 2)),
            //             decoration: BoxDecoration(
            //               color: primaryColor,
            //               borderRadius: BorderRadius.all(
            //                 Radius.circular(
            //                     getPercentSize(cellHeight, 30)),
            //               ),
            //             ),
            //             child: Center(
            //               child: Image.asset(
            //                 ConstantData.assetsPath + "height.png",
            //                 height: getPercentSize(cellHeight, 40),
            //                 color: Colors.white,
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //     Container(
            //       height: (height * 1.3),
            //       width: height,
            //       margin: EdgeInsets.symmetric(
            //           horizontal:
            //               getScreenPercentSize(context, 1)),
            //       padding: EdgeInsets.symmetric(
            //           vertical:
            //               getScreenPercentSize(context, 2.5)),
            //       child: Stack(
            //         children: [
            //           Container(
            //             width: (subHeight * 1.2),
            //             height: subHeight,
            //             margin: EdgeInsets.only(top: cellHeight / 2),
            //             padding: EdgeInsets.only(
            //                 left: cellHeight / 2, bottom: cellHeight / 3),
            //             decoration: BoxDecoration(
            //               color: backgroundColor,
            //               borderRadius: BorderRadius.all(
            //                 Radius.circular(
            //                     getPercentSize(subHeight, 15)),
            //               ),
            //             ),
            //             child: Row(
            //               crossAxisAlignment: CrossAxisAlignment.end,
            //               children: [
            //                 // Expanded(
            //                 //   child:
            //                 getTextWidget(
            //                     ft.toString(),
            //                     Colors.black,
            //                     TextAlign.start,
            //                     FontWeight.w300,
            //                     getPercentSize(subHeight, 20)),
            //                 // ),
            //                 getTextWidget(
            //                     S.of(context).ft,
            //                     primaryColor,
            //                     TextAlign.end,
            //                     FontWeight.w300,
            //                     getPercentSize(subHeight, 15)),
            //
            //
            //                 SizedBox(width: getPercentSize(subHeight, 5),),
            //                 getTextWidget(
            //                     inch.toString(),
            //                     Colors.black,
            //                     TextAlign.start,
            //                     FontWeight.w300,
            //                     getPercentSize(subHeight, 20)),
            //                 // ),
            //                 getTextWidget(
            //                     S.of(context).inches,
            //                     primaryColor,
            //                     TextAlign.end,
            //                     FontWeight.w300,
            //                     getPercentSize(subHeight, 15)),
            //               ],
            //             ),
            //           ),
            //           Container(
            //             width: cellHeight,
            //             height: cellHeight,
            //             margin: EdgeInsets.only(left: (cellHeight / 2)),
            //             decoration: BoxDecoration(
            //               color: primaryColor,
            //               borderRadius: BorderRadius.all(
            //                 Radius.circular(
            //                     getPercentSize(cellHeight, 30)),
            //               ),
            //             ),
            //             child: Center(
            //               child: Image.asset(
            //                 ConstantData.assetsPath+ "ft.png",
            //                 height: getPercentSize(cellHeight, 40),
            //                 color: Colors.white,
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
            // Center(
            //   child: Container(
            //     width: getWidthPercentSize(context, 70),
            //
            //     padding: EdgeInsets.symmetric(
            //         vertical: getScreenPercentSize(context, 2.5)),
            //
            //     child: Align(
            //       alignment: Alignment.topCenter,
            //       child: NumberPicker(
            //         value: cm,
            //         minValue: 80,
            //         maxValue: 350,
            //         textStyle: TextStyle(
            //             fontSize: getScreenPercentSize(context, 2),
            //             color: Colors.black,
            //             fontFamily: ConstantData.fontFamily
            //         ),
            //         selectedTextStyle: TextStyle(
            //             fontSize: getScreenPercentSize(context, 5),
            //             color: primaryColor,
            //             fontFamily: ConstantData.fontFamily),
            //         step: 1,
            //         haptics: true,
            //         onChanged: (value) => setState(() {
            //           cm = value;
            //           setLbsValue();
            //         }),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  getTextField(TextEditingController editingController) {
    return TextField(
        maxLines: 1,
        controller: editingController,
        cursorColor: primaryColor,
        textAlign: TextAlign.end,
        textAlignVertical: TextAlignVertical.bottom,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(3),
        ],
        style: TextStyle(
            color: textColor,
            fontSize: getScreenPercentSize(context, 6),
            fontFamily: ConstantData.fontFamily,
            fontWeight: FontWeight.w500),
        decoration: InputDecoration(
            fillColor: Colors.red,
            filled: false,
            hintText: "0",
            border: InputBorder.none,
            hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: getScreenPercentSize(context, 6),
                fontFamily: ConstantData.fontFamily,
                fontWeight: FontWeight.w500)));
  }

  getTab1(bool isRight, String s, bool isSelect, Function function) {
    tabWidth = getWidthPercentSize(context, 25);
    tabHeight = getScreenPercentSize(context, 6);
    tabRadius = getPercentSize(tabHeight, 50);

    var radius = Radius.circular(tabRadius);
    var radius1 = Radius.circular(0);
    return InkWell(
      onTap: () {
        function();
      },
      child: Container(
        width: tabWidth,
        height: tabHeight,
        decoration: BoxDecoration(
            border: Border.all(
                color:
                    (isSelect) ? primaryColor : subTextColor.withOpacity(0.1),
                width: getPercentSize(tabHeight, 3)),
            borderRadius: BorderRadius.only(
              topLeft: (isRight) ? radius1 : radius,
              bottomLeft: (isRight) ? radius1 : radius,
              topRight: (isRight) ? radius : radius1,
              bottomRight: (isRight) ? radius : radius1,
            )),
        child: Center(
          child: getTextWidget(s, (isSelect) ? primaryColor : subTextColor,
              TextAlign.center, FontWeight.w600, getPercentSize(tabWidth, 16)),
        ),
      ),
    );
  }

  getTabWidget(var setState) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        getTab1(false, "Ft", !isCm, () {
          setState(() {
            isCm = false;
          });
        }),
        getTab1(true, "Cm", isCm, () {
          setState(() {
            isCm = true;
          });
        }),
        // Container(
        //   width: 100,
        //   height: 50,
        //   decoration: BoxDecoration(
        //       border: Border.all(color: primaryColor, width: 1.5),
        //       borderRadius: BorderRadius.only(
        //         topLeft: Radius.circular(25),
        //         bottomLeft: Radius.circular(25),
        //       )),
        // ),
        // Container(
        //   width: 100,
        //   height: 50,
        //   decoration: BoxDecoration(
        //       border:
        //           Border.all(color: subTextColor.withOpacity(0.1), width: 1.5),
        //       borderRadius: BorderRadius.only(
        //         topRight: Radius.circular(25),
        //         bottomRight: Radius.circular(25),
        //       )),
        // )
      ],
    );
  }

  getWeightTabWidget(var setState) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        getTab1(false, "lb", !isKg, () {
          setState(() {
            isKg = false;
          });
        }),
        getTab1(true, "Kg", isKg, () {
          setState(() {
            isKg = true;
          });
        }),
        // Container(
        //   width: 100,
        //   height: 50,
        //   decoration: BoxDecoration(
        //       border: Border.all(color: primaryColor, width: 1.5),
        //       borderRadius: BorderRadius.only(
        //         topLeft: Radius.circular(25),
        //         bottomLeft: Radius.circular(25),
        //       )),
        // ),
        // Container(
        //   width: 100,
        //   height: 50,
        //   decoration: BoxDecoration(
        //       border:
        //           Border.all(color: subTextColor.withOpacity(0.1), width: 1.5),
        //       borderRadius: BorderRadius.only(
        //         topRight: Radius.circular(25),
        //         bottomRight: Radius.circular(25),
        //       )),
        // )
      ],
    );
  }

  Widget ageWidget() {
    return StatefulBuilder(
      builder: (context, setState) => Container(
        color: cellColor,
        margin: EdgeInsets.all(margin!),
        child: Stack(
          children: [
            getHeaderText(
              "How old are you?",
            ),
            Align(
              alignment: Alignment.center,
              child: NumberPicker(
                value: age,
                itemHeight: getScreenPercentSize(context, 12),
                minValue: 18,
                maxValue: 350,
                textStyle: TextStyle(
                    fontSize: getScreenPercentSize(context, 5),
                    color: Colors.black,
                    fontFamily: ConstantData.fontFamily),
                selectedTextStyle: TextStyle(
                    fontSize: getScreenPercentSize(context, 8),
                    color: primaryColor,
                    fontFamily: ConstantData.fontFamily),
                step: 1,
                haptics: true,
                onChanged: (value) => setState(() {
                  age = value;
                }),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget goalWeightWidget() {
    // return Container(
    //   color: cellColor,
    //   margin: EdgeInsets.all(margin!),
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.start,
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //
    //
    //
    //       getHeaderText(
    //         S.of(context).whatIsYourWeight,
    //       ),
    //       SizedBox(
    //         height: getScreenPercentSize(context, 0.5),
    //       ),
    //       getTextWidget(
    //           S.of(context).toGiveYouABetterExperienceNweNeedToKnow,
    //           Colors.black54,
    //           TextAlign.left,
    //           FontWeight.w300,
    //           getScreenPercentSize(context, 2)),
    //       SizedBox(
    //         height: getScreenPercentSize(context, 3),
    //       ),
    //
    //       Row(
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           Container(
    //             height: (height * 1.3),
    //             width: height,
    //             margin: EdgeInsets.symmetric(
    //                 horizontal: getScreenPercentSize(context, 1)),
    //             padding: EdgeInsets.symmetric(
    //                 vertical: getScreenPercentSize(context, 2.5)),
    //             child: Stack(
    //               children: [
    //                 Container(
    //                   width: (subHeight * 1.2),
    //                   height: subHeight,
    //                   margin: EdgeInsets.only(top: cellHeight / 2),
    //                   padding: EdgeInsets.only(
    //                       left: cellHeight / 2, bottom: cellHeight / 3),
    //                   decoration: BoxDecoration(
    //                     color: backgroundColor,
    //                     borderRadius: BorderRadius.all(
    //                       Radius.circular(getPercentSize(subHeight, 15)),
    //                     ),
    //                   ),
    //                   child: Row(
    //                     crossAxisAlignment: CrossAxisAlignment.end,
    //                     children: [
    //                       getTextWidget(
    //                           kg.toString(),
    //                           Colors.black,
    //                           TextAlign.end,
    //                           FontWeight.w300,
    //                           getPercentSize(subHeight, 25)),
    //                       getTextWidget(
    //                           S.of(context).kg,
    //                           primaryColor,
    //                           TextAlign.end,
    //                           FontWeight.w300,
    //                           getPercentSize(subHeight, 15)),
    //                     ],
    //                   ),
    //                 ),
    //                 Container(
    //                   width: cellHeight,
    //                   height: cellHeight,
    //                   margin: EdgeInsets.only(left: (cellHeight / 2)),
    //                   decoration: BoxDecoration(
    //                     color: primaryColor,
    //                     borderRadius: BorderRadius.all(
    //                       Radius.circular(getPercentSize(cellHeight, 30)),
    //                     ),
    //                   ),
    //                   child: Center(
    //                     child: Image.asset(
    //                       ConstantData.assetsPath + "dumbbell.png",
    //                       height: getPercentSize(cellHeight, 40),
    //                       color: Colors.white,
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //           Container(
    //             height: (height * 1.3),
    //             width: height,
    //             margin: EdgeInsets.symmetric(
    //                 horizontal: getScreenPercentSize(context, 1)),
    //             padding: EdgeInsets.symmetric(
    //                 vertical: getScreenPercentSize(context, 2.5)),
    //             child: Stack(
    //               children: [
    //                 Container(
    //                   width: (subHeight * 1.2),
    //                   height: subHeight,
    //                   margin: EdgeInsets.only(top: cellHeight / 2),
    //                   padding: EdgeInsets.only(
    //                       left: cellHeight / 2, bottom: cellHeight / 3),
    //                   decoration: BoxDecoration(
    //                     color: backgroundColor,
    //                     borderRadius: BorderRadius.all(
    //                       Radius.circular(getPercentSize(subHeight, 15)),
    //                     ),
    //                   ),
    //                   child: Row(
    //                     crossAxisAlignment: CrossAxisAlignment.end,
    //                     children: [
    //                       // Expanded(
    //                       //   child:
    //                       getTextWidget(
    //                           lbs.toInt().toString(),
    //                           Colors.black,
    //                           TextAlign.start,
    //                           FontWeight.w300,
    //                           getPercentSize(subHeight, 25)),
    //                       // ),
    //                       getTextWidget(
    //                           S.of(context).lbs,
    //                           primaryColor,
    //                           TextAlign.end,
    //                           FontWeight.w300,
    //                           getPercentSize(subHeight, 15)),
    //                     ],
    //                   ),
    //                 ),
    //                 Container(
    //                   width: cellHeight,
    //                   height: cellHeight,
    //                   margin: EdgeInsets.only(left: (cellHeight / 2)),
    //                   decoration: BoxDecoration(
    //                     color: primaryColor,
    //                     borderRadius: BorderRadius.all(
    //                       Radius.circular(getPercentSize(cellHeight, 30)),
    //                     ),
    //                   ),
    //                   child: Center(
    //                     child: Image.asset(
    //                       ConstantData.assetsPath + "weighing-scale.png",
    //                       height: getPercentSize(cellHeight, 40),
    //                       color: Colors.white,
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //
    //       Center(
    //         child: Container(
    //           width: getWidthPercentSize(context, 70),
    //           // decoration: BoxDecoration(
    //           //   color: ConstantData.cellColor,
    //           //   borderRadius: BorderRadius.all(
    //           //     Radius.circular(getScreenPercentSize(context,2)),
    //           //   ),
    //           // ),
    //
    //           padding: EdgeInsets.symmetric(
    //               vertical: getScreenPercentSize(context, 2.5)),
    //
    //           child: Align(
    //             alignment: Alignment.topCenter,
    //             child: NumberPicker(
    //               value: kg,
    //               minValue: 20,
    //               maxValue: 250,
    //               textStyle: TextStyle(
    //                   fontSize: getScreenPercentSize(context, 2),
    //                   color: Colors.black,
    //                   fontFamily: ConstantData.fontFamily),
    //               selectedTextStyle: TextStyle(
    //                   fontSize: getScreenPercentSize(context, 5),
    //                   color: primaryColor,
    //                   fontFamily: ConstantData.fontFamily),
    //               step: 1,
    //               haptics: true,
    //               onChanged: (value) => setState(() {
    //                 kg = value;
    //                 setLbsValue();
    //               }),
    //             ),
    //           ),
    //         ),
    //       ),
    //
    //       // NumberPicker(
    //       //   value: 2,
    //       //   minValue: 80,
    //       //   maxValue: 350,
    //       //   step: 10,
    //       //   haptics: true,
    //       //   onChanged: (value) => setState(() {
    //       //
    //       //   }),
    //       // ),
    //     ],
    //   ),
    // );
    return StatefulBuilder(
      builder: (context, setState) => Container(
        margin: EdgeInsets.all(margin!),
        child: Stack(
          children: [
            getHeaderText(
              "What's your goal\nweight?",
            ),

            Container(
              margin: EdgeInsets.only(bottom: getScreenPercentSize(context, 5)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: (margin!)),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IntrinsicWidth(
                            child: getTextField(new TextEditingController(
                                text: (isKg) ? kg.toString() : lbs.toString())),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          getTextWidget(
                              (isKg) ? "Kg" : "lb",
                              subTextColor,
                              TextAlign.end,
                              FontWeight.w600,
                              getScreenPercentSize(context, 2)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getScreenPercentSize(context, 0.5),
                  ),
                  getWeightTabWidget(setState)
                ],
              ),
            )

            // getTextWidget(
            //     S.of(context).howTallAreYou,
            //     Colors.black,
            //     TextAlign.left,
            //     FontWeight.bold,
            //     getScreenPercentSize(context, 4.2)),
            // SizedBox(
            //   height: getScreenPercentSize(context, 0.5),
            // ),
            // getTextWidget(
            //     S.of(context).toGiveYouABetterExperienceNweNeedToKnowHeight,
            //     Colors.black54,
            //     TextAlign.left,
            //     FontWeight.w300,
            //     getScreenPercentSize(context, 2)),
            // SizedBox(
            //   height: getScreenPercentSize(context, 3),
            // ),
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Container(
            //       height: (height * 1.3),
            //       width: height,
            //       margin: EdgeInsets.symmetric(
            //           horizontal:
            //               getScreenPercentSize(context, 1)),
            //       padding: EdgeInsets.symmetric(
            //           vertical:
            //               getScreenPercentSize(context, 2.5)),
            //       child: Stack(
            //         children: [
            //           Container(
            //             width: (subHeight * 1.2),
            //             height: subHeight,
            //             margin: EdgeInsets.only(top: cellHeight / 2),
            //             padding: EdgeInsets.only(
            //                 left: cellHeight / 2, bottom: cellHeight / 3),
            //             decoration: BoxDecoration(
            //               color: backgroundColor,
            //               borderRadius: BorderRadius.all(
            //                 Radius.circular(
            //                     getPercentSize(subHeight, 15)),
            //               ),
            //             ),
            //             child: Row(
            //               crossAxisAlignment: CrossAxisAlignment.end,
            //               children: [
            //                 getTextWidget(
            //                     cm.toString(),
            //                     Colors.black,
            //                     TextAlign.end,
            //                     FontWeight.w300,
            //                     getPercentSize(subHeight, 25)),
            //                 getTextWidget(
            //                     S.of(context).cm,
            //                     primaryColor,
            //                     TextAlign.end,
            //                     FontWeight.w300,
            //                     getPercentSize(subHeight, 15)),
            //               ],
            //             ),
            //           ),
            //           Container(
            //             width: cellHeight,
            //             height: cellHeight,
            //             margin: EdgeInsets.only(left: (cellHeight / 2)),
            //             decoration: BoxDecoration(
            //               color: primaryColor,
            //               borderRadius: BorderRadius.all(
            //                 Radius.circular(
            //                     getPercentSize(cellHeight, 30)),
            //               ),
            //             ),
            //             child: Center(
            //               child: Image.asset(
            //                 ConstantData.assetsPath + "height.png",
            //                 height: getPercentSize(cellHeight, 40),
            //                 color: Colors.white,
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //     Container(
            //       height: (height * 1.3),
            //       width: height,
            //       margin: EdgeInsets.symmetric(
            //           horizontal:
            //               getScreenPercentSize(context, 1)),
            //       padding: EdgeInsets.symmetric(
            //           vertical:
            //               getScreenPercentSize(context, 2.5)),
            //       child: Stack(
            //         children: [
            //           Container(
            //             width: (subHeight * 1.2),
            //             height: subHeight,
            //             margin: EdgeInsets.only(top: cellHeight / 2),
            //             padding: EdgeInsets.only(
            //                 left: cellHeight / 2, bottom: cellHeight / 3),
            //             decoration: BoxDecoration(
            //               color: backgroundColor,
            //               borderRadius: BorderRadius.all(
            //                 Radius.circular(
            //                     getPercentSize(subHeight, 15)),
            //               ),
            //             ),
            //             child: Row(
            //               crossAxisAlignment: CrossAxisAlignment.end,
            //               children: [
            //                 // Expanded(
            //                 //   child:
            //                 getTextWidget(
            //                     ft.toString(),
            //                     Colors.black,
            //                     TextAlign.start,
            //                     FontWeight.w300,
            //                     getPercentSize(subHeight, 20)),
            //                 // ),
            //                 getTextWidget(
            //                     S.of(context).ft,
            //                     primaryColor,
            //                     TextAlign.end,
            //                     FontWeight.w300,
            //                     getPercentSize(subHeight, 15)),
            //
            //
            //                 SizedBox(width: getPercentSize(subHeight, 5),),
            //                 getTextWidget(
            //                     inch.toString(),
            //                     Colors.black,
            //                     TextAlign.start,
            //                     FontWeight.w300,
            //                     getPercentSize(subHeight, 20)),
            //                 // ),
            //                 getTextWidget(
            //                     S.of(context).inches,
            //                     primaryColor,
            //                     TextAlign.end,
            //                     FontWeight.w300,
            //                     getPercentSize(subHeight, 15)),
            //               ],
            //             ),
            //           ),
            //           Container(
            //             width: cellHeight,
            //             height: cellHeight,
            //             margin: EdgeInsets.only(left: (cellHeight / 2)),
            //             decoration: BoxDecoration(
            //               color: primaryColor,
            //               borderRadius: BorderRadius.all(
            //                 Radius.circular(
            //                     getPercentSize(cellHeight, 30)),
            //               ),
            //             ),
            //             child: Center(
            //               child: Image.asset(
            //                 ConstantData.assetsPath+ "ft.png",
            //                 height: getPercentSize(cellHeight, 40),
            //                 color: Colors.white,
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
            // Center(
            //   child: Container(
            //     width: getWidthPercentSize(context, 70),
            //
            //     padding: EdgeInsets.symmetric(
            //         vertical: getScreenPercentSize(context, 2.5)),
            //
            //     child: Align(
            //       alignment: Alignment.topCenter,
            //       child: NumberPicker(
            //         value: cm,
            //         minValue: 80,
            //         maxValue: 350,
            //         textStyle: TextStyle(
            //             fontSize: getScreenPercentSize(context, 2),
            //             color: Colors.black,
            //             fontFamily: ConstantData.fontFamily
            //         ),
            //         selectedTextStyle: TextStyle(
            //             fontSize: getScreenPercentSize(context, 5),
            //             color: primaryColor,
            //             fontFamily: ConstantData.fontFamily),
            //         step: 1,
            //         haptics: true,
            //         onChanged: (value) => setState(() {
            //           cm = value;
            //           setLbsValue();
            //         }),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget weightWidget() {
    // return Container(
    //   color: cellColor,
    //   margin: EdgeInsets.all(margin!),
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.start,
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //
    //
    //
    //       getHeaderText(
    //         S.of(context).whatIsYourWeight,
    //       ),
    //       SizedBox(
    //         height: getScreenPercentSize(context, 0.5),
    //       ),
    //       getTextWidget(
    //           S.of(context).toGiveYouABetterExperienceNweNeedToKnow,
    //           Colors.black54,
    //           TextAlign.left,
    //           FontWeight.w300,
    //           getScreenPercentSize(context, 2)),
    //       SizedBox(
    //         height: getScreenPercentSize(context, 3),
    //       ),
    //
    //       Row(
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           Container(
    //             height: (height * 1.3),
    //             width: height,
    //             margin: EdgeInsets.symmetric(
    //                 horizontal: getScreenPercentSize(context, 1)),
    //             padding: EdgeInsets.symmetric(
    //                 vertical: getScreenPercentSize(context, 2.5)),
    //             child: Stack(
    //               children: [
    //                 Container(
    //                   width: (subHeight * 1.2),
    //                   height: subHeight,
    //                   margin: EdgeInsets.only(top: cellHeight / 2),
    //                   padding: EdgeInsets.only(
    //                       left: cellHeight / 2, bottom: cellHeight / 3),
    //                   decoration: BoxDecoration(
    //                     color: backgroundColor,
    //                     borderRadius: BorderRadius.all(
    //                       Radius.circular(getPercentSize(subHeight, 15)),
    //                     ),
    //                   ),
    //                   child: Row(
    //                     crossAxisAlignment: CrossAxisAlignment.end,
    //                     children: [
    //                       getTextWidget(
    //                           kg.toString(),
    //                           Colors.black,
    //                           TextAlign.end,
    //                           FontWeight.w300,
    //                           getPercentSize(subHeight, 25)),
    //                       getTextWidget(
    //                           S.of(context).kg,
    //                           primaryColor,
    //                           TextAlign.end,
    //                           FontWeight.w300,
    //                           getPercentSize(subHeight, 15)),
    //                     ],
    //                   ),
    //                 ),
    //                 Container(
    //                   width: cellHeight,
    //                   height: cellHeight,
    //                   margin: EdgeInsets.only(left: (cellHeight / 2)),
    //                   decoration: BoxDecoration(
    //                     color: primaryColor,
    //                     borderRadius: BorderRadius.all(
    //                       Radius.circular(getPercentSize(cellHeight, 30)),
    //                     ),
    //                   ),
    //                   child: Center(
    //                     child: Image.asset(
    //                       ConstantData.assetsPath + "dumbbell.png",
    //                       height: getPercentSize(cellHeight, 40),
    //                       color: Colors.white,
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //           Container(
    //             height: (height * 1.3),
    //             width: height,
    //             margin: EdgeInsets.symmetric(
    //                 horizontal: getScreenPercentSize(context, 1)),
    //             padding: EdgeInsets.symmetric(
    //                 vertical: getScreenPercentSize(context, 2.5)),
    //             child: Stack(
    //               children: [
    //                 Container(
    //                   width: (subHeight * 1.2),
    //                   height: subHeight,
    //                   margin: EdgeInsets.only(top: cellHeight / 2),
    //                   padding: EdgeInsets.only(
    //                       left: cellHeight / 2, bottom: cellHeight / 3),
    //                   decoration: BoxDecoration(
    //                     color: backgroundColor,
    //                     borderRadius: BorderRadius.all(
    //                       Radius.circular(getPercentSize(subHeight, 15)),
    //                     ),
    //                   ),
    //                   child: Row(
    //                     crossAxisAlignment: CrossAxisAlignment.end,
    //                     children: [
    //                       // Expanded(
    //                       //   child:
    //                       getTextWidget(
    //                           lbs.toInt().toString(),
    //                           Colors.black,
    //                           TextAlign.start,
    //                           FontWeight.w300,
    //                           getPercentSize(subHeight, 25)),
    //                       // ),
    //                       getTextWidget(
    //                           S.of(context).lbs,
    //                           primaryColor,
    //                           TextAlign.end,
    //                           FontWeight.w300,
    //                           getPercentSize(subHeight, 15)),
    //                     ],
    //                   ),
    //                 ),
    //                 Container(
    //                   width: cellHeight,
    //                   height: cellHeight,
    //                   margin: EdgeInsets.only(left: (cellHeight / 2)),
    //                   decoration: BoxDecoration(
    //                     color: primaryColor,
    //                     borderRadius: BorderRadius.all(
    //                       Radius.circular(getPercentSize(cellHeight, 30)),
    //                     ),
    //                   ),
    //                   child: Center(
    //                     child: Image.asset(
    //                       ConstantData.assetsPath + "weighing-scale.png",
    //                       height: getPercentSize(cellHeight, 40),
    //                       color: Colors.white,
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //
    //       Center(
    //         child: Container(
    //           width: getWidthPercentSize(context, 70),
    //           // decoration: BoxDecoration(
    //           //   color: ConstantData.cellColor,
    //           //   borderRadius: BorderRadius.all(
    //           //     Radius.circular(getScreenPercentSize(context,2)),
    //           //   ),
    //           // ),
    //
    //           padding: EdgeInsets.symmetric(
    //               vertical: getScreenPercentSize(context, 2.5)),
    //
    //           child: Align(
    //             alignment: Alignment.topCenter,
    //             child: NumberPicker(
    //               value: kg,
    //               minValue: 20,
    //               maxValue: 250,
    //               textStyle: TextStyle(
    //                   fontSize: getScreenPercentSize(context, 2),
    //                   color: Colors.black,
    //                   fontFamily: ConstantData.fontFamily),
    //               selectedTextStyle: TextStyle(
    //                   fontSize: getScreenPercentSize(context, 5),
    //                   color: primaryColor,
    //                   fontFamily: ConstantData.fontFamily),
    //               step: 1,
    //               haptics: true,
    //               onChanged: (value) => setState(() {
    //                 kg = value;
    //                 setLbsValue();
    //               }),
    //             ),
    //           ),
    //         ),
    //       ),
    //
    //       // NumberPicker(
    //       //   value: 2,
    //       //   minValue: 80,
    //       //   maxValue: 350,
    //       //   step: 10,
    //       //   haptics: true,
    //       //   onChanged: (value) => setState(() {
    //       //
    //       //   }),
    //       // ),
    //     ],
    //   ),
    // );
    return StatefulBuilder(
      builder: (context, setState) => Container(
        margin: EdgeInsets.all(margin!),
        child: Stack(
          children: [
            getHeaderText(
              "What's your current\nweight?",
            ),

            Container(
              margin: EdgeInsets.only(bottom: getScreenPercentSize(context, 5)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: (margin!)),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IntrinsicWidth(
                            child: getTextField(new TextEditingController(
                                text: (isKg) ? kg.toString() : lbs.toString())),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          getTextWidget(
                              (isKg) ? "Kg" : "lb",
                              subTextColor,
                              TextAlign.end,
                              FontWeight.w600,
                              getScreenPercentSize(context, 2)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getScreenPercentSize(context, 0.5),
                  ),
                  getWeightTabWidget(setState)
                ],
              ),
            )

            // getTextWidget(
            //     S.of(context).howTallAreYou,
            //     Colors.black,
            //     TextAlign.left,
            //     FontWeight.bold,
            //     getScreenPercentSize(context, 4.2)),
            // SizedBox(
            //   height: getScreenPercentSize(context, 0.5),
            // ),
            // getTextWidget(
            //     S.of(context).toGiveYouABetterExperienceNweNeedToKnowHeight,
            //     Colors.black54,
            //     TextAlign.left,
            //     FontWeight.w300,
            //     getScreenPercentSize(context, 2)),
            // SizedBox(
            //   height: getScreenPercentSize(context, 3),
            // ),
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Container(
            //       height: (height * 1.3),
            //       width: height,
            //       margin: EdgeInsets.symmetric(
            //           horizontal:
            //               getScreenPercentSize(context, 1)),
            //       padding: EdgeInsets.symmetric(
            //           vertical:
            //               getScreenPercentSize(context, 2.5)),
            //       child: Stack(
            //         children: [
            //           Container(
            //             width: (subHeight * 1.2),
            //             height: subHeight,
            //             margin: EdgeInsets.only(top: cellHeight / 2),
            //             padding: EdgeInsets.only(
            //                 left: cellHeight / 2, bottom: cellHeight / 3),
            //             decoration: BoxDecoration(
            //               color: backgroundColor,
            //               borderRadius: BorderRadius.all(
            //                 Radius.circular(
            //                     getPercentSize(subHeight, 15)),
            //               ),
            //             ),
            //             child: Row(
            //               crossAxisAlignment: CrossAxisAlignment.end,
            //               children: [
            //                 getTextWidget(
            //                     cm.toString(),
            //                     Colors.black,
            //                     TextAlign.end,
            //                     FontWeight.w300,
            //                     getPercentSize(subHeight, 25)),
            //                 getTextWidget(
            //                     S.of(context).cm,
            //                     primaryColor,
            //                     TextAlign.end,
            //                     FontWeight.w300,
            //                     getPercentSize(subHeight, 15)),
            //               ],
            //             ),
            //           ),
            //           Container(
            //             width: cellHeight,
            //             height: cellHeight,
            //             margin: EdgeInsets.only(left: (cellHeight / 2)),
            //             decoration: BoxDecoration(
            //               color: primaryColor,
            //               borderRadius: BorderRadius.all(
            //                 Radius.circular(
            //                     getPercentSize(cellHeight, 30)),
            //               ),
            //             ),
            //             child: Center(
            //               child: Image.asset(
            //                 ConstantData.assetsPath + "height.png",
            //                 height: getPercentSize(cellHeight, 40),
            //                 color: Colors.white,
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //     Container(
            //       height: (height * 1.3),
            //       width: height,
            //       margin: EdgeInsets.symmetric(
            //           horizontal:
            //               getScreenPercentSize(context, 1)),
            //       padding: EdgeInsets.symmetric(
            //           vertical:
            //               getScreenPercentSize(context, 2.5)),
            //       child: Stack(
            //         children: [
            //           Container(
            //             width: (subHeight * 1.2),
            //             height: subHeight,
            //             margin: EdgeInsets.only(top: cellHeight / 2),
            //             padding: EdgeInsets.only(
            //                 left: cellHeight / 2, bottom: cellHeight / 3),
            //             decoration: BoxDecoration(
            //               color: backgroundColor,
            //               borderRadius: BorderRadius.all(
            //                 Radius.circular(
            //                     getPercentSize(subHeight, 15)),
            //               ),
            //             ),
            //             child: Row(
            //               crossAxisAlignment: CrossAxisAlignment.end,
            //               children: [
            //                 // Expanded(
            //                 //   child:
            //                 getTextWidget(
            //                     ft.toString(),
            //                     Colors.black,
            //                     TextAlign.start,
            //                     FontWeight.w300,
            //                     getPercentSize(subHeight, 20)),
            //                 // ),
            //                 getTextWidget(
            //                     S.of(context).ft,
            //                     primaryColor,
            //                     TextAlign.end,
            //                     FontWeight.w300,
            //                     getPercentSize(subHeight, 15)),
            //
            //
            //                 SizedBox(width: getPercentSize(subHeight, 5),),
            //                 getTextWidget(
            //                     inch.toString(),
            //                     Colors.black,
            //                     TextAlign.start,
            //                     FontWeight.w300,
            //                     getPercentSize(subHeight, 20)),
            //                 // ),
            //                 getTextWidget(
            //                     S.of(context).inches,
            //                     primaryColor,
            //                     TextAlign.end,
            //                     FontWeight.w300,
            //                     getPercentSize(subHeight, 15)),
            //               ],
            //             ),
            //           ),
            //           Container(
            //             width: cellHeight,
            //             height: cellHeight,
            //             margin: EdgeInsets.only(left: (cellHeight / 2)),
            //             decoration: BoxDecoration(
            //               color: primaryColor,
            //               borderRadius: BorderRadius.all(
            //                 Radius.circular(
            //                     getPercentSize(cellHeight, 30)),
            //               ),
            //             ),
            //             child: Center(
            //               child: Image.asset(
            //                 ConstantData.assetsPath+ "ft.png",
            //                 height: getPercentSize(cellHeight, 40),
            //                 color: Colors.white,
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
            // Center(
            //   child: Container(
            //     width: getWidthPercentSize(context, 70),
            //
            //     padding: EdgeInsets.symmetric(
            //         vertical: getScreenPercentSize(context, 2.5)),
            //
            //     child: Align(
            //       alignment: Alignment.topCenter,
            //       child: NumberPicker(
            //         value: cm,
            //         minValue: 80,
            //         maxValue: 350,
            //         textStyle: TextStyle(
            //             fontSize: getScreenPercentSize(context, 2),
            //             color: Colors.black,
            //             fontFamily: ConstantData.fontFamily
            //         ),
            //         selectedTextStyle: TextStyle(
            //             fontSize: getScreenPercentSize(context, 5),
            //             color: primaryColor,
            //             fontFamily: ConstantData.fontFamily),
            //         step: 1,
            //         haptics: true,
            //         onChanged: (value) => setState(() {
            //           cm = value;
            //           setLbsValue();
            //         }),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  getHeaderText(String s) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding:
            EdgeInsets.symmetric(vertical: getScreenPercentSize(context, 4)),
        child: getTextWidget(s, textColor, TextAlign.center, FontWeight.bold,
            getScreenPercentSize(context, 3)),
      ),
    );
  }

  Widget firstWidget() {
    return Container(
      color: cellColor,
      margin: EdgeInsets.all(margin!),
      child: Stack(
        children: [
          getHeaderText("Tell us about yourself!"),

          // Align(
          //   alignment: Alignment.topCenter,
          //   child: Padding(
          //     padding:  EdgeInsets.symmetric(vertical:
          //     getScreenPercentSize(context, 4)),
          //     child: getTextWidget(
          //         "Tell us about yourself!",
          //         Colors.black,
          //         TextAlign.left,
          //         FontWeight.bold,
          //         getScreenPercentSize(context, 3)),
          //   ),
          // ),

          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [getMaleCell(), getFemaleCell()],
            ),
          )
        ],
      ),
    );
  }

  getMaleCell() {
    double width = getWidthPercentSize(context, 35);
    double height = getWidthPercentSize(context, 40);
    // double height = getWidthPercentSize(context, 50);

    double radius = getPercentSize(height, 4);
    double subImage = getPercentSize(height, 60);
    return InkWell(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: height,
            width: width,
            margin: EdgeInsets.all(getScreenPercentSize(context, 1.5)),
            decoration: BoxDecoration(
              color: (isMale) ? primaryColor : cellColor,
              border: Border.all(
                  color: (isMale)
                      ? Colors.transparent
                      : subTextColor.withOpacity(0.1),
                  width: 1),
              borderRadius: BorderRadius.all(
                Radius.circular(radius),
              ),
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                ConstantData.assetsPath + "male.png",
                height: subImage,
              ),
            ),
            // child: Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     // Container(
            //     //   height: size,
            //     //   width: size,
            //     //   margin: EdgeInsets.only(
            //     //       bottom: getPercentSize(height, 5)),
            //     //   decoration: BoxDecoration(
            //     //       color: primaryColor, shape: BoxShape.circle),
            //     //   child: Center(
            //     //     child: Image.asset(
            //     //       ConstantData.assetsPath + "male.png",
            //     //       height: subImage,
            //     //     ),
            //     //   ),
            //     // ),
            //
            //
            //     Image.asset(
            //       ConstantData.assetsPath + "male.png",
            //       height: subImage,
            //     ),
            //
            //   ],
            // ),
          ),
          getTextWidget(
              S.of(context).male,
              (isMale) ? primaryColor : subTextColor,
              TextAlign.left,
              FontWeight.bold,
              getScreenPercentSize(context, 2.5)),
        ],
      ),
      onTap: () {
        isMale = true;

        setState(() {});
      },
    );
  }

  getFemaleCell() {
    // double width = getWidthPercentSize(context, 40);
    // double height = getWidthPercentSize(context, 50);
    //
    // double radius = getPercentSize(height, 4);
    // double size = getPercentSize(height, 40);
    // double subImage = getPercentSize(size, 60);

    double width = getWidthPercentSize(context, 35);
    double height = getWidthPercentSize(context, 40);
    // double height = getWidthPercentSize(context, 50);

    double radius = getPercentSize(height, 4);
    double subImage = getPercentSize(height, 60);

    return InkWell(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: height,
            width: width,
            margin: EdgeInsets.all(getScreenPercentSize(context, 1.5)),
            decoration: BoxDecoration(
              color: (!isMale) ? primaryColor : cellColor,
              border: Border.all(
                  color: (!isMale)
                      ? Colors.transparent
                      : subTextColor.withOpacity(0.1),
                  width: 2),
              borderRadius: BorderRadius.all(
                Radius.circular(radius),
              ),
            ),
            // child: Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     Container(
            //       height: size,
            //       width: size,
            //       margin: EdgeInsets.only(
            //           bottom: getPercentSize(height, 5)),
            //       decoration: BoxDecoration(
            //           color: primaryColor, shape: BoxShape.circle),
            //       child: Center(
            //         child: Image.asset(
            //           ConstantData.assetsPath + "female.png",
            //           height: subImage,
            //         ),
            //       ),
            //     ),
            //     getTextWidget(
            //         S.of(context).female,
            //         Colors.black,
            //         TextAlign.left,
            //         FontWeight.w300,
            //         getScreenPercentSize(context, 2.5)),
            //   ],
            // ),

            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                ConstantData.assetsPath + "female.png",
                height: subImage,
              ),
            ),
          ),
          getTextWidget(
              S.of(context).female,
              (!isMale) ? primaryColor : subTextColor,
              TextAlign.left,
              FontWeight.bold,
              getScreenPercentSize(context, 2.5)),
        ],
      ),
      onTap: () {
        isMale = false;

        setState(() {});
      },
    );
  }
}

// https://cdn.dribbble.com/users/1246317/screenshots/5393591/bmi-calculator_4x.png?compress=1&resize=400x300
