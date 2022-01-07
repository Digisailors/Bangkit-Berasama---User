import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'floodrelief.dart';
import 'medical.dart';
import 'volunteer.dart';

class NgoEmergencyLanding extends StatefulWidget {
  NgoEmergencyLanding({Key? key, this.index}) : super(key: key);
  final int? index;
  @override
  State<NgoEmergencyLanding> createState() => _NgoEmergencyLandingState();
}

class _NgoEmergencyLandingState extends State<NgoEmergencyLanding> {
  void initState() {
    _selectedIndex = widget.index ?? 0;
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    FloodRelief(),
    Medical(),
    Volunteer(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
}
