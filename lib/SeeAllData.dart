import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_diet_tips/model/CategoryModel.dart';
import 'package:flutter_diet_tips/util/ConstantData.dart';
import 'package:flutter_diet_tips/util/ConstantWidget.dart';
import 'package:flutter_diet_tips/util/DataFile.dart';
import 'package:flutter_diet_tips/util/SizeConfig.dart';

import 'DayPage.dart';
import 'generated/l10n.dart';

class SeeAllData extends StatefulWidget {


  @override
  _SeeAllData createState() {
    return _SeeAllData();
  }
}

class _SeeAllData extends State<SeeAllData> {
  final controller = CarouselController();

  List<CategoryModel> categoryList = DataFile.getCategoryList();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);



    return WillPopScope(
      onWillPop: () async {

        Navigator.of(context).pop();

        return true;
      },
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: getPrimaryAppBarText(context, S.of(context).categories),
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
          child: ListView(
            children: [



              getCategoryList()
            ],
          ),
        ),
      ),
    );
  }

  getCategoryList() {
    SizeConfig().init(context);

    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 1.2,
      padding: EdgeInsets.all(7),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: List.generate(categoryList.length, (index) {
        CategoryModel categoryModel = categoryList[index];
        return InkWell(
          onTap: () {
            Navigator.push(context,MaterialPageRoute(builder: (context) => DayPage(),));

          },
          child: Card(
            color: cellColor,
            elevation: 1.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 5, top: 5, right: 5),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(7),
                        child: Image.asset(
                          ConstantData.assetsPath + categoryModel.image!,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        )),
                  ),
                  flex: 1,
                ),
                new Padding(
                  padding: EdgeInsets.all(8),
                  child: getCustomTextWidget(
                      categoryModel.title!,
                      textColor,
                      2,
                      TextAlign.start,
                      FontWeight.w600,
                      getWidthPercentSize(context, 4)),
                ),
              ],
            ),
          ),
        );
      }),
    );

  }
}
