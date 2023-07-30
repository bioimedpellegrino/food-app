import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_diet_tips/util/ConstantData.dart';
import 'package:flutter_diet_tips/util/ConstantWidget.dart';
import 'package:flutter_diet_tips/util/SizeConfig.dart';

import 'package:country_code_picker/country_code_picker.dart';

import 'PhoneVerification.dart';
import 'SignInPage.dart';
import 'generated/l10n.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPage createState() {
    return _SignUpPage();
  }
}

class _SignUpPage extends State<SignUpPage> {
  bool isRemember = false;
  int themeMode = 0;
  TextEditingController textEmailController = new TextEditingController();
  TextEditingController myController = new TextEditingController();
  TextEditingController textNameController = new TextEditingController();
  TextEditingController textPasswordController = new TextEditingController();

  Future<bool> _requestPop() {
    if (Platform.isIOS) {
      exit(0);
    } else {
      SystemNavigator.pop();
    }
    //   Future.delayed(const Duration(milliseconds: 200), () {
    //     SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    //   });

    return new Future.value(false);
  }

  @override
  void initState() {
    super.initState();
    ConstantData.setThemePosition();
    setState(() {});
    // setTheme();
  }
  // setTheme()async{
  //   themeMode = await PrefData.getThemeMode();
  //   setState(() {
  //
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    double height = MediaQuery.of(context).size.height * 0.07;

    double radius = getPercentSize(height, 7);

    return WillPopScope(
        child: Scaffold(
          backgroundColor: cellColor,
          appBar: AppBar(
            backgroundColor: cellColor,
            elevation: 0,
            title: Text(""),
            leading: Icon(
              Icons.keyboard_backspace,
              color: textColor,
            ),
          ),
          body: Container(
            padding: EdgeInsets.symmetric(
                horizontal: getScreenPercentSize(context, 2.5)),
            child: ListView(
              children: [
                getTextWidget("Create Account!", textColor, TextAlign.left,
                    FontWeight.bold, getScreenPercentSize(context, 4.2)),
                SizedBox(
                  height: getScreenPercentSize(context, 2.5),
                ),

                getTextFiled(S.of(context).yourName, textNameController, false),
                getTextFiled(
                    S.of(context).yourEmail, textEmailController, false),

                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      height: height,
                      margin: EdgeInsets.only(right: 7),
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(radius),
                        ),
                        border: Border.all(color: Colors.grey, width: 0.0),
                      ),
                      child: CountryCodePicker(
                        boxDecoration: BoxDecoration(
                          color: cellColor,
                        ),
                        closeIcon: Icon(Icons.close,
                            size: getScreenPercentSize(context, 3),
                            color: textColor),

                        onChanged: (value) {
                          // countryCode = value.dialCode;
                          // print("changeval===$countryCode");
                        },
                        // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                        initialSelection: 'IN',
                        searchStyle: TextStyle(
                            color: textColor,
                            fontFamily: ConstantData.fontFamily),
                        searchDecoration: InputDecoration(
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: textColor),
                            ),
                            hintStyle: TextStyle(
                                color: textColor,
                                fontFamily: ConstantData.fontFamily)),
                        textStyle: TextStyle(
                            color: textColor,
                            fontFamily: ConstantData.fontFamily),
                        dialogTextStyle: TextStyle(
                            color: textColor,
                            fontFamily: ConstantData.fontFamily),

                        showFlagDialog: true,
                        hideSearch: true,
                        comparator: (a, b) => b.name!.compareTo(a.name!),

                        onInit: (code) {
                          // countryCode = code.dialCode;
                        },
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 7),
                        margin: EdgeInsets.only(left: 7),
                        alignment: Alignment.centerLeft,
                        // decoration: BoxDecoration(
                        //   color: cellColor,
                        //
                        //
                        //   borderRadius: BorderRadius.all(
                        //     Radius.circular(radius),
                        //   ),
                        // ),

                        child:
                            getTextFiled("Phone Number", myController, false),
                        // child: TextField(
                        //   // controller: myController,
                        //   onChanged: (value) async {
                        //     try {} catch (e) {
                        //       print("resge$e");
                        //     }
                        //   },
                        //   decoration: InputDecoration(
                        //       contentPadding:
                        //       EdgeInsets.only(left: getWidthPercentSize(context, 2)),
                        //
                        //       border: InputBorder.none,
                        //       focusedBorder: InputBorder.none,
                        //       enabledBorder: InputBorder.none,
                        //       errorBorder: InputBorder.none,
                        //       disabledBorder: InputBorder.none,
                        //       hintText: S.of(context).phoneNumber,
                        //       hintStyle: TextStyle(
                        //           fontFamily: ConstantData.fontFamily,
                        //           color: textColor,
                        //           fontWeight: FontWeight.w400,
                        //           fontSize: getPercentSize(height, 25))),
                        //   style: TextStyle(
                        //       fontFamily: ConstantData.fontFamily,
                        //       color: textColor,
                        //       fontWeight: FontWeight.w400,
                        //       fontSize: getPercentSize(height, 25)),
                        //   keyboardType: TextInputType.number,
                        //   inputFormatters: <TextInputFormatter>[
                        //     FilteringTextInputFormatter.digitsOnly
                        //   ], // Only numbers can be entered
                        // ),
                      ),
                      flex: 1,
                    )
                  ],
                ),

                getTextFiled(
                    S.of(context).password, textPasswordController, true),

                // getPasswordTextFiled(
                //     context, S.of(context).password, textPasswordController),

                SizedBox(
                  height: getScreenPercentSize(context, 2),
                ),

                getTextButtonWidget(context, S.of(context).signUp, primaryColor,
                    () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PhoneVerification(),
                      ));
                }),

                SizedBox(
                  height: getScreenPercentSize(context, 12),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    getTextWidget(
                        S.of(context).youHaveAnAlreadyAccount,
                        textColor,
                        TextAlign.left,
                        FontWeight.w500,
                        getScreenPercentSize(context, 1.8)),
                    SizedBox(
                      width: getScreenPercentSize(context, 0.5),
                    ),
                    InkWell(
                      child: getTextWidget(
                          S.of(context).signIn,
                          primaryColor,
                          TextAlign.start,
                          FontWeight.bold,
                          getScreenPercentSize(context, 2)),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignInPage(),
                            ));
                      },
                    )
                  ],
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
