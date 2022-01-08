import 'package:bangkit/ngo/floodreleif.dart';
import 'package:bangkit/ngo/home.dart';
import 'package:flutter/material.dart';

class HomeRoute extends StatelessWidget {
  const HomeRoute({Key? key, required this.selectedIndex}) : super(key: key);
  final int selectedIndex;

  Widget getWidgets(selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return HomePage();
      case 1:
        return FloodRelief();
      case 2:
        return Container(color: Colors.grey);
      case 3:
        return Container(color: Colors.white);
      default:
        return Container(color: Colors.white);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getWidgets(selectedIndex),
    );
  }
}
