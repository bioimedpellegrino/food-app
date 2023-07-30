import 'package:flutter/material.dart';
import 'package:flutter_diet_tips/util/ConstantData.dart';
import 'package:flutter_diet_tips/util/ConstantWidget.dart';
import 'package:flutter_diet_tips/util/SizeConfig.dart';


import 'generated/l10n.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPassword createState() {
    return _ForgotPassword();
  }
}

class _ForgotPassword extends State<ForgotPassword> {
  bool isRemember = false;
  TextEditingController textEmailController = new TextEditingController();
  TextEditingController textPasswordController = new TextEditingController();

  Future<bool> _requestPop() {
    Navigator.of(context).pop();
    return new Future.value(true);
  }

  @override
  void initState() {
    super.initState();
    ConstantData.setThemePosition();
    setState(() {

    });


  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);




    return WillPopScope(
        child: Scaffold(
          backgroundColor: cellColor,
          appBar: AppBar(
            backgroundColor: cellColor,
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
                      S.of(context).forgotPassword,
                      textColor,
                      TextAlign.start,
                      FontWeight.bold,
                      getScreenPercentSize(context, 4.2)),

                  SizedBox(
                    height: getScreenPercentSize(context, 0.5),
                  ),

                  getTextWidget(
                      S.of(context).weNeedYourRegistrationEmailToSendYouPasswordReset,
                      subTextColor,
                      TextAlign.start,
                      FontWeight.w500,
                      getScreenPercentSize(context, 2)),


                  SizedBox(
                    height: getScreenPercentSize(context, 3),
                  ),


                  // getDefaultTextFiledWidget(
                  //     context, S.of(context).yourEmail, textEmailController),




                  getTextFiled( S.of(context).yourEmail, textEmailController),
                  getButtonWidget(context, S.of(context).send,
                      primaryColor, () {
                        Navigator.of(context).pop(true);
                      }),











                ],
              ),
            ),
          ),
        ),
        onWillPop: _requestPop);
  }

  getTextFiled(String s,TextEditingController controller){
    Color color = Colors.grey;
    double editTextHeight = MediaQuery.of(context).size.height * 0.07;
    double defaultMargin = getScreenPercentSize(context, 2);

    return  StatefulBuilder(builder: (context, setState) {

      return Container(
        margin: EdgeInsets.symmetric(vertical: (defaultMargin)),
        padding: EdgeInsets.only(right: (defaultMargin/1.5)),
        height: editTextHeight,
        child: Focus(
          onFocusChange: (hasFocus) {
            setState(() => color = hasFocus ? primaryColor : Colors.grey);
          },

          child: TextField(
            maxLines: 1,

            controller: controller,
            style: TextStyle(
                fontFamily: ConstantData.fontFamily,
                color: textColor,
                fontWeight: FontWeight.w400,
                fontSize: ConstantData.font18Px),


            decoration: InputDecoration(
              enabledBorder:  OutlineInputBorder(

                borderSide:  BorderSide(
                    color: Colors.grey, width: 0.0),
              ),

              focusedBorder: OutlineInputBorder(

                borderSide:  BorderSide(
                    color: primaryColor, width: 1),
              ),
              border: OutlineInputBorder(
                borderSide:  BorderSide(
                    color: Colors.grey, width: 0.0),
              ),

              labelStyle: TextStyle(
                  fontFamily: ConstantData.fontFamily,

                  color:  color
              ),


              labelText: s,
              // hintText: 'Full Name',
            ),
          ),
        ),
      );
    },);
  }


}
