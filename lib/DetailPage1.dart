
import 'package:flutter/material.dart';
import 'package:flutter_diet_tips/model/DishModel.dart';
import 'package:flutter_diet_tips/util/ConstantData.dart';
import 'package:flutter_diet_tips/util/ConstantWidget.dart';
import 'package:image/image.dart' as img;
import 'package:palette_generator/palette_generator.dart';

class DetailPage1 extends StatefulWidget {
  final DishModel dishModel;

  DetailPage1(this.dishModel);

  @override
  _DetailPage1 createState() {
    return _DetailPage1();
  }
}

class _DetailPage1 extends State<DetailPage1> {
  void onBackClick() {
    Navigator.of(context).pop();
  }


  List<String> ingredientsList=["1 cup oats","1 tbps honey","1 tbps vanilla extract","4 sliced strawberries","1 banana,cut into slices"];

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
            title: getPrimaryAppBarText(context, ""),
            backgroundColor: cellColor,
            centerTitle: false,
            elevation: 0,
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: getAppBarIcon(),
                  onPressed: onBackClick,
                );
              },
            ),
          ),
          body: SafeArea(
            child: Container(
              child: Container(
                child: ListView(
                  children: [



                    FutureBuilder<PaletteGenerator>(
                        future: _updatePaletteGenerator(), // async work
                        builder: (BuildContext context, AsyncSnapshot<PaletteGenerator> snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting: return Center(child:CircularProgressIndicator());
                            default:
                              if (snapshot.hasError)
                                return Container(
                                  height: height,
                                );

                              else {
                                // Color color=new Color(snapshot.data.dominantColor.color);
                                return   Container(
                                  height: height,

                                  decoration: BoxDecoration(
                                      color: snapshot.data!.dominantColor!.color.withOpacity(0.3),

                                      image: DecorationImage(
                                        image: new ExactAssetImage(

                                          ConstantData.assetsPath + widget.dishModel.image!,
                                        ),
                                        fit: BoxFit.fitHeight,
                                      )
                                  ),

                                );
                              }}}),



                    Padding(
                      padding: EdgeInsets.all(margin),
                      child: Center(
                        child: getTextWidget(
                            widget.dishModel.title!,
                            textColor,
                            TextAlign.center,
                            FontWeight.w800,
                            getScreenPercentSize(context, 2)),
                      ),
                    ),


                    Padding(
                      padding: EdgeInsets.symmetric(vertical: margin),
                      child: Stack(
                        children: [


                          Container(

                            decoration: BoxDecoration(color: primaryColor),
                            padding: EdgeInsets.symmetric(vertical: getScreenPercentSize(context,0.5)),
                            child: Center(
                              child: getTextWidget(
                                  "Ingredients",
                                  Colors.white,
                                  TextAlign.center,
                                  FontWeight.w500,
                                  getScreenPercentSize(context, 2)),
                            ),
                          ),

                          // Center(
                          //     child: Container(
                          //   height: 0.8,
                          //   color: primaryColor,
                          //   width: double.infinity,
                          // )),
                          // Wrap(
                          //   children: <Widget>[
                          //     Center(
                          //         child: Container(
                          //           height:30,
                          //       decoration: BoxDecoration(color: primaryColor),
                          //       child: Center(
                          //         child: getTextWidget(
                          //             "Ingredients",
                          //             Colors.white,
                          //             TextAlign.center,
                          //             FontWeight.w500,
                          //             getScreenPercentSize(context, 2)),
                          //       ),
                          //     )),
                          //   ],
                          // )
                        ],
                      ),
                    )
,


                    ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(horizontal: margin),
                      itemCount: ingredientsList.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {

                        return Padding(
                          padding: EdgeInsets.all(margin/2),
                          child: new RichText(
                            text: new TextSpan(

                              children: <TextSpan>[
                                new TextSpan(
                                    text: '-  ',
                                    style: new TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.red,
                                        fontSize:
                                        getScreenPercentSize(
                                           context, 2))),
                                new TextSpan(
                                    text: ingredientsList[index],
                                    style: new TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: textColor,
                                        fontSize:
                                        getScreenPercentSize(
                                            context, 1.5))),
                              ],
                            ),
                          ),
                        );

                    },),


                    Padding(
                      padding: EdgeInsets.symmetric(vertical: margin),
                      child: Stack(
                        children: [


                          Container(

                            decoration: BoxDecoration(color: primaryColor),
                            padding: EdgeInsets.symmetric(vertical: getScreenPercentSize(context,0.5)),
                            child: Center(
                              child: getTextWidget(
                                  "Steps",
                                  Colors.white,
                                  TextAlign.center,
                                  FontWeight.w500,
                                  getScreenPercentSize(context, 2)),
                            ),
                          ),




                          // Center(
                          //     child: Container(
                          //   height: 0.8,
                          //   color: primaryColor,
                          //   width: double.infinity,
                          // )),
                          // Wrap(
                          //   children: <Widget>[
                          //     Center(
                          //         child: Container(
                          //           height:30,
                          //       decoration: BoxDecoration(color: primaryColor),
                          //       child: Center(
                          //         child: getTextWidget(
                          //             "Ingredients",
                          //             Colors.white,
                          //             TextAlign.center,
                          //             FontWeight.w500,
                          //             getScreenPercentSize(context, 2)),
                          //       ),
                          //     )),
                          //   ],
                          // )
                        ],
                      ),
                    )
,

                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: margin),
                      child: getTextWidget(
                          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
                          subTextColor,
                          TextAlign.center,
                          FontWeight.w400,
                          getScreenPercentSize(context, 1.8)),
                    )
                    // FutureBuilder(
                    //     future: _getColor("images_38.png"),
                    //     builder: (_, AsyncSnapshot<Color> data){
                    //       if (data.connectionState==ConnectionState.done){
                    //         return Container(
                    //           margin: EdgeInsets.only(top: getScreenPercentSize(context, 2)),
                    //           height: height,
                    //           color: data.data,
                    //
                    //           decoration: BoxDecoration(
                    //               image: DecorationImage(
                    //                 image: new ExactAssetImage(
                    //                   ConstantData.assetsPath +
                    //                       "images_38.png",
                    //                 ),
                    //                 fit: BoxFit.fitHeight,
                    //               )),
                    //         );
                    //       }
                    //       return Container(
                    //         // margin: EdgeInsets.only(top: getScreenPercentSize(context, 2)),
                    //         // height: height,
                    //
                    //
                    //       );
                    //     }
                    // ),

                    // SizedBox(
                    //   height: 15,
                    // ),
                  ],
                ),
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

  // _updatePalettes() async{
  //   final PaletteGenerator paletteGenerator = await PaletteGenerator.fromImageProvider(
  //
  //
  //   );
  //
  //
  //   paletteColor = paletteGenerator.darkMutedColor;
  //   //Here paletteColor is shown null value
  //
  // }
  //
  //
  //
  //
  //
  // Future<Color> paletteGenerator (ImageProvider imageProvider) async {
  //   final PaletteGenerator paletteGenerator = await PaletteGenerator
  //       .fromImageProvider(imageProvider);
  //   return paletteGenerator.dominantColor.color;
  // }

  // Future<Color> _getColor(String image) async {
  //   print("_getColor");
  //
  //   var allData;
  //
  //   //
  //   // rootBundle.load(ConstantData.assetsPath+image)
  //   //     .then((data) {
  //   //   allData=data;
  //   // });
  //
  //   ByteData bytes = await rootBundle.load(ConstantData.assetsPath + image);
  //
  //   setImageBytes(bytes);
  //
  //   double px = 1.0;
  //   double py = 0.0;
  //
  //   int pixel32 = photo!.getPixelSafe(px.toInt(), py.toInt());
  //   int hex = abgrToArgb(pixel32);
  //   print("Value of int: $hex ");
  //
  //   return Color(hex);
  // }
  //
  // void setImageBytes(imageBytes) {
  //   print("setImageBytes");
  //   List<int> values = imageBytes.buffer.asUint8List();
  //   photo = null;
  //   photo = img.decodeImage(values);
  // }
  //
  // int abgrToArgb(int argbColor) {
  //   print("abgrToArgb");
  //   int r = (argbColor >> 16) & 0xFF;
  //   int b = argbColor & 0xFF;
  //   return (argbColor & 0xFF00FF00) | (b << 16) | r;
  // }



  //
  // img.Image photo;
  //
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

//   Future<Color> _getColor() async {
//     print("_getColor");
//     Uint8List data;
//
//     try{
//       data =
//           (await NetworkAssetBundle(
//               Uri.parse(coverData)).load(coverData))
//               .buffer
//               .asUint8List();
//     }
//     catch(ex){
//       print(ex.toString());
//     }
//
//     print("setImageBytes....");
//     setImageBytes(data);
//
// //FractionalOffset(1.0, 0.0); //represents the top right of the [Size].
//     double px = 1.0;
//     double py = 0.0;
//
//     int pixel32 = photo.getPixelSafe(px.toInt(), py.toInt());
//     int hex = abgrToArgb(pixel32);
//     print("Value of int: $hex ");
//
//     return Color(hex);
//   }

  PaletteGenerator? paletteGenerator;
  Future<PaletteGenerator>_updatePaletteGenerator ()async
  {
    paletteGenerator = await PaletteGenerator.fromImageProvider(
      Image.asset(ConstantData.assetsPath+widget.dishModel.image!).image,
    );

    // if()
    return paletteGenerator!;
  }



}
