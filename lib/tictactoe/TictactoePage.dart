import 'package:flutter/material.dart';
import 'dart:async';

class TictactoePage extends StatefulWidget {
  @override
  _TictactoePageState createState() => _TictactoePageState();
}

class _TictactoePageState extends State<TictactoePage> {

  AssetImage circle = AssetImage("images/tictactoe/circle.png");
  AssetImage cross = AssetImage("images/tictactoe/cross.png");
  AssetImage edit = AssetImage("images/tictactoe/edit.png");

  bool isCross = true;
  String message;
  List<String> gameState;

// TODO: initalize array values all 9 boxes, state of box with empty
@override
  void initState() {
    super.initState();
   setState(() {
     this.gameState = [
       "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty",
     ];
     this.message = "";
   });    
  }

// TODO: playGame method

playGame(int index){
if(this.gameState[index] == "empty"){
  setState(() {
    if(this.isCross){
      this.gameState[index] = "cross";
      // this.isCross = false;
    } else {
      this.gameState[index] = "circle";
      // this.isCross = true;
    }
    this.isCross = !this.isCross;
    this.checkWin();
  });
}
}

// TODO: Reset game method

resetGame(){
  setState(() {
    this.gameState= [
      "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty",
    ];
    this.message = "";
  });
}

// TODO: get images method
AssetImage getImage(String value){
switch(value){
  case('empty') : return edit;
  break;
  case('cross') : return cross;
  break;
  case('circle') : return circle;
  break;
}
}

// TODO: check for win topic
checkWin(){
  // 1st Horizontal line
  if ((gameState[0] != 'empty') && (gameState[0] == gameState[1]) && (gameState[1] == gameState[2])){
    setState(() {
      this.message = '${this.gameState[0]} Wins Game';
      timeLapse();
    });
  }  
  // 2nd Horizontal line 
  else if ((gameState[3] != 'empty') && (gameState[3] == gameState[4]) && (gameState[4] == gameState[5])){
    setState(() {
      this.message = '${this.gameState[3]} Wins Game';
      timeLapse();
    });
  }
  // 3rd Horizontal line  
  else if ((gameState[6] != 'empty') && (gameState[6] == gameState[7]) && (gameState[7] == gameState[8])){
    setState(() {
      this.message = '${this.gameState[6]} Wins Game';
      timeLapse();
    });
  } 
  // 1st Vertical line
  else   if ((gameState[0] != 'empty') && (gameState[0] == gameState[3]) && (gameState[3] == gameState[6])){
    setState(() {
      this.message = '${this.gameState[0]} Wins Game';
      timeLapse();
    });
  }
  // 2nd Vertical line
   else if ((gameState[1] != 'empty') && (gameState[1] == gameState[4]) && (gameState[4] == gameState[7])){
    setState(() {
      this.message = '${this.gameState[1]} Wins Game';
      timeLapse();
    });
  } 
  // 3rd vertical line
  else if ((gameState[2] != 'empty') && (gameState[2] == gameState[5]) && (gameState[5] == gameState[8])){
    setState(() {
      this.message = '${this.gameState[2]} Wins Game';
      timeLapse();
    });
  }
 // 1st Diagonal line
   else if ((gameState[0] != 'empty') && (gameState[0] == gameState[4]) && (gameState[4] == gameState[8])){
    setState(() {
      this.message = '${this.gameState[0]} Wins Game';
      timeLapse();
    });
  } 
  // 2nd Diagonal line
  else if ((gameState[2] != 'empty') && (gameState[2] == gameState[4]) && (gameState[4] == gameState[6])){
    setState(() {
      this.message = '${this.gameState[2]} Wins Game';
      timeLapse();
    });
  } else if(!gameState.contains('empty')){
   setState(() {
     this.message = 'Game Draw';
     timeLapse();
   });
  }
}

timeLapse(){
  Timer(const Duration(milliseconds: 3500), () {
    setState(() {
      resetGame();
    });
  });
}
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TicTacToe'),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: GridView.builder(
            padding: EdgeInsets.all(20.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.0,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0),
            itemCount: this.gameState.length, 
            itemBuilder: (context, i) => SizedBox(
              width: 100.0,
              height: 100.0,
              child: MaterialButton(
                onPressed: (){
                  playGame(i);
                  } ,
                child: Image(image: this.getImage(this.gameState[i]),
                ),
          )
      )
      ) 
),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              this.message, 
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold)
                ),
),
          MaterialButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
            color: Colors.orange,
            minWidth: 300.0,
            height: 50.0,
            child: Text('Reset Game',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0
            ),
            ),
            onPressed: (){
              this.resetGame();
            },
  ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text("LearnCodeOnline.in \nproject by Rahul Khatri"),
  )
      ],
      ),
    );
  }
}