import 'package:flutter/material.dart';
import 'package:flutter_diet_tips/util/ConstantData.dart';
import 'package:flutter_diet_tips/util/ConstantWidget.dart';
import 'package:flutter_diet_tips/util/DataFile.dart';
import 'package:flutter_diet_tips/util/SizeConfig.dart';

import 'generated/l10n.dart';
import 'model/DietModel.dart';

class ManageDiet extends StatefulWidget {
  @override
  _ManageDiet createState() {
    return _ManageDiet();
  }
}

class _ManageDiet extends State<ManageDiet> {
  List<DietModel> motivateList = DataFile.getMotivateList();
  List<DietModel> dietList = DataFile.getDietList();
  List<DietModel> mealList = DataFile.getMealList();
  List<String> itemList = ["Chicken", "Wheat", "Peanut", "Soy", "Eggs"];

  List<DietModel> variedList = DataFile.getVariedList();

  String motiveText = "";

  int motivePosition = 0;
  int mealsPosition = 0;
  int currentDietPosition = 0;
  int eatPosition = 0;
  int variedPosition = 0;

  String mealsText = "";
  String currentDietText = "";
  String eatText = "";
  String variedText = "";
  double margin = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

     setData();
  }

  void setData(){
    setState(() {
      motiveText = motivateList[motivePosition].title!;
      currentDietText = dietList[currentDietPosition].title!;
      mealsText = mealList[mealsPosition].title!;
      eatText = itemList[eatPosition];
      variedText = variedList[variedPosition].title!;
    });
  }
  void onBackPress() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    margin = getScreenPercentSize(context, 1.5);
    double leftMargin = getScreenPercentSize(context, 3);

    Widget space = SizedBox(
      height: (leftMargin / 2),
    );

    Widget wholeSpace = SizedBox(
      height: (leftMargin / 2) + (leftMargin / 2),
    );

    return WillPopScope(
      onWillPop: () async {
        onBackPress();

        return true;
      },
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title:
              getPrimaryAppBarText(context, S.of(context).manageDietPreference),
          backgroundColor: primaryColor,
          centerTitle: true,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: getPrimaryAppBarIcon(),
                onPressed: () {
                  onBackPress();
                },
              );
            },
          ),
        ),
        body: Container(
          child: ListView(
            padding: EdgeInsets.all(margin),
            children: [
              space,
              getTitle("What motives you the most?"),
              space,
              getCell(motiveText, () {
                showMotiveDialog();
              }),
              wholeSpace,
              getTitle("Are you currently following a diet?"),
              space,
              getCell(currentDietText, () {
                showCurrentDietDialog();
              }),
              wholeSpace,
              getTitle("Which meals do you usually have?"),
              space,
              getCell(mealsText, () {
                showMealsDialog();
              }),
              wholeSpace,
              getTitle("Select items that you don't eat!"),
              space,
              getCell(eatText, () {
                showEatItemDialog();
              }),
              wholeSpace,
              getTitle("How varied do you want your diet to be?"),
              space,
              getCell(variedText, () {
                showVariedDialog();
              }),
              wholeSpace
            ],
          ),
        ),
      ),
    );
  }

  void showMotiveDialog() {
    int selectIndex = motivePosition;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            backgroundColor: cellColor,
            child: StatefulBuilder(
              builder: (context, setState) {
                return Container(
                  padding: EdgeInsets.only(bottom: 15, left: 15, right: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        height: 7,
                      ),
                      ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            bool isSelect = (index == selectIndex);
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  selectIndex = index;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: (margin / 2)),
                                padding:
                                    EdgeInsets.symmetric(vertical: (margin)),
                                child: Row(
                                  children: [
                                    // SizedBox(
                                    //   width: margin,
                                    // ),

                                    Expanded(
                                      child: getTextWidget(
                                          motivateList[index].title!,
                                          textColor,
                                          TextAlign.start,
                                          FontWeight.bold,
                                          getScreenPercentSize(context, 1.8)),
                                    ),

                                    Icon(
                                      (isSelect)
                                          ? Icons.check_circle
                                          : Icons.circle,
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
                          separatorBuilder: (context, index) {
                            return Container(
                              color: subTextColor.withOpacity(0.1),
                              height: 0.5,
                            );
                          },
                          itemCount: motivateList.length),
                      SizedBox(
                        height: 7,
                      ),
                      new TextButton(
                          child: Text(
                            "Done",
                            style: TextStyle(
                                fontFamily: ConstantData.fontFamily,
                                fontSize: getScreenPercentSize(context, 2),
                                color: primaryColor,
                                fontWeight: FontWeight.normal),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            setState(() {



                              motivePosition = selectIndex;

                              print("motivePosition---$selectIndex");

                              setData();
                            });
                          }),
                    ],
                  ),
                );
              },
            ),
          );
        });
  }
  void showCurrentDietDialog() {
    int selectIndex = currentDietPosition;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            backgroundColor: cellColor,
            child: StatefulBuilder(
              builder: (context, setState) {
                return Container(
                  padding: EdgeInsets.only(bottom: 15, left: 15, right: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        height: 7,
                      ),
                      ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            bool isSelect = (index == selectIndex);
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  selectIndex = index;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: (margin / 2)),
                                padding:
                                    EdgeInsets.symmetric(vertical: (margin)),
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
                                      (isSelect)
                                          ? Icons.check_circle
                                          : Icons.circle,
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
                          separatorBuilder: (context, index) {
                            return Container(
                              color: subTextColor.withOpacity(0.1),
                              height: 0.5,
                            );
                          },
                          itemCount: dietList.length),
                      SizedBox(
                        height: 7,
                      ),
                      new TextButton(
                          child: Text(
                            "Done",
                            style: TextStyle(
                                fontFamily: ConstantData.fontFamily,
                                fontSize: getScreenPercentSize(context, 2),
                                color: primaryColor,
                                fontWeight: FontWeight.normal),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            setState(() {



                              currentDietPosition = selectIndex;

                              print("motivePosition---$selectIndex");

                              setData();
                            });
                          }),
                    ],
                  ),
                );
              },
            ),
          );
        });
  }
  void showMealsDialog() {
    int selectIndex = mealsPosition;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            backgroundColor: cellColor,
            child: StatefulBuilder(
              builder: (context, setState) {
                return Container(
                  padding: EdgeInsets.only(bottom: 15, left: 15, right: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        height: 7,
                      ),
                      ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            bool isSelect = (index == selectIndex);
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  selectIndex = index;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: (margin / 2)),
                                padding:
                                    EdgeInsets.symmetric(vertical: (margin)),
                                child: Row(
                                  children: [
                                    // SizedBox(
                                    //   width: margin,
                                    // ),

                                    Expanded(
                                      child: getTextWidget(
                                          mealList[index].title!,
                                          textColor,
                                          TextAlign.start,
                                          FontWeight.bold,
                                          getScreenPercentSize(context, 1.8)),
                                    ),

                                    Icon(
                                      (isSelect)
                                          ? Icons.check_circle
                                          : Icons.circle,
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
                          separatorBuilder: (context, index) {
                            return Container(
                              color: subTextColor.withOpacity(0.1),
                              height: 0.5,
                            );
                          },
                          itemCount: mealList.length),
                      SizedBox(
                        height: 7,
                      ),
                      new TextButton(
                          child: Text(
                            "Done",
                            style: TextStyle(
                                fontFamily: ConstantData.fontFamily,
                                fontSize: getScreenPercentSize(context, 2),
                                color: primaryColor,
                                fontWeight: FontWeight.normal),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            setState(() {



                              mealsPosition = selectIndex;

                              print("motivePosition---$selectIndex");

                              setData();
                            });
                          }),
                    ],
                  ),
                );
              },
            ),
          );
        });
  }
  void showEatItemDialog() {
    int selectIndex = eatPosition;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            backgroundColor: cellColor,
            child: StatefulBuilder(
              builder: (context, setState) {
                return Container(
                  padding: EdgeInsets.only(bottom: 15, left: 15, right: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        height: 7,
                      ),
                      ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            bool isSelect = (index == selectIndex);
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  selectIndex = index;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: (margin / 2)),
                                padding:
                                    EdgeInsets.symmetric(vertical: (margin)),
                                child: Row(
                                  children: [
                                    // SizedBox(
                                    //   width: margin,
                                    // ),

                                    Expanded(
                                      child: getTextWidget(
                                          itemList[index],
                                          textColor,
                                          TextAlign.start,
                                          FontWeight.bold,
                                          getScreenPercentSize(context, 1.8)),
                                    ),

                                    Icon(
                                      (isSelect)
                                          ? Icons.check_circle
                                          : Icons.circle,
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
                          separatorBuilder: (context, index) {
                            return Container(
                              color: subTextColor.withOpacity(0.1),
                              height: 0.5,
                            );
                          },
                          itemCount: itemList.length),
                      SizedBox(
                        height: 7,
                      ),
                      new TextButton(
                          child: Text(
                            "Done",
                            style: TextStyle(
                                fontFamily: ConstantData.fontFamily,
                                fontSize: getScreenPercentSize(context, 2),
                                color: primaryColor,
                                fontWeight: FontWeight.normal),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            setState(() {



                              eatPosition = selectIndex;

                              print("motivePosition---$selectIndex");

                              setData();
                            });
                          }),
                    ],
                  ),
                );
              },
            ),
          );
        });
  }
  void showVariedDialog() {
    int selectIndex = variedPosition;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            backgroundColor: cellColor,
            child: StatefulBuilder(
              builder: (context, setState) {
                return Container(
                  padding: EdgeInsets.only(bottom: 15, left: 15, right: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        height: 7,
                      ),
                      ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            bool isSelect = (index == selectIndex);
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  selectIndex = index;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: (margin / 2)),
                                padding:
                                    EdgeInsets.symmetric(vertical: (margin)),
                                child: Row(
                                  children: [
                                    // SizedBox(
                                    //   width: margin,
                                    // ),

                                    Expanded(
                                      child: getTextWidget(
                                          variedList[index].title!,
                                          textColor,
                                          TextAlign.start,
                                          FontWeight.bold,
                                          getScreenPercentSize(context, 1.8)),
                                    ),

                                    Icon(
                                      (isSelect)
                                          ? Icons.check_circle
                                          : Icons.circle,
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
                          separatorBuilder: (context, index) {
                            return Container(
                              color: subTextColor.withOpacity(0.1),
                              height: 0.5,
                            );
                          },
                          itemCount: variedList.length),
                      SizedBox(
                        height: 7,
                      ),
                      new TextButton(
                          child: Text(
                            "Done",
                            style: TextStyle(
                                fontFamily: ConstantData.fontFamily,
                                fontSize: getScreenPercentSize(context, 2),
                                color: primaryColor,
                                fontWeight: FontWeight.normal),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            setState(() {



                              variedPosition = selectIndex;

                              print("motivePosition---$selectIndex");

                              setData();
                            });
                          }),
                    ],
                  ),
                );
              },
            ),
          );
        });
  }

  getCell(String s, Function function) {
    double radius = getScreenPercentSize(context, 1.2);
    double fontSize = getScreenPercentSize(context, 2);

    return InkWell(
      onTap: () {
        function();
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: getWidthPercentSize(context, 2.5),
            vertical: getScreenPercentSize(context, 1.5)),
        decoration: BoxDecoration(
          color: cellColor,
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
          boxShadow: [
            BoxShadow(
              color: textColor.withOpacity(0.1),
              blurRadius: 2.0,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: getTextWidget(
                  s, textColor, TextAlign.start, FontWeight.w400, fontSize),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              color: textColor,
              size: getScreenPercentSize(context, 3),
            )
          ],
        ),
      ),
    );
  }

  getTitle(String s) {
    return getTextWidget(s, textColor, TextAlign.start, FontWeight.w600,
        getScreenPercentSize(context, 2));
  }
}
