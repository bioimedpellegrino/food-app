import 'package:flutter/material.dart';
import 'package:flutter_diet_tips/FirstPage.dart';
import 'package:flutter_diet_tips/util/ConstantData.dart';
import 'package:flutter_diet_tips/util/ConstantWidget.dart';
import 'package:flutter_diet_tips/util/PrefData.dart';

import 'ForgotPassword.dart';
import 'SignUpPage.dart';
import 'generated/l10n.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPage createState() {
    return _SignInPage();
  }
}

class _SignInPage extends State<SignInPage> {
  bool isRemember = false;
  // int themeMode = 0;
  TextEditingController textNameController = new TextEditingController();
  TextEditingController textPasswordController = new TextEditingController();

  Future<bool> _requestPop() {
    Navigator.of(context).pop();
    return new Future.value(false);
  }

  @override
  void initState() {
    super.initState();
    ConstantData.setThemePosition();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          backgroundColor: cellColor,
          appBar: AppBar(
            backgroundColor: cellColor,
            elevation: 0,
            title: Text(""),
            leading: GestureDetector(
              onTap: () {
                _requestPop();
              },
              child: Icon(
                Icons.keyboard_backspace,
                color: textColor,
              ),
            ),
          ),
          body: Container(
            padding: EdgeInsets.symmetric(
                horizontal: getScreenPercentSize(context, 2.5)),
            child: ListView(
              children: [
                getTextWidget(
                    S.of(context).signIn,
                    // S.of(context).gladToMeetnyouAgain,
                    textColor,
                    TextAlign.left,
                    FontWeight.bold,
                    getScreenPercentSize(context, 4.2)),
                SizedBox(
                  height: getScreenPercentSize(context, 2.5),
                ),

                getTextFiled(
                    S.of(context).yourEmail, textNameController, false),
                getTextFiled(
                    S.of(context).password, textPasswordController, true),

                //
                // getDefaultTextFiledWidget(
                //     context, S.of(context).yourEmail, textNameController),
                // getPasswordTextFiled(
                //     context, S.of(context).password, textPasswordController),

                InkWell(
                  child: getTextWidget(
                    S.of(context).forgotPassword,
                    textColor,
                    TextAlign.end,
                    FontWeight.w600,
                    getScreenPercentSize(context, 1.8),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgotPassword(),
                        ));
                  },
                ),
                SizedBox(
                  height: getScreenPercentSize(context, 4),
                ),

                getTextButtonWidget(
                    context, S.of(context).signIn, Colors.orangeAccent, () {
                  PrefData.setIsSignIn(true);
                  PrefData.setIsIntro(false);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FirstPage(),
                      ));
                }),

                // Padding(padding: EdgeInsets.symmetric(vertical: getScreenPercentSize(context,.5)),child: Center(
                //   child: getTextWidget(
                //       S.of(context).or,
                //       textColor,
                //       TextAlign.center,
                //       FontWeight.w300,
                //       getScreenPercentSize(context, 1.8)),
                // ),),

                // getTextButtonWidget(context, S.of(context).signUpNow,
                //     primaryColor, () {
                //   Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage(),));
                // }),

                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: getScreenPercentSize(context, .5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      getTextWidget(
                          S.of(context).dontHaveAnAccount,
                          textColor,
                          TextAlign.left,
                          FontWeight.w500,
                          getScreenPercentSize(context, 1.8)),
                      SizedBox(
                        width: getScreenPercentSize(context, 0.5),
                      ),
                      InkWell(
                        child: getTextWidget(
                            S.of(context).signUp,
                            primaryColor,
                            TextAlign.start,
                            FontWeight.bold,
                            getScreenPercentSize(context, 2)),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpPage(),
                              ));
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        onWillPop: _requestPop);
  }

  getTextFiled(String s, TextEditingController controller, bool isPass) {
    Color color = Colors.grey;
    double editTextHeight = MediaQuery.of(context).size.height * 0.07;
    double defaultMargin = getScreenPercentSize(context, 2);

    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: (defaultMargin)),
          padding: EdgeInsets.only(right: (defaultMargin / 1.5)),
          height: editTextHeight,
          child: Focus(
            onFocusChange: (hasFocus) {
              setState(() => color = hasFocus ? primaryColor : Colors.grey);
            },
            child: TextField(
              maxLines: 1,
              obscureText: isPass,
              controller: controller,
              style: TextStyle(
                  fontFamily: ConstantData.fontFamily,
                  color: textColor,
                  fontWeight: FontWeight.w400,
                  fontSize: ConstantData.font18Px),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 0.0),
                ),

                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primaryColor, width: 1),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 0.0),
                ),

                labelStyle: TextStyle(
                    fontFamily: ConstantData.fontFamily, color: color),

                labelText: s,
                // hintText: 'Full Name',
              ),
            ),
          ),
        );
      },
    );
  }
}
