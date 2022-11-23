import 'package:flutter/material.dart';
import 'package:myapp/pages/fragments/fragment_games.dart';
import 'package:myapp/pages/fragments/fragment_home.dart';
import 'package:myapp/pages/fragments/fragment_list.dart';

import 'authentication/loginpage.dart';

class MyNavigationBar extends StatefulWidget {
  MyNavigationBar({Key key}) : super(key: key);

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    FragmentHome(),
    FragmentList(),
    FragmentGames(),
    LoginPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text('Assignment'),
          backgroundColor: Colors.black),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.movie_creation,
                size: 35,
              ),
              label: 'Home',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
                size: 35,
              ),
              label: 'List',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
            icon: Icon(Icons.games, size: 35),
            label: 'Games',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout, size: 35),
            label: 'Logout',
            backgroundColor: Colors.blue,
          ),
        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        iconSize: 40,
        onTap: _onItemTapped,
        // elevation: 5
      ),
    );
  }
}
