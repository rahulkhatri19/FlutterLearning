import 'package:flutter/material.dart';
import 'dart:math';

class DiceHomePage extends StatefulWidget {
  @override
  _DiceHomePageState createState() => _DiceHomePageState();
}

class _DiceHomePageState extends State<DiceHomePage> {

  AssetImage one = AssetImage("images/dice/one.png");
  AssetImage two = AssetImage("images/dice/two.png");
  AssetImage three = AssetImage("images/dice/three.png");
  AssetImage four = AssetImage("images/dice/four.png");
  AssetImage five = AssetImage("images/dice/five.png");
  AssetImage six = AssetImage("images/dice/six.png");

  AssetImage diceOne;
  AssetImage diceTwo;

  @override
  void initState() {
    super.initState();
    setState(() {
      diceOne = one;
      diceTwo = two;
    });
  }

  void diceRoller(){
    int randomOne = Random().nextInt(5);
    int randomTwo = Random().nextInt(5);

    AssetImage imageOne;
    AssetImage imageTwo;

    switch (randomOne) {
      case 0: imageOne = one;
        break;
      case 1: imageOne = two;
      break;
      case 2: imageOne = three;
        break;
      case 3: imageOne = four;
        break;
      case 4: imageOne = five;
        break;
      case 5: imageOne = six;
        break;
    }

    switch (randomTwo) {
      case 0: imageTwo = one;
        break;
      case 1: imageTwo = two;
        break;
      case 2: imageTwo = three;
        break;
      case 3: imageTwo = four;
        break;
      case 4: imageTwo = five;
        break;
      case 5: imageTwo = six;
        break;

      default:
    }

    setState(() {
      diceOne = imageOne;
      diceTwo = imageTwo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dice Roller'),
        ),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row( mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(image: diceOne, 
                    width: 150.0,
                    height: 200.0,              
                ),
                Padding(padding: EdgeInsets.all(10.0),),
                Image(image: diceTwo,              
                      width: 150.0,
                      height: 200.0,),
                ],),         
                Container(
                  margin: EdgeInsets.only(top: 100.0),
                  child: RaisedButton(
                    onPressed: diceRoller,
                    color: Color(0xFF304ffe) ,
                    padding: EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
                    child: Text('Roll the Dice', style: TextStyle(color: Color(0xFFFFFFFF))),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60.0), )
                    )
                    ,
                )
              ],
              ),
              ),
              ),
        );
  
  }
}