import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RandomApiPage extends StatefulWidget {
  @override
  _RandomApiPageState createState() => _RandomApiPageState();
}

class _RandomApiPageState extends State<RandomApiPage> {

  List userData;
  bool isLoading = true;
  final String url = "https://randomuser.me/api/?results=50";
  Future getData() async {
    var response = await http.get(
      Uri.encodeFull(url),
      // headers: {"Accept":"application/json"},   //  for header
    );

    List data = jsonDecode(response.body)['results'];
    setState(() {
      userData = data;
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random User'),
      ),
      body: Container(
        child: Center(
          child: isLoading ? CircularProgressIndicator(): ListView.builder(
            itemCount: userData == null ? 0 : userData.length,
            itemBuilder: (context, index){
              return Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(20.0),
                      child: Image(
                        width: 70.0,
                        height: 70.0,
                        fit: BoxFit.contain,
                        image: NetworkImage(
                          userData[index]['picture']['thumbnail'])
                          ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(userData[index]['name']['first']+" "+userData[index]['name']['last'],
                          style: TextStyle(fontSize: 20.0, 
                          fontWeight: FontWeight.bold),
                          ),
                          Text("Age: ${userData[index]['dob']['age']}"),
                          Text("Gender: ${userData[index]['gender']}"),
                          Row(children: <Widget>[
                            Icon(Icons.phone_android),
                            Text(userData[index]['phone'],
                          ),], ),
                          Row(
                            children: <Widget>[
                            Icon(Icons.email),
                            Padding(padding: EdgeInsets.all(5.0)),
                            Container(
                              width: 180.0,
                              child:Text(userData[index]['email'],
                          )
                            )
                            ,], ),
                        ],
                      )
                      )
                  ],
                  )
              );
            }, 
            )
        ),
      ),
    );
  }
}