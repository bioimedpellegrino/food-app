import 'package:flutter/material.dart';
import 'package:flutter_diet_tips/util/ConstantData.dart';
import 'package:flutter_diet_tips/util/ConstantWidget.dart';
import 'package:flutter_diet_tips/util/DataFile.dart';

import 'HealthDetailPage.dart';
import 'generated/l10n.dart';
import 'model/HealthModel.dart';

class FavouritePage extends StatefulWidget{




  @override
  _FavouritePage createState() {
    return _FavouritePage();
  }

}

class _FavouritePage extends State<FavouritePage>{

  List<HealthModel> healthList=[];




  @override
  void initState() {
    super.initState();

    setState(() {

      healthList = DataFile.getHealthList();


    });
  }


  @override
  Widget build(BuildContext context) {


    return WillPopScope(child: Scaffold(


      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        title: getPrimaryAppBarText(context, S.of(context).favourite),
        backgroundColor: primaryColor,
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: getPrimaryAppBarIcon(),
              onPressed: (){
                Navigator.of(context).pop();
              },
            );
          },
        ),

      ),
    body: SafeArea(
      child: Container(
        child: Container(


          child:      Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: healthList.length,
              itemBuilder: (context, index) {

                double imgHeight = getScreenPercentSize(context,30);
                double radius = getScreenPercentSize(context, 1.5);
                return InkWell(
                  onTap: (){

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              HealthDetailPage(healthList[index]),
                        ));
                  },
                  child: Card(
                    margin: EdgeInsets.all( getScreenPercentSize(context, 1.8)),



                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(radius),
                    ),
                    color: cellColor,

                    child: Container(


                      child: Stack(
                        children: [
                          Container(
                            height: imgHeight,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(radius),

                                image: DecorationImage(
                                  image: new ExactAssetImage(
                                    ConstantData.assetsPath + healthList[index].image!,
                                  ),
                                  fit: BoxFit.cover,
                                )),
                          )
                          ,
                          Container(
                            margin: EdgeInsets.only(top: getPercentSize(imgHeight,80)),
                            // margin: EdgeInsets.only(top: (height*1.7)),
                            padding: EdgeInsets.all(getScreenPercentSize(context,1.6)),
                            decoration: BoxDecoration(
                              color: cellColor,
                              borderRadius: BorderRadius.only(topLeft:
                              Radius.circular(getScreenPercentSize(context,4)),bottomRight: Radius.circular(radius),bottomLeft: Radius.circular(radius))

                              ,
                            ),

                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(child: getCustomTextWidget(healthList[index].title!,
                                        textColor, 1, TextAlign.start, FontWeight.w700, getScreenPercentSize(context,1.8))),

                                    SizedBox(width: 5,)
                                    ,Icon(Icons.favorite,size: getScreenPercentSize(context, 3),color: primaryColor,)
                                  ],
                                ),

                                SizedBox(height: 8  ,),
                                getCustomTextWidget(healthList[index].desc!,
                                    subTextColor, 3,
                                    TextAlign.start, FontWeight.w500, getScreenPercentSize(context,1.8)),
                                SizedBox(height: 8  ,),


                                Row(
                                  children: [
                                    Expanded(
                                      child: getCustomTextWidget(healthList[index].time!,
                                          primaryColor, 1, TextAlign.end, FontWeight.w500, getScreenPercentSize(context,1.5)),
                                    ),

                                  ],
                                )


                              ],
                            ),
                          )

                        ],
                      ),
                    ),
                  ),
                );
              },),
          ),
        ),
      ),
    ),
  ),  onWillPop: () async {
      Navigator.of(context).pop();

      return true;
    },);
  }

}