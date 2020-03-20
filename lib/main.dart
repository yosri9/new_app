import 'package:flutter/material.dart';
import 'package:news_app/screens/onboarding.dart';
import 'screens/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'utilities/app_theme.dart';

main() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool seen = prefs.getBool('seen') ;
  Widget _screen;
  if (seen ==null || seen == false ){
    _screen=OnBoarding();
    //go to home
  } else{
    _screen = homescreen();
  }
  runApp(MyApp(_screen));

}

class MyApp extends StatelessWidget{

  final Widget _screen ;
  MyApp(this._screen) ;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: Apptheme.appTheme ,
      home: this._screen,

    );
  }

}