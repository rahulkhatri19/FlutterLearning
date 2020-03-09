import 'package:flutter/material.dart';
import 'NumberAudio.dart';
import 'package:audioplayers/audio_cache.dart';
import 'dart:io';

class HomePageRow extends StatefulWidget {
  @override
  _HomePageRowState createState() => _HomePageRowState();
}

class _HomePageRowState extends State<HomePageRow> {

AudioCache audioPlayer = AudioCache();
List<NumberAudio> listNumAudio = [
  NumberAudio("one.wav", Colors.red, "One"), 
  NumberAudio("two.wav", Colors.blue, "Two"), 
  NumberAudio("three.wav", Colors.green, "Three"), 
  NumberAudio("four.wav", Colors.pink, "Four"), 
  NumberAudio("five.wav", Colors.brown, "Five"), 
  NumberAudio("six.wav", Colors.blueGrey, "Six"), 
  NumberAudio("seven.wav", Colors.teal, "Seven"), 
  NumberAudio("eight.wav", Colors.grey, "Eight"), 
  NumberAudio("nine.wav", Colors.orange, "Nine"), 
  NumberAudio("ten.wav", Colors.purple, "Ten")
]; 

play(String uri){
  audioPlayer.play(uri);
}
 raisedButton(String buttonText, MaterialColor buttonColor, String audioPath){
SizedBox(
  width: 100.0,
  height: 50.0,
  child: RaisedButton(
    color: Colors.black,// buttonColor
    child: Text("text", style: TextStyle(   //buttonText
      fontSize: 20.0,
      color: Colors.white
    ),
    ),
    onPressed: (){}, // play(audioPath)
  ),
);
 }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Spanish Number")
      ),
      body: Container( 
        child: Column(
        children: <Widget>[
Image(image: AssetImage("images/logo.png")),
Row(children: <Widget>[
  SizedBox(
  width: 100.0,
  height: 50.0,
  child: RaisedButton(
    color: listNumAudio[0].buttonColor,// buttonColor
    child: Text(listNumAudio[0].buttonText, style: TextStyle(   //buttonText
      fontSize: 20.0,
      color: Colors.white
    ),
    ),
    onPressed: play(listNumAudio[0].audioUri), // play(audioPath)
  ),
), 
RaisedButton(
    color: listNumAudio[0].buttonColor,// buttonColor
    child: Text(listNumAudio[0].buttonText, style: TextStyle(   //buttonText
      fontSize: 20.0,
      color: Colors.white
    ),
    ),
    onPressed: play(listNumAudio[0].audioUri), // play(audioPath)
  )
]),
  Row(
   children: <Widget>[
     RaisedBtnMethod(buttonText: listNumAudio[0].buttonText, buttonColor: listNumAudio[0].buttonColor, audioPath:listNumAudio[0].audioUri),
      RaisedBtnMethod(buttonText: listNumAudio[1].buttonText, buttonColor: listNumAudio[1].buttonColor, audioPath:listNumAudio[1].audioUri),
   ],
 ),
 Row(
   children: <Widget>[
     RaisedBtnMethod(buttonText: listNumAudio[2].buttonText, buttonColor: listNumAudio[2].buttonColor, audioPath:listNumAudio[2].audioUri),
      RaisedBtnMethod(buttonText: listNumAudio[3].buttonText, buttonColor: listNumAudio[3].buttonColor, audioPath:listNumAudio[3].audioUri),
   ],
 ),
 Row(
   children: <Widget>[
     RaisedBtnMethod(buttonText: listNumAudio[4].buttonText, buttonColor: listNumAudio[4].buttonColor, audioPath:listNumAudio[4].audioUri),
      RaisedBtnMethod(buttonText: listNumAudio[5].buttonText, buttonColor: listNumAudio[5].buttonColor, audioPath:listNumAudio[5].audioUri),
   ],
 ),
 Row(
   children: <Widget>[
     RaisedBtnMethod(buttonText: listNumAudio[6].buttonText, buttonColor: listNumAudio[6].buttonColor, audioPath:listNumAudio[6].audioUri),
      RaisedBtnMethod(buttonText: listNumAudio[7].buttonText, buttonColor: listNumAudio[7].buttonColor, audioPath:listNumAudio[7].audioUri),
   ],
 ),
 Row(
   crossAxisAlignment: CrossAxisAlignment.center,
   children: <Widget>[
     RaisedBtnMethod(buttonText: listNumAudio[8].buttonText, buttonColor: listNumAudio[8].buttonColor, audioPath:listNumAudio[8].audioUri),
      RaisedBtnMethod(buttonText: listNumAudio[9].buttonText, buttonColor: listNumAudio[9].buttonColor, audioPath:listNumAudio[9].audioUri),
   ],
 ),

         ],
      )
      ),
    );
  }
}

class RaisedBtnMethod extends StatefulWidget {
final String buttonText, audioPath;
final MaterialColor buttonColor;
  // filterChipWidget({Key key, this.chipName}) : super(key: key);
  RaisedBtnMethod({Key key, this.buttonText, this.buttonColor, this.audioPath}):super(key:key);
  @override
  _RaisedBtnMethodState createState() => _RaisedBtnMethodState();
}

class _RaisedBtnMethodState extends State<RaisedBtnMethod> {
AudioCache audioPlayer = AudioCache();
play(String uri){
  audioPlayer.play(uri);
}

  @override
  Widget build(BuildContext context) {
    return SizedBox(
  width: 100.0,
  height: 50.0,
  child: RaisedButton(
    color: widget.buttonColor,// buttonColor
    child: Text(widget.buttonText, style: TextStyle(   //buttonText
      fontSize: 20.0,
      color: Colors.white
    ),
    ),
    onPressed: play(widget.audioPath), // play(audioPath)
  ),
);
  }
}