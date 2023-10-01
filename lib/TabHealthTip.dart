import 'package:flutter/material.dart';
import 'package:flutter_diet_tips/util/ConstantData.dart';
import 'package:flutter_diet_tips/util/ConstantWidget.dart';
import 'package:flutter_diet_tips/util/ApiService.dart';

import 'AdviceDetailPage.dart';
import 'model/AdviceModel.dart';

class TabHealthTip extends StatefulWidget {
  final ValueChanged<int> valueChanged;

  TabHealthTip(this.valueChanged);

  @override
  _TabHealthTip createState() {
    return _TabHealthTip();
  }
}

class _TabHealthTip extends State<TabHealthTip> {
  List<AdviceModel> globalAdviceList = [];
  List<AdviceModel> adviceList = [];

  int selectedPosition = 0;
  List<String> list = ["Consigli", "Sostituzioni"];

  @override
  void initState() {
    super.initState();

    setState(() {
      fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = getScreenPercentSize(context, 6);

    return WillPopScope(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: getPrimaryAppBarText(context, "Consigli"),
          backgroundColor: primaryColor,
          centerTitle: true,
          elevation: 0,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: getPrimaryAppBarIcon(),
                onPressed: (){
                  onBackPress();
                },
              );
            },
          ),
        ),
        body: SafeArea(
          child: Container(
            child: Container(
              child: Column(
                children: [
                  Container(
                    height: height,
                    child: ListView.builder(
                      itemCount: list.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        bool isSelected = (selectedPosition == index);
                        return InkWell(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: getTextWidget(
                                      list[index],
                                      (isSelected) ? textColor : subTextColor,
                                      TextAlign.start,
                                      (isSelected)
                                          ? FontWeight.w800
                                          : FontWeight.w500,
                                      getPercentSize(height, 35)),
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,

                                    child: Container(
                                      height: getScreenPercentSize(context, 0.5),
                                      width: getWidthPercentSize(context, 12),
                                      decoration: BoxDecoration(
                                          color:  (isSelected)
                                                ? primaryColor
                                                : Colors.transparent,
                                          borderRadius: BorderRadius.all(Radius.circular(getScreenPercentSize(context, 0.5)))
                                      ),
                                    )

                                  // child: Container(
                                  //   height: 5,
                                  //   width: getWidthPercentSize(context, 5),
                                  //   color: (isSelected)
                                  //       ? primaryColor
                                  //       : Colors.transparent,
                                  // ),
                                )
                              ],
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              selectedPosition = index;
                              adviceList = globalAdviceList.where((item) => item.type == list[selectedPosition]).toList();
                            });
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: adviceList.length,
                      itemBuilder: (context, index) {
                        double imgHeight = getScreenPercentSize(context, 30);
                        double radius = getScreenPercentSize(context, 1.5);
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      AdviceDetailPage(adviceList[index]),
                                ));
                          },
                          child: Card(
                            margin: EdgeInsets.all(
                                getScreenPercentSize(context, 1.8)),
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
                                        borderRadius:
                                            BorderRadius.circular(radius),
                                        image: DecorationImage(
                                          image: new NetworkImage(
                                            ConstantData.backendUrl +
                                                adviceList[index].image!,
                                          ),
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: getPercentSize(imgHeight, 80)),
                                    // margin: EdgeInsets.only(top: (height*1.7)),
                                    padding: EdgeInsets.all(
                                        getScreenPercentSize(context, 1.6)),
                                    decoration: BoxDecoration(
                                      color: cellColor,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(
                                              getScreenPercentSize(context, 4)),
                                          bottomRight: Radius.circular(radius),
                                          bottomLeft: Radius.circular(radius)),
                                    ),

                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                                child: getCustomTextWidget(
                                                    adviceList[index].title!,
                                                    textColor,
                                                    1,
                                                    TextAlign.start,
                                                    FontWeight.w700,
                                                    getScreenPercentSize(
                                                        context, 1.8))),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            GestureDetector(
                                              child: Icon(
                                                adviceList[index].isFav!?  Icons.favorite:  Icons.favorite_border,
                                                size: getScreenPercentSize(
                                                    context, 3),
                                                color: primaryColor,
                                              ),
                                              onTap: () {
                                               setState(() {
                                                 if (adviceList[index].isFav!) {
                                                   adviceList[index].isFav =
                                                   false;
                                                 } else {
                                                   adviceList[index].isFav =
                                                   true;
                                                 }
                                               });
                                              },
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        getCustomTextWidget(
                                            adviceList[index].desc!,
                                            subTextColor,
                                            3,
                                            TextAlign.start,
                                            FontWeight.w500,
                                            getScreenPercentSize(context, 1.8)),
                                        SizedBox(
                                          height: 8,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      onWillPop: () async {

onBackPress();
        return true;
      },
    );
  }

  void onBackPress() {
    widget.valueChanged(0);
  }

Future<void> fetchData() async {
  try {
    // Chiamata al tuo metodo asincrono per ottenere i dati dal backend.
    List<AdviceModel> fetchedData = await ApiService().getAdvices();

    setState(() {
      globalAdviceList = fetchedData;
      adviceList = globalAdviceList.where((item) => item.type == 'Consigli').toList();
    });
  } catch (e) {
    // Gestisci eventuali errori qui.
    print('Errore durante il recupero dei dati: $e');
  }
}
}
