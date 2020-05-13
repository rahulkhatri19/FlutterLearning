import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutterlearning/firebase_realtime_db/model/Contact.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'dart:io';

class AddContact extends StatefulWidget {
  @override
  _AddContactState createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {

  DatabaseReference _databaseReference = FirebaseDatabase.instance.reference();

  String _firstName = '';
  String _lastName = '';
  String _phone = '';
  String _email = '';
  String _address = '';
  String _photoUrl = "empty";

  saveContact(BuildContext context) async {
    if (_firstName.isNotEmpty && _lastName.isNotEmpty && _phone.isNotEmpty && _email.isNotEmpty && _address.isNotEmpty) {
      Contact contact = Contact(_firstName, _lastName, _phone, _email, _address, _photoUrl);

      await _databaseReference.push().set(contact.toJson());
      navigateToLastScreen(context);
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Field required"),
            content: Text("All Field are required"),
            actions: <Widget>[
              FlatButton(
                onPressed: (){
                  Navigator.of(context).pop();
                  }, 
                child: Text('Close'))
            ],
          );
        });
    }
  }

  Future pickImage() async {
    File file = await ImagePicker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 200.0,
      maxWidth: 200.0
    );
    String fileName = basename(file.path);
    uploadImage(file, fileName);
  }

  void uploadImage(File file, String fileName) async{
    StorageReference storageReference = FirebaseStorage.instance.ref().child(fileName);
    storageReference.putFile(file).onComplete.then((firebaseFile) async{
    var downloadUrl = await firebaseFile.ref.getDownloadURL();

    setState(() {
      _photoUrl = downloadUrl;
    });
    });
  }

  navigateToLastScreen(context){
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Contact"),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: ListView(
            children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: GestureDetector(
                onTap: (){
                  this.pickImage();
                },
                child: Center(
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: _photoUrl == "empty" ? AssetImage("images/logo.jpg"): NetworkImage(_photoUrl),
                        )
                    )
                  )
                )
              ),
            ),
            //  First Name
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: TextField(
                onChanged: (value){
                 setState(() {
                    _firstName = value;
                 });
                },
                decoration: InputDecoration(
                  labelText: 'First Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)
                    )
                ),
                )
            ),
            //   Last Name
             Container(
              margin: EdgeInsets.only(top: 20.0),
              child: TextField(
                onChanged: (value){
                 setState(() {
                    _lastName = value;
                 });
                },
                decoration: InputDecoration(
                  labelText: 'Last Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)
                    )
                ),
                )
            ),
            //  Phone
             Container(
              margin: EdgeInsets.only(top: 20.0),
              child: TextField(
                onChanged: (value){
                 setState(() {
                    _phone = value;
                 });
                },
                decoration: InputDecoration(
                  labelText: 'Phone',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)
                    )
                ),
                )
            ),
            // Email
             Container(
              margin: EdgeInsets.only(top: 20.0),
              child: TextField(
                onChanged: (value){
                 setState(() {
                    _email = value;
                 });
                },
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)
                    )
                ),
                )
            ),
            //  Address
             Container(
              margin: EdgeInsets.only(top: 20.0),
              child: TextField(
                onChanged: (value){
                 setState(() {
                    _address = value;
                 });
                },
                decoration: InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)
                    )
                ),
                )
            ),
            //  Save
            Container(
              padding: EdgeInsets.only(top: 20.0),
              child: RaisedButton(
                padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                onPressed: (){
                  saveContact(context);
                },
                color: Colors.amber,
                child: Text('Save', style: TextStyle(fontSize: 20.0,
                color: Colors.white),),
                )
            )
            ]
          )
        )
      )
    );
  }
}
