import 'package:app_lugares_customwidgets/BottonNavagationAndroid/BottonNavigationAndroid.dart';
import 'package:app_lugares_customwidgets/BottonNavagationiOS/BottonNavigationiOS.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    bool isIOS =  Theme.of(context).platform == TargetPlatform.iOS; 

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: (isIOS == true)?BottonNavigationiOS():BottonNavigationAndroid()
    );
  }
}

