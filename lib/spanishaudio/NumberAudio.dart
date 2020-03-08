import 'package:flutter/material.dart';

// Helper Class
class NumberAudio{
  String  audioUri;
  MaterialColor buttonColor;
  String buttonText;

  NumberAudio(String audUri, MaterialColor btnColor, String btnText){
    this.audioUri = audUri;
    this.buttonColor = btnColor;
    this.buttonText = btnText;
  }
}