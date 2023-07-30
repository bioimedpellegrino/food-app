import 'package:flutter/material.dart';
import 'package:flutter_diet_tips/util/ConstantData.dart';
import 'package:flutter_diet_tips/util/ConstantWidget.dart';
import 'package:flutter_diet_tips/util/SizeConfig.dart';
import 'SignInPage.dart';


class WidgetNotificationConfirmation extends StatefulWidget {
  @override
  _WidgetNotificationConfirmation createState() =>
      _WidgetNotificationConfirmation();
}

class _WidgetNotificationConfirmation
    extends State<WidgetNotificationConfirmation> {


  @override
  void initState() {
    super.initState();


    setTheme();
  }

  setTheme() async {
    ConstantData.setThemePosition();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
        child: Scaffold(
          backgroundColor: backgroundColor,
          body: new Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  getCustomText('Health Tips', textColor, 1,
                      TextAlign.center, FontWeight.bold, 28),
                  // SizedBox(
                  //   height: 45.0,
                  // ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical! * 2,
                  ),
                  Image.asset(
                    ConstantData.assetsPath  + "img_allow_notification.png",
                    fit: BoxFit.contain,
                    width: SizeConfig.safeBlockHorizontal! * 70,
                    height: SizeConfig.safeBlockVertical! * 40,
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical! * 2,
                  ),
                  // SizedBox(
                  //   height: 45.0,
                  // ),
                  getCustomText("Notifications", textColor, 1,
                      TextAlign.center, FontWeight.w600, 20),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child:getCustomText(
                        "Stay notified about course updates,\nnew exam tools and change to\nthe leaderboard",
                        textColor,
                        3,
                        TextAlign.center,
                        FontWeight.w100,
                        16),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical! * 1.5,
                  ),

                  InkWell(
                    child: Container(


                        decoration: BoxDecoration(
                          borderRadius: new BorderRadius.circular(22),
                          shape: BoxShape.rectangle,
                          color: primaryColor,
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),


                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            getCustomText("Allow", Colors.white, 1,
                                TextAlign.center, FontWeight.w400, 18),
                          ],
                        )),

                    onTap: (){
                      Navigator.of(context).push(new MaterialPageRoute(
                        builder: (context) => SignInPage(),
                      ));
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(new MaterialPageRoute(
                        builder: (context) => SignInPage(),
                      ));
                    },
                    child: getCustomText("Skip", textColor, 1,
                        TextAlign.center, FontWeight.w500, 18),
                  ),
                ],
              ),
            ),
          ),
        ),
        onWillPop: () async {
          return false;
        });
  }
}
