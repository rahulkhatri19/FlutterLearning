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

navigateToViewScreen(id){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return ViewContact(id);
    }));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact App"),
        ),
        body: FirebaseAnimatedList(query: _databaseReference,
        itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index){
          return GestureDetector(
            onTap: (){
              navigateToViewScreen(snapshot.key);
            },
            child: Card(
              color: Colors.white,
              margin: EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: snapshot.value['photoUrl'] == "empty" ? AssetImage("images/logo.jpg"): NetworkImage(snapshot.value['photoUrl']),
                        ),
                    ),
                    ),
                    Container(
                      margin: EdgeInsets.all(20.0),
                      child: Column(children: <Widget>[
                        Text("${snapshot.value['firstName']} ${snapshot.value['lastName']} ", style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                          ),
                        Text("${snapshot.value['phone']}"),
                      ],)
                    )
                ]
              ),
            ),
          );
        },
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: navigateToAddScreen,
        child: Icon(Icons.add),),
    );
  }
}