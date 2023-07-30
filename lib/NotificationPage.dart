import 'package:flutter/material.dart';
import 'package:flutter_diet_tips/util/ConstantData.dart';
import 'package:flutter_diet_tips/util/ConstantWidget.dart';
import 'package:flutter_diet_tips/util/DataFile.dart';
import 'package:flutter_diet_tips/util/SizeConfig.dart';


import 'generated/l10n.dart';
import 'model/NotificationModel.dart';


class NotificationPage extends StatefulWidget {
  @override
  _NotificationPage createState() {
    return _NotificationPage();
  }
}

class _NotificationPage extends State<NotificationPage> {
  List<NotificationModel> orderTypeList = DataFile.getNotificationList();

  Future<bool> _requestPop() {
    Navigator.of(context).pop();
    return new Future.value(true);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {

    });
  }

  int colorPosition = -1;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    double margin = getScreenPercentSize(context, 3);
    double height = getScreenPercentSize(context, 12);
    double cellHeight = getPercentSize(height, 60);

    return WillPopScope(
        child: Scaffold(
            backgroundColor:  backgroundColor,

            // appBar: getThemeAppBar(S.of(context).notification, () {
            //   _requestPop();
            // }),


            appBar: AppBar(
              title: getPrimaryAppBarText(context, S.of(context).notification),
              backgroundColor: primaryColor,
              centerTitle: true,
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: getPrimaryAppBarIcon(),
                    onPressed: () {
                      _requestPop();
                    },
                  );
                },
              ),
            ),
            body: Container(
              margin: EdgeInsets.symmetric(vertical: margin),
              child: ListView.builder(
                itemCount: orderTypeList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {



                  return  Container(

                      margin: EdgeInsets.only(
                          bottom: (margin/1.5), right: (margin/2), left: (margin/2)),
                      padding: EdgeInsets.symmetric(horizontal: (margin/2),vertical: (margin/1.5)),
                      decoration: BoxDecoration(
                        color: cellColor,
                        borderRadius: BorderRadius.circular(
                            getScreenPercentSize(
                                context, 1.5)),
                        border: Border.all(
                            color: Colors.grey,
                            width: getWidthPercentSize(
                                context, 0.08)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Container(
                            height: cellHeight,
                            width: cellHeight,
                            margin: EdgeInsets.only(right: (margin/2)),

                            decoration:
                            BoxDecoration(shape: BoxShape.circle,color: primaryColor),
                            padding: EdgeInsets.all(
                                getPercentSize(
                                    cellHeight, 20)),
                            child: Icon(
                              Icons.notifications_none_outlined,
                              color: Colors.white,
                            ),
                          ),
                          Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      getTextWidget(
                                          orderTypeList[index].title!,
                                          Colors.black,
                                          TextAlign.start,
                                          FontWeight.w600,
                                          getPercentSize(
                                              height, 20)),
                                      new Spacer(),
                                      getTextWidget(
                                          orderTypeList[index].time!,
                                          Colors.grey,
                                          TextAlign.end,
                                          FontWeight.w300,
                                          getPercentSize(
                                              height, 12)),
                                    ],
                                  ),
                                  SizedBox(
                                    height: (margin / 3),
                                  ),
                                  getCustomText(
                                      orderTypeList[index].desc!,
                                      Colors.grey,
                                      3,
                                      TextAlign.start,
                                      FontWeight.w400,
                                      getPercentSize(
                                          height, 15)),
                                ],
                              ))
                          // ConstantWidget.getTextWidget(
                          //     orderTypeList[index].title,
                          //     ConstantData.mainTextColor,
                          //     TextAlign.center,
                          //     FontWeight.w600,
                          //     ConstantWidget.getPercentSize(height, 20)),
                        ],
                      ),

                  );
                },
              ),
            )),
        onWillPop: _requestPop);
  }
}
// we will assign delivery boy
