import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutterlearning/spanish_audio/NumberAudio.dart';

class SpanishAudio extends StatefulWidget {
  @override
  _SpanishAudioState createState() => _SpanishAudioState();
}

class _SpanishAudioState extends State<SpanishAudio> {

AudioCache audioPlayer = AudioCache();
List<NumberAudio> listNumAudio = [
  NumberAudio("spanishaudio/one.wav", Colors.red, "One"), 
  NumberAudio("spanishaudio/two.wav", Colors.blue, "Two"), 
  NumberAudio("spanishaudio/three.wav", Colors.green, "Three"), 
  NumberAudio("spanishaudio/four.wav", Colors.pink, "Four"), 
  NumberAudio("spanishaudio/five.wav", Colors.brown, "Five"), 
  NumberAudio("spanishaudio/six.wav", Colors.blueGrey, "Six"), 
  NumberAudio("spanishaudio/seven.wav", Colors.teal, "Seven"), 
  NumberAudio("spanishaudio/eight.wav", Colors.grey, "Eight"), 
  NumberAudio("spanishaudio/nine.wav", Colors.orange, "Nine"), 
  NumberAudio("spanishaudio/ten.wav", Colors.purple, "Ten")
]; 

play(String uri){
  audioPlayer.play(uri);
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
            Container(
              padding: EdgeInsets.all(10.0),
              child: Image(image: AssetImage("images/logo.jpg"),)
            ),
            // Image(image: AssetImage("images/logo.jpg"),),
            // Padding(padding: EdgeInsets.all(10.0)),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(10.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, 
                childAspectRatio: 2.0,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0),
                itemCount: listNumAudio.length, 
                itemBuilder: (context, i) => SizedBox(
                  width: 100.0 ,
                  height: 50.0,
                  child: RaisedButton(
                    color: listNumAudio[i].buttonColor,
                    child: Text(listNumAudio[i].buttonText, style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white
                    ),
                    ),
                    onPressed: (){
                      play(listNumAudio[i].audioUri);
                    },),)
                  )
                  )
          ]
        ),),
    );
  }
}