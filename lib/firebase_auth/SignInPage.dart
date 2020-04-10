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
       Navigator.pushReplacementNamed(context, "/");
     }
   });
 }

 navigateToSignupScreen(){
   Navigator.pushReplacementNamed(context, "/signuppage");
 }

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.checkAuthentication();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}