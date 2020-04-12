import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthPage extends StatefulWidget {
  @override
  _FirebaseAuthPageState createState() => _FirebaseAuthPageState();
}

class _FirebaseAuthPageState extends State<FirebaseAuthPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;
  bool isSignIn = false;

  checkAuthentication() async {
    _auth.onAuthStateChanged.listen((user){
      if (user == null) {
        Navigator.pushReplacementNamed(context, "/signinpage"); 
      }
    });
  }

  getUser() async {
    FirebaseUser firebaseUser = await _auth.currentUser();
    //  Issue: https://github.com/flutter/flutter/issues/19746
    await firebaseUser?.reload();
    firebaseUser = await _auth.currentUser();

    if(firebaseUser != null){
      setState(() {
        this.user = firebaseUser;
        this.isSignIn = true;
      });
    }
    print(this.user);
  }

  signOut() async {
    _auth.signOut();
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentication();
    this.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        child: Center(
          child: !isSignIn 
          ? CircularProgressIndicator()
          : Column(
            children: <Widget>[
              Container(
                child: Image(
                  image: AssetImage("images/logo.jpg"),
                  width: 100.0,
                  height: 100.0,
                  ),
                  ),
                  Container(
                    padding: EdgeInsets.all(50.0),
                    child: Text("Hello ${user.displayName} you are logged in as ${user.email}",
                    style: TextStyle(fontSize: 20.0),
                    )
                  ),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: RaisedButton(
                      color: Colors.blue,
                      padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)
                      ),
                      onPressed: signOut,
                      child: Text('Signout',
                      style: TextStyle(
                        color: Colors.white, fontSize: 20.0
                      ),),
                    )
                  ),
            ]
          ),)
      ),
    );
  }
}