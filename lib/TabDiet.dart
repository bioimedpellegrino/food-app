import 'package:carousel_slider/carousel_slider.dart';
import 'package:date_picker_timetable/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_diet_tips/model/CategoryModel.dart';
import 'package:flutter_diet_tips/util/ConstantData.dart';
import 'package:flutter_diet_tips/util/ConstantWidget.dart';
import 'package:flutter_diet_tips/util/DataFile.dart';
import 'package:flutter_diet_tips/util/SizeConfig.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:flutter_diet_tips/util/PrefData.dart';

import 'YourDietDetailPage.dart';
import 'model/FoodModel.dart';
import 'package:intl/intl.dart';

class TabDiet extends StatefulWidget {
  final ValueChanged<int> valueChanged;

  TabDiet(this.valueChanged);

  @override
  _TabDiet createState() {
    return _TabDiet();
  }
}

class _TabDiet extends State<TabDiet> {
  int categoryPosition = 0;
  DateTime dateTime = DateTime.now();
  final datePickerController = DatePickerController();

  List<String> list = ["Colazione", "Snack", "Pranzo", "Cena"];
  final controller = CarouselController();

  List<FoodModel> sliderList = DataFile.getFoodList();
  List<CategoryModel> categoryList = DataFile.getCategoryList();
  String firstName = "";
  String lastName = "";
   // AutoScrollController? _controller;

  @override
  void initState() {
    super.initState();
    // _controller = AutoScrollController(
    //     viewportBoundaryGetter: () =>
    //         Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
    //     axis: Axis.horizontal);

    getUserData();
  }

  getUserData() async {
    firstName = await PrefData().getFirstName();
    lastName = await PrefData().getLastName();

  }

  List<String> ingredientsList = [
    "1 red apple",
    "1 beet",
    "1 stick celery",
  ];

  List<String> ingredientsList1 = [
    "1 raspberries",
    "1 tsp ginger(optional)",
        "1 tbps vanilla extract",
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = getScreenPercentSize(context, 5);
    double appBarHeight = getScreenPercentSize(context, 13);
    double listHeight = getScreenPercentSize(context, 42);
    double radius1 = getPercentSize(appBarHeight, 25);
    double radius = getPercentSize(listHeight, 2);
    


    return WillPopScope(
      onWillPop: () async {
        widget.valueChanged(0);
        return true;
      },
      child: Scaffold(
        backgroundColor: backgroundColor,
        // appBar: AppBar(
        //   title: getPrimaryAppBarText(context, S.of(context).appname),
        //   backgroundColor: primaryColor,
        //   centerTitle: true,
        //   leading: null,
        // ),
        body: SafeArea(
          child: Container(
            child: Column(
              children: [

                Container(

                  width: double.infinity,

                  padding: EdgeInsets.symmetric(
                      horizontal: getScreenPercentSize(context, 2)),


                  height: appBarHeight,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(radius1*1.5),
                          // bottomRight: Radius.circular(radius1)
                      )

                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: getWidthPercentSize(context, 4),),
                      Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: (){

                                  // PrefData.setIsSignIn(false);
                                  // PrefData.setIsFirstTime(true);
                                  //
                                  //
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //       builder: (context) => SignUpPage(),
                                  //     ));

                                },
                                child: getTextWidget(
                                    "Ciao, ${firstName} ${lastName}" ,
                                    Colors.white,
                                    TextAlign.start,
                                    FontWeight.w600,
                                    getPercentSize(
                                        appBarHeight, 22)),
                              ),

                              SizedBox(height: getPercentSize(
                                  appBarHeight, 3),),
                              getTextWidget(
                                  "Ecco il tuo piano di oggi",
                                  Colors.white70,
                                  TextAlign.start,
                                  FontWeight.w300,
                                 getPercentSize(
                                      appBarHeight, 12)),
                            ],
                          )


                      ),

                    ],
                  ),
                ),


                Expanded(
                  child: ListView(
                    children: [
                      // CarouselSlider(
                      //   carouselController: controller,
                      //   options: CarouselOptions(
                      //       height: sliderHeight,
                      //       viewportFraction: 0.7,
                      //       autoPlay: true,
                      //       autoPlayInterval: Duration(seconds: 3),
                      //       aspectRatio: 1.0,
                      //       enlargeCenterPage: true,
                      //       onPageChanged: (index, reason) {
                      //         setState(() {
                      //           _current = index;
                      //         });
                      //       },
                      //       enlargeStrategy: CenterPageEnlargeStrategy.height),
                      //   items: imageSliders,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: sliderList.map((url) {
                      //     int index = sliderList.indexOf(url);
                      //     return Container(
                      //       width: 8.0,
                      //       height: 8.0,
                      //       margin:
                      //           EdgeInsets.symmetric(vertical: 4.0, horizontal: 2.0),
                      //       decoration: BoxDecoration(
                      //         shape: BoxShape.circle,
                      //         color:
                      //             _current == index ? primaryColor : disableIconColor,
                      //       ),
                      //     );
                      //   }).toList(),
                      // ),
                      //
                      //
                      //
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: (){
                                goToLastWeek();
                              },
                              child: Icon(
                                Icons.chevron_left,
                                size: getScreenPercentSize(context, 3),
                                color: primaryColor,
                              )
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 5),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: getTextWidget(
                                  getWeekString(),
                                  primaryColor,
                                  TextAlign.start,
                                  FontWeight.bold,
                                  getScreenPercentSize(context, 2)),
                            ),
                            GestureDetector(
                              onTap: (){
                                goToNextWeek();
                              },
                              child: Icon(
                                Icons.navigate_next,
                                size: getScreenPercentSize(context, 3),
                                color: primaryColor,
                              )
                            )
                          ],
                        ),
                      ),

                      Container(
                        height: 100,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                        color: cellColor,
                        child: DatePicker(
                          DateTime.now(),
                          controller: datePickerController,
                          initialSelectedDate: DateTime.now(),
                          selectionColor: primaryColor,
                          selectedTextColor: Colors.white,
                          // dayTextStyle: TextStyle(color: textColor),
                          dayTextStyle: TextStyle(color: textColor,fontWeight: FontWeight.w400,fontSize: getScreenPercentSize(context, 1.5)),

                          monthTextStyle: TextStyle(color: textColor,fontWeight: FontWeight.w400,fontSize: getScreenPercentSize(context, 1.5)),
                          dateTextStyle: TextStyle(color: textColor,fontWeight: FontWeight.w800),
                          locale: 'it_IT',
                          onDateChange: (date) {
                            setState(() {
                              dateTime = date;
                            });
                          },
                        ),
                      ),

                      Container(
                        height: height,
                        margin: EdgeInsets.symmetric(
                            vertical: getScreenPercentSize(context, 2)),
                        child: ListView.builder(
                          itemCount: list.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            bool isSelected = categoryPosition == index;
                            return InkWell(
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 8),
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    // color: (isSelected)?primaryColor:Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(4))),
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: getTextWidget(
                                          list[index],
                                          (isSelected) ? textColor : textColor,
                                          TextAlign.start,
                                          (isSelected)
                                              ? FontWeight.w800
                                              : FontWeight.w500,
                                          getPercentSize(height, 40)),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Container(
                                        height: getScreenPercentSize(context, 0.5),
                                        width: getWidthPercentSize(context, 10),
                                        color: (isSelected)
                                            ? primaryColor
                                            : Colors.transparent,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              onTap: ()async {
                                // await _controller!.scrollToIndex(categoryPosition,
                                //     preferPosition: AutoScrollPosition.begin);


                                setState(() {
                                  categoryPosition = index;

                                });
                              },
                            );
                          },
                        ),
                      ),

                      Container(
                        height: listHeight,
                        margin:
                            EdgeInsets.only(bottom: getScreenPercentSize(context, 2)),
                        child: ListView.builder(
                          // controller: _controller,

                          itemCount: sliderList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            double imgHeight = getPercentSize(listHeight, 60);
                            // double imgHeight = getPercentSize(listHeight, 50);
                            double remainHeight = listHeight - imgHeight;
                            return InkWell(
                              child: VisibilityDetector(
                                key: Key(index.toString()),
                                onVisibilityChanged: (VisibilityInfo info) {
                                  if (info.visibleFraction == 1)
                                    setState(() {
                                      categoryPosition = index;
                                    });
                                },


                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(radius)),
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                                  color: cellColor,
                                  child: Container(
                                    width: getWidthPercentSize(context, 75),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(radius),
                                              topLeft: Radius.circular(radius)),
                                          child: Stack(
                                            children: [
                                              Image.asset(
                                                ConstantData.assetsPath +
                                                    sliderList[index].image!,
                                                height: imgHeight,
                                                width: double.infinity,
                                                fit: BoxFit.fill,
                                              ),

                                              Container(
                                                height: imgHeight,
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          Colors.black45,
                                                          Colors.black54,
                                                        ],
                                                        begin: Alignment.topCenter,
                                                        end: Alignment.bottomCenter,
                                                )
                                                  ),
                                              )
                                              ,
                                              Positioned.fill(
                                                child: Align(
                                                  alignment: Alignment.bottomLeft,
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: getPercentSize(
                                                            remainHeight, 5),
                                                        vertical: getPercentSize(
                                                            remainHeight, 6)),
                                                    child: getTextWidget(
                                                        sliderList[index].title!,
                                                        Colors.white,
                                                        TextAlign.start,
                                                        FontWeight.w800,
                                                        getPercentSize(remainHeight, 15)),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: getPercentSize(remainHeight, 3),
                                              ),

                                              Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: getPercentSize(
                                                          remainHeight, 5)),
                                                  child: getList(
                                                      (index % 2==0)?ingredientsList:ingredientsList1, remainHeight)),
                                              // getCustomText(
                                              //     sliderList[index].desc!,
                                              //     subTextColor,2,
                                              //     TextAlign.start,
                                              //     FontWeight.w600,
                                              //     getPercentSize(remainHeight, 8)),
                                              //
                                              //

                                              SizedBox(
                                                height: getPercentSize(remainHeight, 5),
                                              )
                                              //
                                              //
                                              ,
                                              Expanded(
                                                child: Container(
                                                  height: double.infinity,
                                                  color: primaryColor.withOpacity(0.1),
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal:
                                                          getPercentSize(remainHeight, 5),
                                                      vertical: getPercentSize(
                                                          remainHeight, 3)),
                                                  child: Row(
                                                    children: [
                                                      getCell(remainHeight, primaryColor,
                                                          "Protein", "530"),
                                                      Expanded(
                                                        child: SizedBox(),
                                                        flex: 1,
                                                      ),
                                                      getCell(remainHeight, Colors.red,
                                                          "Fat", "120"),
                                                      Expanded(
                                                        child: SizedBox(),
                                                        flex: 1,
                                                      ),
                                                      getCell(remainHeight, Colors.orange,
                                                          "Carbs", "250"),
                                                      Expanded(
                                                        child: SizedBox(),
                                                        flex: 1,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),

                                              // SizedBox(height: getPercentSize(remainHeight, 5),),
                                            ],
                                          ),
                                          flex: 1,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              onTap: () {
                                // setState(() {
                                //   categoryPosition = index;
                                // });
                                //

                                Navigator.push(context, MaterialPageRoute(builder: (context) => YourDietDetailPage(sliderList[index]),));
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  goToNextWeek(){
    setState(() {
      dateTime = dateTime.add(Duration(days: 7));
      datePickerController.animateToDate(dateTime);
    });  
  }

  goToLastWeek(){
    DateTime oneWeekAgo = dateTime.subtract(Duration(days: 7));
    DateTime today = DateTime.now();
    oneWeekAgo = oneWeekAgo.isBefore(today) ? today : oneWeekAgo;
    setState((){
      dateTime = oneWeekAgo;
    });
    datePickerController.animateToDate(dateTime);

  }

  getWeekString(){
    Intl.defaultLocale = 'it';
    DateTime friday = dateTime.add(Duration(days: 5));

    String sundayString = DateFormat('d MMM').format(dateTime);
    String fridayString = DateFormat('d MMM').format(friday);

    return '$sundayString - $fridayString';
  }

  getList(List<String> list, double height) {
    double margin = getPercentSize(height, 2);
    double size = getPercentSize(height, 3);

    return Stack(
      children: [
        ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.only(top: (margin / 2)),
          // padding: EdgeInsets.symmetric(vertical: (margin / 2)),
          itemCount: list.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: margin / 2),
              child: Row(
                children: [
                  Container(
                    height: size, width: size,
                    margin: EdgeInsets.only(right: margin),
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, color: primaryColor),
                    // child: Center(
                    //   child: getRobotoTextWidget((index+1).toString(),
                    //       Colors.white, TextAlign.center,FontWeight.w600, getPercentSize(size,50)),
                    //
                    // ),
                  ),
                  Expanded(
                      child: getRobotoTextWidget(
                          list[index],
                          textColor,
                          TextAlign.start,
                          FontWeight.w600,
                          getPercentSize(height, 8.5))
                          // getPercentSize(height, 7.5))
                      // child: new RichText(
                      //   text: new TextSpan(
                      //     children: <TextSpan>[
                      //       // new TextSpan(
                      //       //     text: '-  ',
                      //       //     style: new TextStyle(
                      //       //         fontWeight: FontWeight.w400,
                      //       //         color: Colors.red,
                      //       //         fontFamily: "Montserrat",
                      //       //         fontSize:
                      //       //         getScreenPercentSize(context, 2))),
                      //       new TextSpan(
                      //           text: list[index],
                      //           style: new TextStyle(
                      //               fontWeight: FontWeight.w500,
                      //               fontFamily: "Montserrat",
                      //               color: textColor,
                      //               fontSize: getScreenPercentSize(
                      //                   context, 1.6))),
                      //     ],
                      //   ),
                      // ),
                      ),
                ],
              ),
            );
          },
        ),


        Positioned.fill(
          child: Align(
            alignment: Alignment.centerRight,


            child: Image.asset(ConstantData.assetsPath+"right-arrow.png",height: getScreenPercentSize(context, 2),color: textColor,),
            // child: Container(
            //   height: circle,
            //   width: circle,
            //   // decoration: BoxDecoration(
            //   //   shape: BoxShape.circle,
            //   //   color: primaryColor,
            //   // ),
            //   // child: Center(
            //     // child: Icon(Icons.more_vert,color: primaryColor
            //     //   ,size: getPercentSize(circle, 90),),
            //     // child: Icon(Icons.navigate_next,color: Colors.white,size: getPercentSize(circle, 70),),
            //   // ),
            // ),
          ),
        )




      ],
    );
    // )


  }

  getCell(double height, Color color, String s, String s1) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.circle,
              color: color,
              size: getPercentSize(height, 5),
            ),

            SizedBox(
              width: getWidthPercentSize(context, 1),
            ),
            // Expanded(
            //   child:
            getTextWidget(s, subTextColor, TextAlign.start, FontWeight.w600,
                getPercentSize(height, 8)),
            // )
          ],
        ),
        // Expanded(
        //   child:
        getTextWidget(s1, textColor, TextAlign.center, FontWeight.bold,
            getPercentSize(height, 10)),
        // )
      ],
    );
  }
}
