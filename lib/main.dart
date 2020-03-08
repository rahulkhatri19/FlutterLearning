import 'package:flutter/material.dart';
import 'package:flutterlearning/background_changer/BgHomePage.dart';
import 'package:flutterlearning/navigation_drawer/DrawerPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Learning App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DrawerPage(),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        "/bg_change" : (BuildContext context) => BgHomePage() 
      },
    );
  }
}