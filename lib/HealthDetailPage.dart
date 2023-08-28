import 'package:flutter/material.dart';
import 'package:flutter_diet_tips/util/ConstantData.dart';
import 'package:flutter_diet_tips/util/ConstantWidget.dart';
import 'model/HealthModel.dart';

class HealthDetailPage extends StatefulWidget {
  final HealthModel healthModel;

  HealthDetailPage(this.healthModel);

  @override
  _HealthDetailPage createState() {
    return _HealthDetailPage();
  }
}

class _HealthDetailPage extends State<HealthDetailPage> {

  int selectedPosition = 0;
  List<String> list = ["Workout Tips", "Diet Tips", "Supplement"];

  void onBackClick() {
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    double height = getScreenPercentSize(context, 35);
    double margin = getScreenPercentSize(context, 1);
    double size = getScreenPercentSize(context, 4);

    return WillPopScope(
        child: Scaffold(
          backgroundColor: cellColor,

          appBar: AppBar(
            title: getPrimaryAppBarText(context, widget.healthModel.title!),
            backgroundColor: primaryColor,
            centerTitle: false,

            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: getPrimaryAppBarIcon(),
                  onPressed: onBackClick,
                );
              },
            ),

          ),
          body: SafeArea(
            child: Container(
              color: cellColor,


              child: Stack(
                children: [
                  Container(
                    height: height,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: new NetworkImage(
                        ConstantData.backendUrl +
                            widget.healthModel.image!,
                      ),
                      fit: BoxFit.cover,
                    )),

                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding:  EdgeInsets.only(bottom: height-getPercentSize(height,80)),
                        child: Container(
                          margin: EdgeInsets.all(margin),
                          width:size,
                          height:size,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            shape: BoxShape.circle
                          ),
                          child: Center(
                            child: Icon(Icons.favorite_border,
                              size: getPercentSize(size, 60),
                              color: Colors.white,),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(


                    margin: EdgeInsets.only(top: getPercentSize(height,80)),
                    padding: EdgeInsets.all(margin),
                    decoration: BoxDecoration(
                      color: cellColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                              getScreenPercentSize(context, 5)),

                      ) ),


                    child: ListView(
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      children: [

                        SizedBox(
                          height:margin
                        ),

                        Row(
                          children: [
                            Expanded(
                              child: getTextWidget(
                                  widget.healthModel.title!,
                                  textColor,
                                  TextAlign.start,
                                  FontWeight.w600,
                                  getScreenPercentSize(
                                      context, 2.6)),
                            ),
                            // Icon(
                            //   Icons.favorite_border,
                            //   size: getScreenPercentSize(
                            //       context, 3),
                            //   color: primaryColor,
                            // )

                            getCustomTextWidget(widget.healthModel.time!,
                                primaryColor, 1, TextAlign.end, FontWeight.w500, getScreenPercentSize(context,1.5))

                          ],
                        ),


                        SizedBox(height: 8  ,),


                        // getTextWidgetWithSpacing(widget.healthModel.desc!+"\n"+widget.healthModel.desc!,
                        //     subTextColor,
                        //     TextAlign.start, FontWeight.w600, getScreenPercentSize(context,1.5)),
                        //

                        getTextWidgetWithSpacing(
                            widget.healthModel.desc!,
                            subTextColor,
                            TextAlign.start,
                            FontWeight.w500,
                            getScreenPercentSize(context, 1.8)),

                        SizedBox(height: 8  ,),
                        // Row(
                        //   children: [
                        //     Expanded(
                        //       child: getCustomTextWidget(widget.healthModel.time!,
                        //           primaryColor, 1, TextAlign.end, FontWeight.w500, getScreenPercentSize(context,1.5)),
                        //     ),
                        //
                        //   ],
                        // )

                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        onWillPop: () async {
          onBackClick();
          return false;
        });
  }
}
