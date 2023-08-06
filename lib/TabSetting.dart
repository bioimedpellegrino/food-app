import 'package:flutter/material.dart';
import 'package:flutter_diet_tips/ManageDiet.dart';
import 'package:flutter_diet_tips/NotificationPage.dart';
import 'package:flutter_diet_tips/TabBMI.dart';
import 'package:flutter_diet_tips/util/ConstantData.dart';
import 'package:flutter_diet_tips/util/ConstantWidget.dart';
import 'package:flutter_diet_tips/util/PrefData.dart';
import 'package:flutter_diet_tips/util/SizeConfig.dart';
import 'package:flutter_share/flutter_share.dart';

import 'EditProfilePage.dart';
import 'FavouritePage.dart';
import 'ReminderPage.dart';
import 'SignInPage.dart';
import 'generated/l10n.dart';

class TabSetting extends StatefulWidget {
  final ValueChanged<int> valueChanged;

  TabSetting(this.valueChanged);

  @override
  _TabSetting createState() {
    return _TabSetting();
  }
}

class _TabSetting extends State<TabSetting> {
  bool isSwitchOn = false;

  @override
  void initState() {
    ConstantData.setThemePosition();
    // TODO: implement initState
    getThemeMode();
    super.initState();
  }

  double marginMain = 10;
  double radius = 10;
  double padding = 7;
  double paddingImage = 10;
  int boxWidth = 3;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double margin = getScreenPercentSize(context, 1);

    return WillPopScope(
      onWillPop: () async {
        onBackPress();

        return true;
      },
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: getPrimaryAppBarText(context, S.of(context).setting),
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
          ), // actions: [
          //   Padding(
          //     padding:  EdgeInsets.symmetric(horizontal: getScreenPercentSize(context, 2),),
          //     child: InkWell(
          //       onTap: () {
          //         Navigator.push(context, MaterialPageRoute(builder: (context) => TabBMI(),));
          //
          //       },
          //       child: Icon(
          //         Icons.bar_chart,
          //         size: getScreenPercentSize(context, 4),
          //         color: Colors.white,
          //       ),
          //     ),
          //   )
          // ],
        ),
        body: Container(
          child: ListView(
            padding:
                EdgeInsets.symmetric(vertical: margin, horizontal: margin / 2),
            children: [
              GestureDetector(
                child: Container(
                  margin: EdgeInsets.all(marginMain),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radius),
                      color: cellColor),
                  child: Padding(
                    padding: EdgeInsets.only(top: padding, bottom: padding),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(paddingImage),
                          child: Icon(
                            Icons.brightness_4_outlined,
                            color: primaryColor,
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.safeBlockHorizontal! * boxWidth,
                        ),
                        Expanded(
                          child: getSmallNormalText(
                              S.of(context).nightMode, textColor),
                          flex: 1,
                        ),
                        Switch(
                          value: isSwitchOn,
                          activeColor: primaryColor,
                          inactiveTrackColor: subTextColor,
                          onChanged: (value) {
                            setState(() {
                              isSwitchOn = value;

                              if (value) {
                                PrefData.setThemeMode(1);
                              } else {
                                PrefData.setThemeMode(0);
                              }

                              getThemeMode();

                              widget.valueChanged(1);
                            });
                          },
                        )
                      ],
                    ),
                  ),
                ),
                onTap: () {},
              ),
              GestureDetector(
                child: Container(
                  margin: EdgeInsets.all(marginMain),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radius),
                      color: cellColor),
                  child: Padding(
                    padding: EdgeInsets.only(top: padding, bottom: padding),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(paddingImage),
                          child: Icon(
                            Icons.bar_chart,
                            color: primaryColor,
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.safeBlockHorizontal! * boxWidth,
                        ),
                        Expanded(
                          child: getSmallNormalText(
                              S.of(context).manageHealthCalculation, textColor),
                          flex: 1,
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TabBMI(),
                      ));
                },
              ),
              GestureDetector(
                child: Container(
                  margin: EdgeInsets.all(marginMain),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radius),
                      color: cellColor),
                  child: Padding(
                    padding: EdgeInsets.only(top: padding, bottom: padding),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(paddingImage),
                          child: Icon(
                            Icons.emoji_food_beverage,
                            color: primaryColor,
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.safeBlockHorizontal! * boxWidth,
                        ),
                        Expanded(
                          child: getSmallNormalText(
                              S.of(context).manageDietPreference, textColor),
                          flex: 1,
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ManageDiet(),
                      ));
                },
              ),
              GestureDetector(
                child: Container(
                  margin: EdgeInsets.all(marginMain),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radius),
                      color: cellColor),
                  child: Padding(
                    padding: EdgeInsets.only(top: padding, bottom: padding),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(paddingImage),
                          child: Icon(
                            Icons.timer,
                            color: primaryColor,
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.safeBlockHorizontal! * boxWidth,
                        ),
                        Expanded(
                          child: getSmallNormalText(
                              S.of(context).reminder, textColor),
                          flex: 1,
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReminderPage(),
                      ));
                },
              ),
              GestureDetector(
                child: Container(
                  margin: EdgeInsets.all(marginMain),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radius),
                      color: cellColor),
                  child: Padding(
                    padding: EdgeInsets.only(top: padding, bottom: padding),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(paddingImage),
                          child: Icon(
                            Icons.account_circle_sharp,
                            color: primaryColor,
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.safeBlockHorizontal! * boxWidth,
                        ),
                        Expanded(
                          child: getSmallNormalText(
                              S.of(context).editProfile, textColor),
                          flex: 1,
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditProfilePage(),
                      ));
                },
              ),
              GestureDetector(
                child: Container(
                  margin: EdgeInsets.all(marginMain),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radius),
                      color: cellColor),
                  child: Padding(
                    padding: EdgeInsets.only(top: padding, bottom: padding),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(paddingImage),
                          child: Icon(
                            Icons.favorite,
                            color: primaryColor,
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.safeBlockHorizontal! * boxWidth,
                        ),
                        Expanded(
                          child: getSmallNormalText(
                              S.of(context).favourite, textColor),
                          flex: 1,
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return FavouritePage();
                    },
                  ));
                },
              ),
              GestureDetector(
                child: Container(
                  margin: EdgeInsets.all(marginMain),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radius),
                      color: cellColor),
                  child: Padding(
                    padding: EdgeInsets.only(top: padding, bottom: padding),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(paddingImage),
                          child: Icon(
                            Icons.notifications,
                            color: primaryColor,
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.safeBlockHorizontal! * boxWidth,
                        ),
                        Expanded(
                          child: getSmallNormalText(
                              S.of(context).notification, textColor),
                          flex: 1,
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return NotificationPage();
                    },
                  ));
                },
              ),
              GestureDetector(
                child: Container(
                  margin: EdgeInsets.all(marginMain),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radius),
                      color: cellColor),
                  child: Padding(
                    padding: EdgeInsets.only(top: padding, bottom: padding),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(paddingImage),
                          child: Icon(
                            Icons.security,
                            color: primaryColor,
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.safeBlockHorizontal! * boxWidth,
                        ),
                        Expanded(
                          child: getSmallNormalText(
                              S.of(context).privacyPolicy, textColor),
                          flex: 1,
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {},
              ),
              
              GestureDetector(
                child: Container(
                  margin: EdgeInsets.all(marginMain),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radius),
                      color: cellColor),
                  child: Padding(
                    padding: EdgeInsets.only(top: padding, bottom: padding),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(paddingImage),
                          child: Icon(
                            Icons.logout,
                            color: primaryColor,
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.safeBlockHorizontal! * boxWidth,
                        ),
                        Expanded(
                          child: getSmallNormalText(
                              S.of(context).logOut, textColor),
                          flex: 1,
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () async {
                  PrefData.setIsSignIn(false);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignInPage(),
                      ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  getThemeMode() async {
    int i = await PrefData.getThemeMode();

    if (i == 1) {
      isSwitchOn = true;
    } else {
      isSwitchOn = false;
    }
    ConstantData.setThemePosition();

    setState(() {});
  }

  Future<void> share() async {

    await FlutterShare.share(
        title: S.of(context).appName,
        text: S.of(context).appName,
        linkUrl: 'https://flutter.dev/',
        chooserTitle: 'Share App'
    );

  }

  void onBackPress() {
    widget.valueChanged(0);
  }
}
