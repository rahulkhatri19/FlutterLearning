import 'package:flutter/material.dart';
import 'dart:math';

class ScratchWinPage extends StatefulWidget {
  @override
  _ScratchWinPageState createState() => _ScratchWinPageState();
}

class _ScratchWinPageState extends State<ScratchWinPage> {

   // TODO:  import images

  AssetImage circle = AssetImage("images/scratchwin/circle.png");
  AssetImage lucky = AssetImage("images/scratchwin/rupee.png");
  AssetImage unLucky = AssetImage("images/scratchwin/sadFace.png");

  // TODO: get an Array

  List<String> itemArray;
  int luckyNumber;
  int gameOverCount = 0;
  bool isButtonUnable = true;
  String gameMessage = 'Scratch and Win Game';

 // TODO: initalize array with 25 elemets
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    itemArray = List<String>.generate(25, (index) => "empty");
    generateRandomNumber();
  }

  generateRandomNumber(){
int random = Random().nextInt(24);
setState(() {
  luckyNumber = random;
});
}

  // TODO: Define a get image image method 
  AssetImage getImage(int index){
    String currentState = itemArray[index];

    switch (currentState) {
      case "lucky":
        return lucky;
        break;
      case "unLucky": 
        return unLucky;
        break;
    }
    return circle;
  }

  // TODO: play game method
  playGame(int index){
    if(luckyNumber == index){
      setState(() {
        itemArray[index] = "lucky";
        gameMessage = 'You are Lucky you won';
        isButtonUnable = false;
      });
    } else {
      setState(() {
        itemArray[index] = "unLucky";
      });
    }
  }

  // TODO: show all
  showAll(){
    setState(() {
      itemArray = List<String>.filled(25, "unLucky");
      itemArray[luckyNumber] = "lucky";
    });
  }

  // TODO: Reset all
  resetGame(){
  itemArray = List<String>.filled(25, "empty");
  generateRandomNumber();
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text('Scratch and win')
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(20.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                childAspectRatio: 1.0,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0
                ),
                itemCount: itemArray.length,
                 itemBuilder: (context, i) => SizedBox(
                   width: 50.0,
                   height: 50.0,
                   child: RaisedButton(onPressed: (){
                     if(isButtonUnable){
                       gameOverCount++;
                       this.playGame(i);
                       if (gameOverCount >= 5){
                       setState(() => isButtonUnable = false);
                       gameMessage = 'Game Over\nRest to Play Again';
                                            }  
                     }
                   },
                   child: Image(image: this.getImage(i),
                   ),
                   ),
                   )
                   ),
          ), Text(gameMessage, style: TextStyle(color: Colors.orangeAccent, fontSize: 20.0),textAlign: TextAlign.center,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(15.0),
                child: RaisedButton(onPressed: (){
                this.showAll();
            },
            color:  Colors.pink,
            padding: EdgeInsets.all(20.0),
            child: Text('Show All', 
            style: TextStyle(
              color: Colors.white, 
              fontSize: 20.0
            ),
            ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(15.0),
            child: RaisedButton(onPressed: (){
              gameMessage = 'Scratch and Win Game';
              gameOverCount =0;
              isButtonUnable = true;
              this.resetGame();
            },
            color:  Colors.pink,
            padding: EdgeInsets.all(20.0),
            child: Text('Reset',
            style: TextStyle(
              color: Colors.white, 
              fontSize: 20.0
            ),
            ),
            ),
          ),
          ],),
        ],
      ),
    
    );
  }
}