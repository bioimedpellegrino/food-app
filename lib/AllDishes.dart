import 'package:flutter/material.dart';
import 'package:flutter_diet_tips/util/ConstantData.dart';
import 'package:flutter_diet_tips/util/ConstantWidget.dart';
import 'package:flutter_diet_tips/util/DataFile.dart';

import 'DetailPage.dart';
import 'generated/l10n.dart';
import 'model/DishModel.dart';

class AllDishes extends StatefulWidget {
  final ValueChanged<int> valueChanged;

  AllDishes(this.valueChanged);

  @override
  _AllDishes createState() {
    return _AllDishes();
  }
}

class _AllDishes extends State<AllDishes> {
  List<DishModel> dishList = DataFile.getDishList();

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double margin = getScreenPercentSize(context, 1.5);

    return WillPopScope(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          elevation: 0,
          title: getPrimaryAppBarText(context, S.of(context).dishes),
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
              child: ListView.builder(
                itemCount: 7,
                shrinkWrap: true,
                itemBuilder: (context, pos) {
                  double width = getWidthPercentSize(context, 33);
                  double height = getScreenPercentSize(context, 30);
                  double cellHeight = getPercentSize(height, 78);
                  double remainSize = height-cellHeight;
                  dishList = dishList.reversed.toList();

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(margin),
                        child: getBoldTextWidget(
                            "Day " + (pos + 1).toString(),
                            textColor,
                            TextAlign.start,
                            FontWeight.bold,
                            getScreenPercentSize(context, 3)),
                      ),
                      Container(
                        height: height,
                        margin: EdgeInsets.symmetric(vertical: margin),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: dishList.length,
                          itemBuilder: (context, index) {

                            DishModel model = dishList[index];
                            return InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                    DetailPage(model.image!,"Day " + (pos + 1).toString(),),));
                                    // DetailPage(model.image!,"Day " + (pos + 1).toString(), "Day " + (pos + 1).toString()),));
                              },
                              child: Container(
                                width: width,
                                margin: EdgeInsets.only(left: margin,right: (index==dishList.length-1)?margin:0),
                                child: Column(
                                  children: [
                                    Container(
                                      height: cellHeight,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  getPercentSize(width, 6))),
                                          color: cellColor,
                                          image: DecorationImage(
                                            image: new ExactAssetImage(
                                              ConstantData.assetsPath +
                                                  // "homemade_receipe.jpg",
                                                  dishList[index].image!,
                                            ),
                                            fit: BoxFit.cover,
                                          )),
                                    ),


                                    SizedBox(height:getPercentSize(remainSize,
                                        12) ,),
                                    getCustomTextWidget(dishList[index].title!,
                                        textColor, 2, TextAlign.center, FontWeight.w800, getPercentSize(remainSize,27))

                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
      onWillPop: () async {
        widget.valueChanged(0);

        return true;
      },
    );
  }
}
