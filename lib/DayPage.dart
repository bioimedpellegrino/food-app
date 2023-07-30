import 'package:flutter/material.dart';
import 'package:flutter_diet_tips/util/ConstantData.dart';
import 'package:flutter_diet_tips/util/ConstantWidget.dart';
import 'package:flutter_diet_tips/util/DataFile.dart';
import 'package:flutter_diet_tips/util/SizeConfig.dart';

import 'DetailPage.dart';
import 'generated/l10n.dart';
import 'model/DayModel.dart';

class DayPage extends StatefulWidget {


  @override
  _DayPage createState() {
    return _DayPage();
  }
}

class _DayPage extends State<DayPage> {

  List<DayModel> list = DataFile.getDayList();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);


    double height = getScreenPercentSize(context, 22);

    return WillPopScope(
      onWillPop: () async {

        Navigator.of(context).pop();

        return true;
      },
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: getPrimaryAppBarText(context, S.of(context).daysDiet),
          backgroundColor: primaryColor,
          centerTitle: false,

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
        body: Container(
          width: double.infinity,
          height: double.infinity,
          margin: EdgeInsets.only(top: getScreenPercentSize(context, 1)),

          child: ListView.builder(
            shrinkWrap: true,
            itemCount: list.length,
            scrollDirection: Axis.vertical,itemBuilder: (context, index) {
            DayModel dayModel = list[index];

              return
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(dayModel.image!,dayModel.name!)));
                      // Navigator.push(context,MaterialPageRoute(builder: (context) => DetailPage(("",""){
                      //
                      //   Navigator.of(context).pop();
                      //
                      // }),));
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: getScreenPercentSize(context, 2),vertical: getScreenPercentSize(context, 1)),

                      height:  height,

                      child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(7)),
                        child: Stack(
                          children: [
                            Image.asset(
                              ConstantData.assetsPath + dayModel.image!,
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),


                            Positioned(
                              bottom: 0.0,
                              left: 0.0,
                              right: 0.0,
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      // List: [
                                      Color.fromARGB(200, 0, 0, 0),
                                      Color.fromARGB(0, 0, 0, 0)
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                child: Text(
                                  dayModel.name!,
                                  // 'No. ${imgList.indexOf(item)} image',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: height * 0.090,
                                    // fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                    ),
                  )
                // Container(
                //   child: ClipRRect(
                //       borderRadius: BorderRadius.all(Radius.circular(7)),
                //       child: Stack(
                //         children: <Widget>[
                //           Image.asset(
                //             ConstantData.assetsPath + list[index].image!,
                //             width: SizeConfig.safeBlockHorizontal! * 90,
                //             height: double.infinity,
                //             fit: BoxFit.cover,
                //           ),
                //           // Image.asset("assets/" + item.img,
                //           //     fit: BoxFit.cover,
                //           //     width: SizeConfig.safeBlockHorizontal * 90),
                //           Positioned(
                //             bottom: 0.0,
                //             left: 0.0,
                //             right: 0.0,
                //             child: Container(
                //               decoration: BoxDecoration(
                //                 gradient: LinearGradient(
                //                   colors: [
                //                     // List: [
                //                     Color.fromARGB(200, 0, 0, 0),
                //                     Color.fromARGB(0, 0, 0, 0)
                //                   ],
                //                   begin: Alignment.bottomCenter,
                //                   end: Alignment.topCenter,
                //                 ),
                //               ),
                //               padding: EdgeInsets.symmetric(
                //                   vertical: 10.0, horizontal: 20.0),
                //               child: Text(
                //                 list[index].name!,
                //                 style: TextStyle(
                //                   color: Colors.white,
                //                   fontSize: sliderHeight * 0.090,
                //                   // fontSize: 20.0,
                //                   fontWeight: FontWeight.bold,
                //                 ),
                //               ),
                //             ),
                //           ),
                //         ],
                //       )),
                // )
              ;
            },
          ),
          // child:  +
        ),
      ),
    );
  }

  getList() {

    return ListView.builder(
      shrinkWrap: true,
      itemCount: list.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
      return Container(
        margin: EdgeInsets.all(getScreenPercentSize(context, 2)),


        child: Stack(
          children: [
            // Image.asset(
            //   ConstantData.assetsPath + dayModel.image!,
            //   width: double.infinity,
            //   height: double.infinity,
            //   fit: BoxFit.cover,
            // ),


            // Positioned(
            //   bottom: 0.0,
            //   left: 0.0,
            //   right: 0.0,
            //   child: Container(
            //     decoration: BoxDecoration(
            //       gradient: LinearGradient(
            //         colors: [
            //           // List: [
            //           Color.fromARGB(200, 0, 0, 0),
            //           Color.fromARGB(0, 0, 0, 0)
            //         ],
            //         begin: Alignment.bottomCenter,
            //         end: Alignment.topCenter,
            //       ),
            //     ),
            //     padding: EdgeInsets.symmetric(
            //         vertical: 10, horizontal: 20.0),
            //     child: Text(
            //       dayModel.name!,
            //       // 'No. ${imgList.indexOf(item)} image',
            //       style: TextStyle(
            //         color: Colors.white,
            //         fontSize: height * 0.090,
            //         // fontSize: 20,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),

      );
    },);

  }
}
