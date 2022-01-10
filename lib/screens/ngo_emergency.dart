import 'package:bangkit/models/ngo.dart';

import 'package:bangkit/services/firebase.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'repo_list.dart';

class NGOLandingPage extends StatefulWidget {
  NGOLandingPage({Key? key}) : super(key: key);

  @override
  _NGOLandingPageState createState() => _NGOLandingPageState();
}

class _NGOLandingPageState extends State<NGOLandingPage> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    NgoList(
      query: "repos",
    ),
    NgoList(
      query: "",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.blue,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            tooltip: 'Home',
            // backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.handHoldingHeart),
            label: 'Ngo',
            // backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud),
            label: 'Weather ',
            // backgroundColor: Colors.purple,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }
}
