import 'package:flutter/material.dart';
import 'dart:math';

class BgHomePage extends StatefulWidget {
  @override
  _BgHomePageState createState() => _BgHomePageState();
}

class _BgHomePageState extends State<BgHomePage> {

   var colors = [
    Colors.amber,
    Colors.grey,
    Colors.blue,
    Colors.yellow,
    Colors.green,
    Colors.red,
    Colors.pink,
    Colors.orange
  ];
var currentColor = Colors.white;
var buttonColor = Colors.black;

setRandomColor(){
  var random = Random().nextInt(colors.length);
  var randomButton = Random().nextInt(colors.length);
  setState(() {
    currentColor = colors[random];
    buttonColor = colors[randomButton];
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Background'),
      ),
      body: Container(
      color: currentColor,
      child: Center(
        child: RaisedButton(
          onPressed: setRandomColor,
        color: buttonColor,
        padding: EdgeInsets.fromLTRB(35.0, 25.0, 35.0, 25.0),
        child: Text('Change Color !!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        ),
      ),
    ),
    );
  }
}