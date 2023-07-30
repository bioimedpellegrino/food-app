import 'package:flutter/material.dart';

import 'ConstantData.dart';
import 'ConstantWidget.dart';


class CustomDialogBox extends StatefulWidget {
  final String? title, descriptions, text;
  final Image? img;
 final Function? func;

  const CustomDialogBox(
      {Key? key, this.title, this.descriptions, this.text, this.img, this.func})
      : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: cellColor,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
              left: ConstantData.padding,
              top: ConstantData.avatarRadius + ConstantData.padding,
              right: ConstantData.padding,
              bottom: ConstantData.padding),
          margin: EdgeInsets.only(top: ConstantData.avatarRadius),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              getCustomText(widget.title!, textColor, 1, TextAlign.center,FontWeight.w600,20)


              ,
              SizedBox(
                height: 10,
              ),
              getCustomText(widget.descriptions!,subTextColor,2,TextAlign.center,FontWeight.normal,14)


        ,
              SizedBox(
                height: 22,
              ),
              Container(
                margin: EdgeInsets.only(left: 15,right: 15),
                width: double.infinity,
                child: getRoundCornerButtonWithoutIcon(
                    widget.text!, primaryColor, Colors.white, 20, () {
                  Navigator.of(context).pop();
                  widget.func!();
                }),
              )


            ],
          ),
        ),
        Positioned(
          top: 10,
          left: ConstantData.padding,
          right: ConstantData.padding,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: ConstantData.avatarRadius,
            child: ClipRRect(
                borderRadius:
                    BorderRadius.all(Radius.circular(ConstantData.avatarRadius)),
                child: Image.asset(
                  ConstantData.assetsPath + "security.png",
                  color: textColor,
                )),
          ),
        ),
      ],
    );
  }
}
