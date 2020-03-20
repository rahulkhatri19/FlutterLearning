import 'package:flutter/material.dart';

class DrawerPage extends StatefulWidget {
  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer App')
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Rahul Khatri'),
              accountEmail: Text('khatri.rahul019@gamil.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.brown,
                child: Text('RK', style: TextStyle(color: Colors.white)),),
                ),
                ListTile(
                  title: Text('Random Background'),
                  trailing: Icon(Icons.album),
                  onTap: () => Navigator.of(context).pushNamed('/bg_change'),
                ),
                  ListTile(
                  title: Text('Dice Roller'),
                  trailing: Image.asset('images/icon/dice.png', width:24.0, height: 24.0),
                  onTap: () => Navigator.of(context).pushNamed('/dice_roll'),
                ),
                  ListTile(
                  title: Text('TicTacToe'),
                  trailing: Image.asset('images/icon/cross.png', width:24.0, height: 24.0),
                  onTap: () => Navigator.of(context).pushNamed('/tictactoe'),
                ),
                ListTile(
                  title: Text('Scratch Win'),
                  trailing: Icon(Icons.dashboard),
                  onTap: () => Navigator.of(context).pushNamed('/scratchwin'),
                ),
                 ListTile(
                  title: Text('Spanish Audio'),
                  trailing: Icon(Icons.audiotrack),
                  onTap: () => Navigator.of(context).pushNamed('/spanishaudio'),
                ),
                 ListTile(
                  title: Text('SignUp Page'),
                  trailing: Icon(Icons.person),
                  onTap: () => Navigator.of(context).pushNamed('/signup'),
                ),
                 ListTile(
                  title: Text('Github Api'),
                  trailing: Icon(Icons.person),
                  onTap: () => Navigator.of(context).pushNamed('/github_api'),
                ),
                ListTile(
                  title: Text('Random Api'),
                  trailing: Icon(Icons.person),
                  onTap: () => Navigator.of(context).pushNamed('/random_api'),
                ),
                ListTile(
                  title: Text('Close Dawer'),
                  trailing: Icon(Icons.clear),
                  onTap: () => Navigator.of(context).pop(),
                )
          ],
        )
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Home Page')
        ],),
        ),
    );
  }
}