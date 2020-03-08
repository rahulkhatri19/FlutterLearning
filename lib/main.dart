import 'package:flutter/material.dart';
import 'package:flutterlearning/background_changer/BgHomePage.dart';
import 'package:flutterlearning/dice_roller/DiceHomePage.dart';
import 'package:flutterlearning/navigation_drawer/DrawerPage.dart';
import 'package:flutterlearning/scratchwin/ScratchWinPage.dart';
import 'package:flutterlearning/spanishaudio/SpanishAudioPage.dart';
import 'package:flutterlearning/tictactoe/TictactoePage.dart';

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
        "/bg_change" : (BuildContext context) => BgHomePage(),
        "/dice_roll" : (BuildContext context) => DiceHomePage(),
        "/tictactoe" : (BuildContext context) => TictactoePage(), 
        "/scratchwin" : (BuildContext context) => ScratchWinPage(),
        "/spanishaudio" : (BuildContext context) => SpanishAudio(),
      },
    );
  }
}