import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_diet_tips/model/CategoryModel.dart';
import 'package:flutter_diet_tips/util/ConstantData.dart';
import 'package:flutter_diet_tips/util/ConstantWidget.dart';
import 'package:flutter_diet_tips/util/DataFile.dart';
import 'package:flutter_diet_tips/util/SizeConfig.dart';

import 'DayPage.dart';
import 'SeeAllData.dart';
import 'generated/l10n.dart';
import 'model/SliderModel.dart';

class TabHome extends StatefulWidget {
  final ValueChanged<int> valueChanged;

  TabHome(this.valueChanged);

  @override
  _TabHome createState() {
    return _TabHome();
  }
}

class _TabHome extends State<TabHome> {
  int _current = 0;
  final controller = CarouselController();

  List<SliderModel> sliderList = DataFile.getSliderList();
  List<CategoryModel> categoryList = DataFile.getCategoryList();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sliderHeight = SizeConfig.safeBlockVertical! * 30;
    double margin = getScreenPercentSize(context, 1.5);

    final List<Widget> imageSliders = sliderList
        .map((item) => Container(
            height: double.infinity,
            width: double.infinity,
            child: Container(
              height: double.infinity,
              margin: EdgeInsets.all(margin),
              child: InkWell(
                onTap: () {
                  widget.valueChanged(1);
                },
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                    child: Stack(
                      children: <Widget>[
                        Image.asset(
                          ConstantData.assetsPath + item.image!,
                          width: SizeConfig.safeBlockHorizontal! * 90,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        // Image.asset("assets/" + item.img,
                        //     fit: BoxFit.cover,
                        //     width: SizeConfig.safeBlockHorizontal * 90),
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
                                vertical: 10.0, horizontal: 20.0),
                            child: Text(
                              item.title!,
                              // 'No. ${imgList.indexOf(item)} image',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: sliderHeight * 0.090,
                                // fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            )))
        .toList();

    return WillPopScope(
      onWillPop: () async {
        widget.valueChanged(0);

        return true;
      },
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: getPrimaryAppBarText(context, S.of(context).categories),
          backgroundColor: primaryColor,
          centerTitle: true,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: getPrimaryAppBarIcon(),
                onPressed: () {
                  widget.valueChanged(0);
                },
              );
            },
          ),
        ),
        body: Container(
          child: ListView(
            children: [
              CarouselSlider(
                carouselController: controller,
                options: CarouselOptions(
                    height: sliderHeight,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    },
                    enlargeStrategy: CenterPageEnlargeStrategy.height),
                items: imageSliders,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: sliderList.map((url) {
                  int index = sliderList.indexOf(url);
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 4.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          _current == index ? primaryColor : disableIconColor,
                    ),
                  );
                }).toList(),
              ),
              Padding(
                padding: EdgeInsets.all(margin),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: getTextWidget(
                            S.of(context).categories,
                            textColor,
                            TextAlign.start,
                            FontWeight.w700,
                            getWidthPercentSize(context, 4))),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SeeAllData(),
                            ));
                      },
                      child: getTextWidget(
                          S.of(context).seeAll,
                          primaryColor,
                          TextAlign.center,
                          FontWeight.w700,
                          getWidthPercentSize(context, 4)),
                    ),
                  ],
                ),
              ),
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
      children: List.generate(
          (categoryList.length >= 6) ? 6 : categoryList.length, (index) {
        CategoryModel categoryModel = categoryList[index];
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DayPage(),
                ));
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
                      1,
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
