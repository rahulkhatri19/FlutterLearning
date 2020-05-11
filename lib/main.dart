import 'package:flutter/material.dart';
import 'package:flutterlearning/api_fetch/github_api/ApiHomePage.dart';
import 'package:flutterlearning/api_fetch/random_user/RandomApiPage.dart';
import 'package:flutterlearning/background_changer/BgHomePage.dart';
import 'package:flutterlearning/db_todo/NoteList.dart';
import 'package:flutterlearning/dice_roller/DiceHomePage.dart';
import 'package:flutterlearning/firebase_auth/FirebaseAuthPage.dart';
import 'package:flutterlearning/firebase_auth/SignInPage.dart';
import 'package:flutterlearning/firebase_auth/SignUpFirePage.dart';
import 'package:flutterlearning/firebase_realtime_db/FirebaseRtDbPage.dart';
import 'package:flutterlearning/navigation_drawer/DrawerPage.dart';
import 'package:flutterlearning/scratch_win/ScratchWinPage.dart';
import 'package:flutterlearning/signup/SignUpPage.dart';
import 'package:flutterlearning/spanish_audio/SpanishAudioPage.dart';
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
        "/signup" : (BuildContext context) => SignUpPage(),
        "/github_api" : (BuildContext context) => ApiHomePage(),
        "/random_api" : (BuildContext context) => RandomApiPage(),
        "/db_todo" : (BuildContext context) => NoteList(),
        "/firebaseauth": (BuildContext context) => FirebaseAuthPage(),
        "/signinpage": (BuildContext context) => SignInPage(),
        "/signupfirepage": (BuildContext context) => SignUpFirePage(),
        "/firebasecontact": (BuildContext context) => FirebaseRtDbPage()
      },
    );
  }
}