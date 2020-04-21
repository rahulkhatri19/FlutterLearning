import 'package:flutter/material.dart';
import 'ui/add_contact.dart';
import 'ui/view_contact.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class FirebaseRtDbPage extends StatefulWidget {
  @override
  _FirebaseRtDbPageState createState() => _FirebaseRtDbPageState();
}

class _FirebaseRtDbPageState extends State<FirebaseRtDbPage> {

  DatabaseReference _databaseReference = FirebaseDatabase.instance.reference();

  navigateToAddScreen(){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return AddContact();
    }));
  }

navigateToViewScreen(){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return ViewContact();
    }));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: navigateToAddScreen,
        child: Icon(Icons.add),),
    );
  }
}