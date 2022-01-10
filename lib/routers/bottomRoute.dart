import 'package:bangkit/constants/controller_constants.dart';
import 'package:bangkit/profile/profile.dart';
import 'package:bangkit/routers/homeRoute.dart';
import 'package:flutter/material.dart';

class BottomRouter extends StatefulWidget {
  BottomRouter({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomRouter> createState() => _BottomRouterState();
}

class _BottomRouterState extends State<BottomRouter> {
  int _selectedIndex = 0;

  getWidgets(int index) {
    switch (index) {
      case 0:
        return const HomeRoute();
      case 1:
        return Container(color: Colors.red);
      case 2:
        return Container(color: Colors.green);
      case 3:
        return ProfileWidget(profileModel: profileController.profile!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getWidgets(_selectedIndex),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 16.0, left: 10, right: 10),
        child: Card(
          elevation: 5,
          shadowColor: Colors.lightBlueAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BottomNavigationBar(
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
              elevation: 0,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                  tooltip: 'Home',

                  // backgroundColor: Colors.red,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.money_sharp),
                  label: 'AIDS 7 Grants',
                  tooltip: 'Home',

                  // backgroundColor: Colors.red,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.feedback),
                  label: 'Feedback',
                  tooltip: 'Home',

                  // backgroundColor: Colors.red,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                  tooltip: 'Home',

                  // backgroundColor: Colors.red,
                ),
              ],
              currentIndex: _selectedIndex,
              backgroundColor: Colors.white,
              onTap: (int index) {
                setState(() {
                  pageController.pageNumber = 0;
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
