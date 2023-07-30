import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_diet_tips/util/ConstantData.dart';
import 'package:flutter_diet_tips/util/ConstantWidget.dart';
import 'package:flutter_diet_tips/util/SizeConfig.dart';
import 'package:image_picker/image_picker.dart';

import 'generated/l10n.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePage createState() {
    return _EditProfilePage();
  }
}

class _EditProfilePage extends State<EditProfilePage> {
  TextEditingController firstNameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController mailController = new TextEditingController();
  TextEditingController genderController = new TextEditingController();
  TextEditingController phController = new TextEditingController(text: "+91");
  TextEditingController heightController =
      new TextEditingController(text: "152");
  TextEditingController weightController =
      new TextEditingController(text: "25");
  TextEditingController ageController = new TextEditingController(text: "25");
  TextEditingController phoneController = new TextEditingController();


  @override
  void initState() {
    super.initState();
    ConstantData.setThemePosition();

    firstNameController.text = "harry";
    lastNameController.text = "harry";
    mailController.text = "fd@gamil.com";
    genderController.text = "Male";
    phoneController.text = "326598659";

    setState(() {});
  }

  Future<bool> _requestPop() {
    Navigator.of(context).pop();
    return new Future.value(true);
  }

  XFile? _image;
  final picker = ImagePicker();

  _imgFromGallery() async {
    XFile? image =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  getProfileImage() {
    if (_image != null && _image!.path.isNotEmpty) {
      return Image.file(
        File(_image!.path),
        fit: BoxFit.cover,
      );
    } else {
      //
      return Image.asset(
        ConstantData.assetsPath + "hugh.png",
        fit: BoxFit.cover,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double topMargin = getScreenPercentSize(context, 1);

    double profileHeight = getScreenPercentSize(context, 15);
    double defaultMargin = getScreenPercentSize(context, 2);
    double editSize = getPercentSize(profileHeight, 24);

    return WillPopScope(
        child: Scaffold(
          backgroundColor: cellColor,

          appBar: AppBar(
            elevation: 0,
            title: getPrimaryAppBarText(context, S.of(context).editProfile),
            backgroundColor: primaryColor,
            centerTitle: true,
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: getPrimaryAppBarIcon(),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                );
              },
            ),
          ),

          // appBar: AppBar(
          //   elevation: 0,
          //   centerTitle: true,
          //   backgroundColor: ConstantData.bgColor,
          //   title: getAppBarText(S.of(context).editProfile),
          //   leading: Builder(
          //     builder: (BuildContext context) {
          //       return IconButton(
          //         icon: getAppBarIcon(),
          //         onPressed: _requestPop,
          //       );
          //     },
          //   ),
          // ),

          body: SafeArea(
            child: Stack(
              children: [
                ListView(
                  primary: true,
                  children: [
                    Container(
                      color: backgroundColor,
                      padding: EdgeInsets.only(top: (topMargin * 4)),
                      child: Container(
                          height: profileHeight + (profileHeight / 5),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Stack(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Container(
                                    height: profileHeight,
                                    width: profileHeight,
                                    decoration: BoxDecoration(
                                        color: primaryColor,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: primaryColor,
                                            width: getScreenPercentSize(
                                                context, 0.2))),
                                    child: ClipOval(
                                      child: Material(
                                        color: primaryColor,
                                        child: getProfileImage(),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: InkWell(
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          left:
                                              getScreenPercentSize(context, 10),
                                          bottom: getScreenPercentSize(
                                              context, 2.7)),
                                      height: editSize,
                                      width: editSize,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: primaryColor,
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.photo_camera_back,
                                            color: Colors.white,
                                            size: getPercentSize(editSize, 48),
                                          ),
                                        ),
                                      ),
                                    ),
                                    onTap: () async {
                                      _imgFromGallery();
                                    },
                                    // onTap: _imgFromGallery,
                                  ),
                                )
                              ],
                            ),
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: defaultMargin),
                      decoration: BoxDecoration(
                          color: cellColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                  getScreenPercentSize(context, 4)),
                              topRight: Radius.circular(
                                  getScreenPercentSize(context, 4)))),
                      padding: EdgeInsets.all(defaultMargin),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: getCustomTextWithoutAlign(
                                S.of(context).userInformation,
                                textColor,
                                FontWeight.bold,
                                ConstantData.font22Px),
                          ),
                          SizedBox(
                            height: (defaultMargin / 2),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: getTextFiled(S.of(context).firstName,
                                    firstNameController),
                                flex: 1,
                              ),
                              Expanded(
                                child: getTextFiled(
                                    S.of(context).lastName, lastNameController),
                                flex: 1,
                              ),
                            ],
                          ),
                          getTextFiled(
                              S.of(context).emailAddressHint, mailController),
                          Row(
                            children: [
                              Expanded(
                                child: getDisableTextFiled(
                                    "", phController, () {}),
                                // child:   getTextFiled(S.of(context).gender,genderController),
                                flex: 1,
                              ),
                              Expanded(
                                child: getTextFiled(
                                    S.of(context).phone, phoneController),
                                flex: 3,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: getDisableTextFiled(
                                    "Height", heightController, () {
                                  showHeightDialog(context);
                                }),
                                flex: 1,
                              ),
                              Expanded(
                                child: getDisableTextFiled(
                                    "Weight", weightController, () {
                                  showWeightDialog(context);
                                }),
                                flex: 1,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: getDisableTextFiled(
                                    "Gender", genderController, () {
                                  showGenderDialog(context);
                                }),
                                flex: 1,
                              ),
                              Expanded(
                                child: getDisableTextFiled("Age", ageController,
                                    () {
                                  showAgeDialog(context);
                                }),
                                flex: 1,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: defaultMargin,
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: getBottomText(context, S.of(context).save, () {
                    Navigator.of(context).pop(true);
                  }),
                ),
              ],
            ),
          ),
        ),
        onWillPop: _requestPop);
  }

  void showWeightDialog(BuildContext contexts) async {
    return showDialog(
      context: contexts,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: cellColor,
              title: getMediumTextWithMaxLine("Enter Weight", textColor, 1),
              content: Container(
                width: 300.0,
                padding:
                    EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    getCustomText("Weight", textColor, 1, TextAlign.start,
                        FontWeight.w500, ConstantData.font22Px),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            cursorColor: primaryColor,
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: primaryColor),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: primaryColor),
                                )),
                            // cursorRadius: Radius.circular(16.0),
                            // cursorHeight: ,
                            // cursorWidth: 16.0,
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                                color: textColor,
                                decorationColor: primaryColor,
                                fontFamily: ConstantData.fontFamily),
                            controller: weightController,
                          ),
                          flex: 1,
                        ),
                        getMediumNormalTextWithMaxLine(
                            "KG", Colors.grey, 1, TextAlign.start)
                      ],
                    ),
                  ],
                ),
              ),
              actions: [
                new TextButton(
                    child: Text(
                      'CANCEL',
                      style: TextStyle(
                          fontFamily: ConstantData.fontFamily,
                          fontSize: 15,
                          color: primaryColor,
                          fontWeight: FontWeight.normal),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                new TextButton(
                    // color: lightPink,
                    style: TextButton.styleFrom(backgroundColor: primaryColor),
                    child: Text(
                      'CHECK',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: ConstantData.fontFamily,
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ],
            );
          },
        );
      },
    ).then((value) {
      FocusScope.of(context).unfocus();
    });
  }

  List<String> ringTone = ['Male', 'Female'];

  Future<dynamic> showGenderDialog(BuildContext contexts) async {
    int? _currentIndex = (genderController.text == "male") ? 0 : 1;

    return showDialog(
      context: contexts,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(getScreenPercentSize(context, 1)),
              ),
              elevation: 0,
              backgroundColor: cellColor,

              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getMediumBoldTextWithMaxLine("Select Gender", textColor, 1),

                    SizedBox(
                      height: getScreenPercentSize(context, 2),
                    ),

                    Container(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: ringTone.length,
                        itemBuilder: (context, index) {
                          bool isSelected = (index == _currentIndex);

                          return Padding(
                            padding:  EdgeInsets.symmetric(vertical: getScreenPercentSize(context, 1)),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _currentIndex = index;
                                });
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    isSelected
                                        ? Icons.radio_button_checked
                                        : Icons.radio_button_off,
                                    color:
                                        isSelected ? primaryColor : subTextColor,
                                    size: getScreenPercentSize(context, 2),
                                  ),
                                  SizedBox(
                                    width: getWidthPercentSize(context, 2),
                                  ),
                                  getSmallNormalText(ringTone[index], textColor),
                                ],
                              ),
                            ),
                          );
                          // return RadioListTile(
                          //   value: index,
                          //   groupValue: _currentIndex,
                          //   activeColor: primaryColor,
                          //
                          //   title: getSmallNormalText(
                          //       ringTone[index], textColor),
                          //   onChanged: (value) {
                          //     setState(() {
                          //       _currentIndex = int.parse(value.toString());
                          //     });
                          //   },
                          // );
                        },
                      ),
                    ),
                    Row(
                      children: [
                        new Spacer(),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              genderController.text = ringTone[_currentIndex!];
                            });
                            Navigator.pop(context);
                          },
                          child: getSmallBoldText("Ok", primaryColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // actions: [
              //   TextButton(
              //     onPressed: () {
              //
              //
              //       setState((){
              //         genderController.text=ringTone[_currentIndex!];
              //       });
              //       Navigator.pop(context);
              //     },
              //     child: Text('OK'),
              //   ),
              // ],
            );
          },
        );
      },
    ).then((value) {
      FocusScope.of(context).unfocus();
    });
  }

  void showAgeDialog(BuildContext contexts) async {
    return showDialog(
      context: contexts,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: cellColor,
              title: getMediumTextWithMaxLine("Enter Age", textColor, 1),
              content: Container(
                width: 300.0,
                padding:
                    EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    getCustomText("Height", textColor, 1, TextAlign.start,
                        FontWeight.w500, ConstantData.font22Px),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            cursorColor: primaryColor,
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: primaryColor),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: primaryColor),
                                )),
                            // cursorRadius: Radius.circular(16.0),
                            // cursorHeight: ,
                            // cursorWidth: 16.0,
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                                color: textColor,
                                decorationColor: primaryColor,
                                fontFamily: ConstantData.fontFamily),
                            controller: ageController,
                          ),
                          flex: 1,
                        ),
                        getMediumNormalTextWithMaxLine(
                            "Year", Colors.grey, 1, TextAlign.start)
                      ],
                    ),
                  ],
                ),
              ),
              actions: [
                new TextButton(
                    child: Text(
                      'CANCEL',
                      style: TextStyle(
                          fontFamily: ConstantData.fontFamily,
                          fontSize: 15,
                          color: primaryColor,
                          fontWeight: FontWeight.normal),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                new TextButton(
                    // color: lightPink,
                    style: TextButton.styleFrom(backgroundColor: primaryColor),
                    child: Text(
                      'CHECK',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: ConstantData.fontFamily,
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ],
            );
          },
        );
      },
    ).then((value) {
      FocusScope.of(context).unfocus();
    });
  }

  void showHeightDialog(BuildContext contexts) async {
    return showDialog(
      context: contexts,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: cellColor,
              title: getMediumTextWithMaxLine("Enter Height", textColor, 1),
              content: Container(
                width: 300.0,
                padding:
                    EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    getCustomText("Height", textColor, 1, TextAlign.start,
                        FontWeight.w500, ConstantData.font22Px),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            cursorColor: primaryColor,
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: primaryColor),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: primaryColor),
                                )),
                            // cursorRadius: Radius.circular(16.0),
                            // cursorHeight: ,
                            // cursorWidth: 16.0,
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                                color: textColor,
                                decorationColor: primaryColor,
                                fontFamily: ConstantData.fontFamily),
                            controller: heightController,
                          ),
                          flex: 1,
                        ),
                        getMediumNormalTextWithMaxLine(
                            "CM", Colors.grey, 1, TextAlign.start)
                      ],
                    ),
                  ],
                ),
              ),
              actions: [
                new TextButton(
                    child: Text(
                      'CANCEL',
                      style: TextStyle(
                          fontFamily: ConstantData.fontFamily,
                          fontSize: 15,
                          color: primaryColor,
                          fontWeight: FontWeight.normal),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                new TextButton(
                    // color: lightPink,
                    style: TextButton.styleFrom(backgroundColor: primaryColor),
                    child: Text(
                      'CHECK',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: ConstantData.fontFamily,
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                    ),
                    onPressed: () {
                      if (heightController.text.isNotEmpty) {}

                      Navigator.pop(context);
                    }),
              ],
            );
          },
        );
      },
    ).then((value) {
      FocusScope.of(context).unfocus();
    });
  }

  getTextFiled(String s, TextEditingController controller) {
    Color color = Colors.grey;
    double editTextHeight = MediaQuery.of(context).size.height * 0.06;
    double defaultMargin = getScreenPercentSize(context, 2);

    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: (defaultMargin / 1.3)),
          padding: EdgeInsets.only(right: (defaultMargin / 1.5)),
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

  getDisableTextFiled(
      String s, TextEditingController controller, Function function) {
    Color color = Colors.grey;
    double editTextHeight = MediaQuery.of(context).size.height * 0.06;
    double defaultMargin = getScreenPercentSize(context, 2);

    return InkWell(
      onTap: () {
        function();
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: (defaultMargin / 1.3)),
        padding: EdgeInsets.only(right: (defaultMargin / 1.5)),
        height: editTextHeight,
        child: TextField(
          enabled: false,
          maxLines: 1,
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
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 0.0),
            ),

            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor, width: 0.0),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 0.0),
            ),

            labelStyle:
                TextStyle(fontFamily: ConstantData.fontFamily, color: color),

            labelText: s,
            // hintText: 'Full Name',
          ),
        ),
      ),
    );
  }
}
