import 'package:flutter/material.dart';
import 'package:flutterlearning/signup/HomePage.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _autoValidate = false;
  String name, email, mobile, collegename, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      backgroundColor: Colors.orange,
      body: SingleChildScrollView(
              child: Form(
          key: _key,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0)
            ),
            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.all(10.0),
                ),
                Image(image: AssetImage("images/logo.jpg"),
                width: 100.0,
                height: 100.0),
                ListTile(
                  leading: Icon(Icons.person),
                  title: TextFormField(
                    validator: (input){
                      if(input.isEmpty){
                        return 'Enter name';
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Name'
                    ),
                    onSaved: (input) => name = input,
                  ),
                  ),
                  ListTile(
                  leading: Icon(Icons.email),
                  title: TextFormField(
                    validator: (input){
                      if(input.isEmpty){
                        return 'Enter Email';
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Email'
                    ),
                    onSaved: (input) => email = input,
                  ),
                  ),
                  ListTile(
                  leading: Icon(Icons.lock),
                  title: TextFormField(
                    validator: (input){
                      if(input.isEmpty){
                        return 'Enter Password';
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Password'
                    ),
                    onSaved: (input) => password = input,
                    obscureText: true,
                  ),
                  ),
                  ListTile(
                  leading: Icon(Icons.phone_android),
                  title: TextFormField(
                    validator: (input){
                      if(input.isEmpty){
                        return 'Enter Phone Number';
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Phone Number'
                    ),
                    onSaved: (input) => mobile = input,
                  ),
                  ),
                  ListTile(
                  leading: Icon(Icons.school),
                  title: TextFormField(
                    validator: (input){
                      if(input.isEmpty){
                        return 'Enter College Name';
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'College Name'
                    ),
                    onSaved: (input) => collegename = input,
                  ),
                  ),
                  ButtonTheme(
                    height: 40.0,
                    minWidth: 200.0,
                    child: RaisedButton(
                      onPressed: _sendToNextScreen,
                      child: Text(
                        'Save', 
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)
                        ),
                      )
                  )
              ]
            ),
          )
          ),
      ),
    );
  }
  _sendToNextScreen(){
    if(_key.currentState.validate()){
      //  save to global key
      _key.currentState.save();
      //  send to second screen
      Navigator.push(context, 
      MaterialPageRoute(
         builder: (context) => HomePage(
           proName: name,
           mobileNo: mobile,
           emailAdd: email,
           collegeName: collegename,
           password: password
         )
         )
      );
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }
}