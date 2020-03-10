import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String proName, emailAdd, mobileNo, collegeName, password;
  HomePage(
    {
      Key key,
      @required
      this.proName,
      this.emailAdd,
      this.mobileNo,
      this.collegeName,
      this.password
    }
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Info'),
      ),
      backgroundColor: Colors.orange,
      body: Form(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.all(10.0),),
              Image( image: AssetImage("images/logo.jpg"),
              width: 100.0,
              height: 100.0
              ),
              ListTile(
                leading: Icon(Icons.people),
                title: Text(proName),
                ),
                 ListTile(
                leading: Icon(Icons.email),
                title: Text(emailAdd),
                ),
                ListTile(
                leading: Icon(Icons.lock),
                title: Text(password),
                ),
                ListTile(
                leading: Icon(Icons.phone_android),
                title: Text(mobileNo),
                ),
                 ListTile(
                leading: Icon(Icons.school),
                title: Text(collegeName),
                ),
            ]
          ),
        ),),
    );
  }
}