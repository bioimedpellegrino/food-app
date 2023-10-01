import 'package:flutter/material.dart';
import 'package:flutter_diet_tips/util/ConstantData.dart';
import 'package:flutter_diet_tips/util/ConstantWidget.dart';
import 'model/AdviceModel.dart';

class AdviceDetailPage extends StatefulWidget {
  final AdviceModel adviceModel;

  AdviceDetailPage(this.adviceModel);

  @override
  _HealthDetailPage createState() {
    return _HealthDetailPage();
  }
}

class _HealthDetailPage extends State<AdviceDetailPage> {

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
            title: getPrimaryAppBarText(context, widget.adviceModel.title!),
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
                            widget.adviceModel.image!,
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
                                  widget.adviceModel.title!,
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

                            getCustomTextWidget(widget.adviceModel.time!,
                                primaryColor, 1, TextAlign.end, FontWeight.w500, getScreenPercentSize(context,1.5))

                          ],
                        ),


                        SizedBox(height: 8  ,),


                        // getTextWidgetWithSpacing(widget.adviceModel.desc!+"\n"+widget.adviceModel.desc!,
                        //     subTextColor,
                        //     TextAlign.start, FontWeight.w600, getScreenPercentSize(context,1.5)),
                        //

                        getTextWidgetWithSpacing(
                            widget.adviceModel.desc!,
                            subTextColor,
                            TextAlign.start,
                            FontWeight.w500,
                            getScreenPercentSize(context, 1.8)),

                        SizedBox(height: 8  ,),
                        // Row(
                        //   children: [
                        //     Expanded(
                        //       child: getCustomTextWidget(widget.adviceModel.time!,
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
