import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiHomePage extends StatefulWidget {
  @override
  _ApiHomePageState createState() => _ApiHomePageState();
}

class _ApiHomePageState extends State<ApiHomePage> {
  final String url = "https://api.github.com/users";
  List data= [];
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }

  Future<String> getJsonData() async {
    var response = await http.get(
      Uri.encodeFull(url));
      //  print(response.body);
      setState(() {
        var convertDataToJson = json.decode(response.body);
        data = convertDataToJson;
       // print(data);
      }); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parse Json Data')
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index){
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // ListTile(
                //   leading: Icon(Icons.person), 
                //   title: Text(data[index]['login'], style: TextStyle(
                //     fontSize: 20.0)
                //     ),
                //     subtitle: Text(data[index]['url'],
                //     style: TextStyle(fontSize: 15.0),
                //     ),
                // ),
                ListTile(
                  leading: Icon(Icons.accessibility_new),
                  title: Text("Name: "+data[index]['login'],
                   style:TextStyle(fontSize: 14.0)),
                  subtitle: Text("Url: "+data[index]['url']+"\nFollower url: "+data[index]['followers_url'],
                   style: TextStyle(fontSize: 10.5)),
                )
              ]
            ),
            );
        }),
    );
  }
}