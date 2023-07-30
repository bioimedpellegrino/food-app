import 'package:flutter/material.dart';
import 'package:flutter_diet_tips/util/ConstantData.dart';
import 'package:flutter_diet_tips/util/ConstantWidget.dart';
import 'package:flutter_diet_tips/util/SizeConfig.dart';

import 'generated/l10n.dart';

class ReminderPage extends StatefulWidget {
  // final ValueChanged<int> valueChanged;
  //
  // ReminderPage(this.valueChanged);

  @override
  _ReminderPage createState() {
    return _ReminderPage();
  }
}

class _ReminderPage extends State<ReminderPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      // DateTime now = DateTime;
      // now.hour = 7;
      // now.minute = 0;
      // breakfastTime = DateFormat('hh:mm a').format(now);
      breakfastTime = "07:00 AM";
      lunchTime = "12:00 PM";
      dinnerTime = "08:00 PM";
    });
  }

  String? breakfastTime = "";
  String? lunchTime;
  String? dinnerTime;

  void onBackPress() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return WillPopScope(
      onWillPop: () async {
        // widget.valueChanged(0);
        onBackPress();

        return true;
      },
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: getPrimaryAppBarText(context, S.of(context).reminder),
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
            children: [
              getCell("morning-coffee.png", breakfastTime!, "BreakFast"),
              getCell("dinner.png", lunchTime!, "Lunch"),
              getCell("night-mode.png", dinnerTime!, "Dinner"),
            ],
          ),
        ),
      ),
    );
  }

  getCell(String image, String time, String s) {
    TimeOfDay initialTime = TimeOfDay.now();

    return InkWell(

      onTap: ()async{

        await showTimePicker(
            context: context,
            initialTime: initialTime,
            builder: (BuildContext? context, Widget? child) {
          return Theme(
            data: ThemeData.dark().copyWith(
                colorScheme: ColorScheme.dark(
                  primary: primaryColor,
                  onPrimary: Colors.white,
                  surface: cellColor,
                  onSurface: primaryColor,
                  onBackground: primaryColor,
                )),
            child: child!,
          );

          // return Directionality(
          //   textDirection: TextDirection.rtl,
          //   child: child,
          // );
        },
        );
      },
      child: Card(
        color: cellColor,
        margin: EdgeInsets.all(getScreenPercentSize(context, 1.5)),
        child: Container(
          padding: EdgeInsets.all(getScreenPercentSize(context, 1.5)),
          child: Row(
            children: [
              Image.asset(
                ConstantData.assetsPath + image,
                color: textColor,
                height: getScreenPercentSize(context, 4),
              ),
              SizedBox(
                width: getWidthPercentSize(context, 5),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getTextWidget(s, textColor, TextAlign.start, FontWeight.w800,
                      getScreenPercentSize(context, 2)),
                  SizedBox(
                    height: getScreenPercentSize(context, 0.2),
                  ),
                  getTextWidget(time, subTextColor, TextAlign.start,
                      FontWeight.w500, getScreenPercentSize(context, 1.5)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
