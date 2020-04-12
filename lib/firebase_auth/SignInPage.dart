import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

 final FirebaseAuth _auth = FirebaseAuth.instance;
 final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

 String email, password;

 checkAuthentication() async {
   _auth.onAuthStateChanged.listen((user) async {
     if(user != null){
       Navigator.pushReplacementNamed(context, "/firebaseauth");
     }
   });
 }

 navigateToSignupScreen(){
   Navigator.pushReplacementNamed(context, "/signupfirepage");
 }

 @override
  void initState() {
    super.initState();
    this.checkAuthentication();
  }

  void signin() async {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try {
        FirebaseUser user = (await _auth.signInWithEmailAndPassword(
          email: email, 
          password: password)).user;
      } catch (e) {
        showError(e.message);
      }
    }
  }

  showError(String errorMessage){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Error'),
          content: Text(errorMessage),
          actions: <Widget>[
            FlatButton(onPressed: (){
              Navigator.of(context).pop();
            }, child: Text('OK'))
          ],
        );
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Container(
        child: Center(
          child: ListView(
            children:<Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 50.0),
                child: Image(
                  image: AssetImage("images/logo.jpg"),
                  width: 100.0,
                  height: 100.0,
                  ),
                  ),
                  //   email
                  Container(
                    padding: EdgeInsets.all(16.0),
                    child: Form(key: _formKey,
                    child: Column(
                      children: <Widget>[
                        //   email
                        Container(padding: EdgeInsets.only(top:20.0),
                        child: TextFormField(
                          validator: (input){
                            if(input.isEmpty){
                              return 'provide an email';
                            }
                          },
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)
                              )
                          ),
                          onSaved: (input) => email = input,
                        ),
                        ),
                        //  password
                         Container(padding: EdgeInsets.only(top:20.0),
                        child: TextFormField(
                          validator: (input){
                            if(input.length < 6){
                              return 'Please provide at leat 6 character';
                            }
                          },
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)
                              )
                          ),
                          onSaved: (input) => password = input,
                          obscureText: true,
                        ),
                        ),
                        //  button
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 20.0, 0, 20.0),
                          child: RaisedButton(
                            onPressed: signin,
                            padding: EdgeInsets.fromLTRB(100.0, 20.0, 100.0, 20.0),
                            color: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)
                            ),
                            child: Text('Sign In', 
                            style: TextStyle(
                              color: Colors.white, fontSize:20.0)),
                          ),
                        ),
                        GestureDetector(
                    onTap: navigateToSignupScreen,
                    child: Text('Create an account',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.0),)
                  )
                      ]
                    ),
                    )
                  ),
            ]
          ),
          )
      ),
    );
  }
}