import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_diet_tips/HomePage.dart';
import 'package:flutter_diet_tips/util/ConstantData.dart';
import 'package:flutter_diet_tips/util/ConstantWidget.dart';
import 'package:flutter_diet_tips/util/PrefData.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'FirstPage.dart';
import 'IntroPage.dart';
import 'SignUpPage.dart';
import 'generated/l10n.dart';
import 'config.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

  var configuredApp;
  const String environment = String.fromEnvironment('APP_ENV', defaultValue: 'PROD');

  switch (environment) {
    case 'LOCAL':
      configuredApp = MyApp(config: Config.local());
      break;
    case 'PROD':
      configuredApp = MyApp(config: Config.prod());
      break;
    default:
      throw Exception('Ambiente non riconosciuto: $environment');
  }

  runApp(
    configuredApp,
  );

}

class MyApp extends StatelessWidget {
  final Config config;

  const MyApp({Key? key, required this.config}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ConstantData.setThemePosition();

    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,

        S.delegate
      ],
      supportedLocales: [
        Locale('it', 'IT'), Locale('en', 'US'), Locale('en', 'GB')
      ],
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: primaryColor,
        primaryColorDark: primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      home: MyHomePage(
        title: "title",
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  bool _isSignIn = false;
  bool _isIntro = false;
  bool _isFirstTime = false;


  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor:primaryColor, // status bar color
    ));




    signInValue();


  }

  void signInValue() async {
    _isSignIn = await PrefData.getIsSignIn();
    _isIntro = await PrefData.getIsIntro();
    _isFirstTime = await PrefData.getIsFirstTime();


    Timer(Duration(seconds: 3), () {
      print("isIntro=----$_isIntro---$_isFirstTime");
      if (_isIntro) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => IntroPage()));
      } else if (!_isSignIn) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => SignUpPage(),
            ));
      } else {
        if (_isFirstTime) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FirstPage(),
              ));
        } else
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ));

      }
    });



  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(

      backgroundColor: cellColor,
      // backgroundColor: "#E9FFFD".toColor(),

      body: Center(
       child: Image.asset(ConstantData.assetsPath+"logo.png",height: getScreenPercentSize(context,22),),

      ),
    );
  }
}
