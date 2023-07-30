
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_diet_tips/util/ConstantData.dart';
import 'package:flutter_diet_tips/util/ConstantWidget.dart';
import 'package:flutter_diet_tips/util/DataFile.dart';
import 'package:flutter_diet_tips/util/SizeConfig.dart';


import 'generated/l10n.dart';
import 'model/ModelReminder.dart';



class ReminderList extends StatefulWidget {
  @override
  _ReminderList createState() => _ReminderList();
}

class _ReminderList extends State<ReminderList> {

  List<String> countries = <String>[
    'Belgium',
    'France',
    'Italy',
    'Germany',
    'Spain',
    'Portugal'
  ];
  bool checkboxValueCity = true;
  List<String> allCities = ['Sun', 'Mon', 'Tue', "Wed", "Thu", "Fri", "Sat"];
  List<String> selectedCities = [];
  List<String> selectedCitiesTemp = [];
  List<ModelReminder> reminderList = DataFile.getReminderList();
  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

  @override
  Widget build(BuildContext context) {


    SizeConfig().init(context);
    return WillPopScope(
      child: Scaffold(

        backgroundColor: backgroundColor,
        appBar: AppBar(
          elevation: 0,
          title: getPrimaryAppBarText(context, S.of(context).reminder),
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




        body: Container(
          margin: EdgeInsets.all(5),
          child: ListView.builder(
            primary: true,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: reminderList.length,
            itemBuilder: (context, index) {
              print("inrec1==true");
              ModelReminder modelReminder = reminderList[index];
              return Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.only(left: 7, right: 7),
                width: double.infinity,
                height: SizeConfig.safeBlockVertical! * 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: cellColor),
                // height: double.infinity,
                // width: SizeConfig.safeBlockHorizontal * 30,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: getSmallNormalText(
                              S.of(context).reminder,
                              subTextColor),
                          flex: 1,
                        ),
                        Switch(
                          activeColor: primaryColor,
                          inactiveTrackColor: subTextColor,
                          value: modelReminder.ison!,
                          onChanged: (value) {
                         setState(() {

                           if( reminderList[index].ison!){
                             reminderList[index].ison=false;
                           }else{
                             reminderList[index].ison=true;
                           }
                         });

                          },
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: getSmallBoldText(
                              modelReminder.time!, textColor),
                          flex: 1,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        getSmallBoldText(S.of(context).repeat + " - ",
                            primaryColor),
                        Expanded(
                          child: Text(
                            modelReminder.repeat!.replaceAll("[","").replaceAll("]","").replaceAll("\"",""),
                            style: TextStyle(
                                fontSize: 14,
                                color:subTextColor,
                                fontFamily: ConstantData.fontFamily,
                                fontWeight: FontWeight.w400),
                            maxLines: 1,
                          ),
                          flex: 1,
                        ),
                        GestureDetector(
                          child: Icon(
                            CupertinoIcons.delete,
                            color: primaryColor,
                          ),
                          onTap: () {


                          },
                        )
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: primaryColor,
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return _MyDialog(
                    cities: allCities,
                    selectedCities: selectedCities,
                    onSelectedCitiesListChanged: (cities) {
                      setState(() {
                        selectedCitiesTemp = cities;
                      });
                    },
                    onSelectedValue: (values) {
                      // showTimePicker()
                  showTimePicker(
                        initialTime: TimeOfDay.now(),
                        context: context,
                      ).then((value) {








                        return value!;
                      });
                    },
                  );
                });
            // _showDialog();
          },
        ),
      ),
      onWillPop: () async {
        onBackClick();
        return false;
      },
    );
  }



  void onBackClick() {
    Navigator.of(context).pop();
  }
}



class _MyDialog extends StatefulWidget {
  _MyDialog(
      {this.cities,
      this.selectedCities,
      this.onSelectedCitiesListChanged,
      this.onSelectedValue});

  final List<String>? cities;
  final List<String>? selectedCities;
  final ValueChanged<List<String>>? onSelectedCitiesListChanged;
  final ValueChanged<List<String>>? onSelectedValue;

  @override
  _MyDialogState createState() => _MyDialogState();
}

class _MyDialogState extends State<_MyDialog> {
  List<String> _tempSelectedCities = [];

  @override
  void initState() {
    _tempSelectedCities = widget.selectedCities!;
    // _tempSelectedCities=widget.cities;
    super.initState();
  }

  @override
  Widget build(BuildContext contextz) {
    return Dialog(
        child: Container(
      height: 500,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(7),
                child: Text(
                  "select days",
                  style: TextStyle(fontSize: 18.0, color: textColor),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: widget.cities!.length,
                itemBuilder: (BuildContext context, int index) {
                  final cityName = widget.cities![index];
                  return Container(
                    child: CheckboxListTile(
                        title: Text(cityName),
                        value: _tempSelectedCities.contains(cityName),
                        onChanged: (bool? value) {
                          if (value!) {
                            if (!_tempSelectedCities.contains(cityName)) {
                              setState(() {
                                _tempSelectedCities.add(cityName);
                              });
                            }
                          } else {
                            if (_tempSelectedCities.contains(cityName)) {
                              setState(() {
                                _tempSelectedCities.removeWhere(
                                    (String city) => city == cityName);
                              });
                            }
                          }
                          widget.onSelectedCitiesListChanged!(_tempSelectedCities);
                        }),
                  );
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: getSmallBoldText("OK", Theme.of(context).primaryColor),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  widget.onSelectedValue!(_tempSelectedCities);
                },
              ),
            ],
          )
        ],
      ),
    ));
  }
}



