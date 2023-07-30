import 'package:flutter/material.dart';
import 'package:flutter_diet_tips/util/ConstantData.dart';
import 'package:flutter_diet_tips/util/ConstantWidget.dart';
import 'package:flutter_diet_tips/util/CustomDialogBox.dart';
import 'package:flutter_diet_tips/util/SizeConfig.dart';
import 'WidgetNotificationConfirmation.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

import 'generated/l10n.dart';

class PhoneVerification extends StatefulWidget {
  @override
  _PhoneVerification createState() {
    return _PhoneVerification();
  }
}

class _PhoneVerification extends State<PhoneVerification> {
  bool isRemember = false;
  int themeMode = 0;
  TextEditingController textEmailController = new TextEditingController();
  TextEditingController textPasswordController = new TextEditingController();

  Future<bool> _requestPop() {
    Navigator.of(context).pop();
    return new Future.value(true);
  }

  final GlobalKey<FormFieldState<String>> _formKey =
      GlobalKey<FormFieldState<String>>(debugLabel: '_formkey');
  TextEditingController _pinEditingController =
      TextEditingController(text: '123');
  bool _enable = true;

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
    SizeConfig().init(context);
    ColorBuilder _solidColor =
    PinListenColorBuilder(cellColor, cellColor);

    return WillPopScope(
        child: Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            backgroundColor: backgroundColor,
            elevation: 0,

            title: Text(""),
            leading: GestureDetector(
              onTap: (){
                _requestPop();
              },
              child: Icon(
                Icons.keyboard_backspace,
                color: textColor,
              ),
            ),
          ),

          body: SafeArea(
            child: Container(
              padding: EdgeInsets.all(
                  getScreenPercentSize(context, 2.5)),
              child: ListView(
                children: [


                  getTextWidget(
                      S.of(context).verification,
                      textColor,
                      TextAlign.start,
                      FontWeight.bold,
                      getScreenPercentSize(context, 4.2)),

                  SizedBox(
                    height: getScreenPercentSize(context, 0.5),
                  ),

                  getTextWidget(
                      "Enter the code we sent your registered mail",
                      subTextColor,
                      TextAlign.start,
                      FontWeight.w500,
                      getScreenPercentSize(context, 2)),

                  SizedBox(
                    height: getScreenPercentSize(context, 5),
                  ),

                  Center(
                    child: Container(
                      width: SizeConfig.safeBlockHorizontal! * 70,
                      child: PinInputTextFormField(
                        key: _formKey,
                        pinLength: 4,
                        decoration: new BoxLooseDecoration(
                          bgColorBuilder: _solidColor,
                          textStyle: TextStyle(
                              color:textColor,
                              fontFamily: ConstantData.fontFamily,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),

                          strokeColorBuilder: PinListenColorBuilder(
                              Colors.transparent,
                            Colors.transparent,),



                          obscureStyle: ObscureStyle(
                            isTextObscure: false,
                            obscureText: '🤪',
                          ),
                          // hintText: _kDefaultHint,
                        ),
                        controller: _pinEditingController,
                        textInputAction: TextInputAction.go,
                        enabled: _enable,

                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.characters,
                        onSubmit: (pin) {
                          print("gtepin===$pin");
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                          }
                        },
                        onChanged: (pin) {
                          setState(() {
                            debugPrint('onChanged execute. pin:$pin');
                          });
                        },
                        onSaved: (pin) {
                          debugPrint('onSaved pin:$pin');
                        },
                        validator: (pin) {
                          if (pin!.isEmpty) {
                            setState(() {
                              // _hasError = true;
                            });
                            return 'Pin cannot empty.';
                          }
                          setState(() {
                            // _hasError = false;
                          });
                          return null;
                        },
                        cursor: Cursor(
                          width: 2,
                          color: primaryColor,
                          radius: Radius.circular(1),
                          enabled: true,
                        ),
                      ),
                    ),
                  ),


                  SizedBox(
                    height: SizeConfig.safeBlockVertical! * 5,
                  ),

              Container(

                margin: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockVertical! * 9),
                child:
                Column(
                  children: [
                    getButtonWidget(context, S.of(context).resend,
                        primaryColor, () {
                        }),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical! * 3,
                    ),


                    getButtonWidget(context, S.of(context).next,
                        primaryColor, () {


                          showDialog(context: context,
                              builder: (BuildContext context){
                                return CustomDialogBox(
                                  title: "Account Created!",
                                  descriptions: "Your account has\nbeen successfully created!",
                                  text: "Continue",
                                  func: (){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => WidgetNotificationConfirmation(),
                                        ));
                                  },
                                );
                              }
                          );

                          // Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage(),));
                        }),
                  ],
                ),
              )

                ],
              ),
            ),
          ),
        ),
        onWillPop: _requestPop);
  }
}
