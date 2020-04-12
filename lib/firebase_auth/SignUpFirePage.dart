import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpFirePage extends StatefulWidget {
  @override
  _SignUpFirePageState createState() => _SignUpFirePageState();
}

class _SignUpFirePageState extends State<SignUpFirePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _name, _email, _password;

  checkAuthentication() async {
    _auth.onAuthStateChanged.listen((user){
      if (user != null){
        Navigator.pushReplacementNamed(context, "/firebaseauth");
      }
    });
  }

navigateToSigninScreen(){
  Navigator.pushReplacementNamed(context, "/signinpage");
}

@override
  void initState() {
    super.initState();
    this.checkAuthentication();
  }

  signup() async{
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();

      try{
        FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
          email: _email, password: _password)).user;

          if (user != null){
            UserUpdateInfo userUpdateInfo=  UserUpdateInfo();
            userUpdateInfo.displayName = _name;
            user.updateProfile(userUpdateInfo);
          }
      } catch(e){
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
        title: Text('Sign Up'),
      ),
      body: Container(
        child: Center(
          child: ListView(
            children:<Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
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
                        Container(padding: EdgeInsets.only(top:20.0),
                        child: TextFormField(
                          validator: (input){
                            if(input.isEmpty){
                              return 'provide an name';
                            }
                          },
                          decoration: InputDecoration(
                            labelText: 'Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)
                              )
                          ),
                          onSaved: (input) => _name = input,
                        ),
                        ),
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
                          onSaved: (input) => _email = input,
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
                          onSaved: (input) => _password = input,
                          obscureText: true,
                        ),
                        ),
                        //  button
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 20.0, 0, 20.0),
                          child: RaisedButton(
                            onPressed: signup,
                            padding: EdgeInsets.fromLTRB(100.0, 20.0, 100.0, 20.0),
                            color: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)
                            ),
                            child: Text('Sign Up', 
                            style: TextStyle(
                              color: Colors.white, fontSize:20.0)),
                          ),
                        ),
                        GestureDetector(
                    onTap: navigateToSigninScreen,
                    child: Text('Already have an accunt',
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