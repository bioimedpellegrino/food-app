import 'package:flutter/material.dart';
import 'package:flutter_diet_tips/util/ConstantData.dart';
import 'package:flutter_diet_tips/util/ConstantWidget.dart';
import 'package:image/image.dart' as img;

class DetailPage extends StatefulWidget {
  // final DishModel dishModel;
  final String title;
  final String image;

  DetailPage(this.image, this.title);

  @override
  _DetailPage createState() {
    return _DetailPage();
  }
}

class _DetailPage extends State<DetailPage> {
  void onBackClick() {
    Navigator.of(context).pop();
  }

  List<String> ingredientsList = [
    "1 cup oats",
    "1 tbps honey",
    "1 tbps vanilla extract",
    "4 sliced strawberries",
    "1 banana,cut into slices"
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double margin = getScreenPercentSize(context, 2);
    double height = getScreenPercentSize(context, 30);

    return WillPopScope(
        child: Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            title: getPrimaryAppBarText(context, widget.title),
            backgroundColor: primaryColor,
            centerTitle: false,
            elevation: 0,
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
              child: ListView(
                children: [
                  Stack(
                    children: [
                      // FutureBuilder<PaletteGenerator>(
                      //     future: _updatePaletteGenerator(), // async work
                      //     builder: (BuildContext context,
                      //         AsyncSnapshot<PaletteGenerator> snapshot) {
                      //       switch (snapshot.connectionState) {
                      //         case ConnectionState.waiting:
                      //           return Center(child: CircularProgressIndicator());
                      //         default:
                      //           if (snapshot.hasError)
                      //             return Container(
                      //               height: height,
                      //             );
                      //           else {
                      //             // Color color=new Color(snapshot.data.dominantColor.color);
                      //             return Column(
                      //               children: [
                      //                 Container(
                      //                   height: height,
                      //                   decoration: BoxDecoration(
                      //                       color: snapshot.data!.darkMutedColor!.color
                      //                           .withOpacity(0.3),
                      //                       image: DecorationImage(
                      //                         image: new ExactAssetImage(
                      //                           // ConstantData.assetsPath + "homemade_receipe.jpg",
                      //                           ConstantData.assetsPath +
                      //                               widget.image,
                      //                         ),
                      //                         fit: BoxFit.fitWidth,
                      //                       )),
                      //                 ),
                      //
                      //
                      //
                      //
                      //
                      //               ],
                      //             );
                      //           }
                      //       }
                      //     }),

                      Column(
                        children: [
                          Container(
                            height: height,
                            decoration: BoxDecoration(
                                color: cellColor,
                                image: DecorationImage(
                                  image: new ExactAssetImage(
                                    // ConstantData.assetsPath + "homemade_receipe.jpg",
                                    ConstantData.assetsPath + widget.image,
                                  ),
                                  fit: BoxFit.fitWidth,
                                )),
                          ),
                        ],
                      ),

                      Container(

                        margin:
                            EdgeInsets.only(top: getPercentSize(height, 88)),
                        decoration: BoxDecoration(
                            color: cellColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(
                                    getScreenPercentSize(context, 4)),
                                topRight: Radius.circular(
                                    getScreenPercentSize(context, 4)))),
                        child: Column(
                          children: [
                            // Container(
                            //   margin: EdgeInsets.all(margin),
                            //   child: Column(
                            //     crossAxisAlignment: CrossAxisAlignment.start,
                            //     children: [
                            //       getTitle("Ingredients"),
                            //       getList(ingredientsList),
                            //     ],
                            //   ),
                            // ),
                            Container(
                              margin: EdgeInsets.all(margin),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  getTitle("Breakfast"),
                                  getList(ingredientsList),
                                ],
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.all(margin),


                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  getTitle("Lunch"),

                                  getList(ingredientsList),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(margin),



                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  getTitle("Dinner"),

                                  getList(ingredientsList),
                                ],
                              ),
                            ),







                          ],
                        ),
                      )
                    ],
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

  img.Image? photo;

  getList(List<String> list) {
    double margin = getScreenPercentSize(context, 2);
    double size = getScreenPercentSize(context, 1);
    // double size = getScreenPercentSize(context, 2.8);

    return
        // Card(
        //   color: cellColor,
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(7),
        //   ),
        //   child:

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
                      getScreenPercentSize(context, 2))
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
    );
    // )


  }

  getTitle(String s) {
    double margin = getScreenPercentSize(context, 1.5);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: margin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                vertical: getScreenPercentSize(context, 0.5)),
            child: Text(
              s,
              style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: getScreenPercentSize(context, 2.5),
                  color: textColor,
                  fontFamily: ConstantData.fontFamily,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
          ),
          Container(
            height: getScreenPercentSize(context, 0.5),
            width: getWidthPercentSize(context, 10),
            decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(getScreenPercentSize(context, 0.5)))
            ),
          )
        ],
      ),
    );
  }

  void setImageBytes(imageBytes) {
    print("setImageBytes");
    List<int> values = imageBytes.buffer.asUint8List();
    photo = null;
    photo = img.decodeImage(values);
  }

  // image lib uses uses KML color format, convert #AABBGGRR to regular #AARRGGBB
  int abgrToArgb(int argbColor) {
    print("abgrToArgb");
    int r = (argbColor >> 16) & 0xFF;
    int b = argbColor & 0xFF;
    return (argbColor & 0xFF00FF00) | (b << 16) | r;
  }

  // FUNCTION

}
