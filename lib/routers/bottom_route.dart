import 'package:bangkit/constants/controller_constants.dart';
import 'package:bangkit/profile/profile.dart';
import 'package:bangkit/routers/home_route.dart';
import 'package:bangkit/screens/aid%20&grants/aidpost.dart';
import 'package:bangkit/screens/feedback.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomRouter extends StatefulWidget {
  BottomRouter({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomRouter> createState() => _BottomRouterState();
}

class _BottomRouterState extends State<BottomRouter> {
  @override
  void initState() {
    profileController.profile!.generateToken();
    initFCMpermissions();
    pageController.home.listen((event) {
      print("event");
    });
    super.initState();
  }

  initFCMpermissions() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
  }

  @override
  getWidgets(int index) {
    switch (index) {
      case 0:
        // ignore: prefer_const_constructors
        return HomeRoute();
      case 1:
        return const AidAndGrants();
      case 2:
        return AddFeedback();
      case 3:
        return ProfileWidget(profileModel: profileController.profile!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (pageController.bottomIndex == 0) {
          return true;
        } else {
          setState(() {
            pageController.bottomIndex = 0;
          });
          return false;
        }
      },
      child: Scaffold(
        body: getWidgets(pageController.bottomIndex),
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
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
              icon: ImageIcon(AssetImage('assets/aid.png')),
              label: 'Aid & Grants',
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
          currentIndex: pageController.bottomIndex,
          backgroundColor: Colors.white,
          onTap: (int index) {
            setState(() {
              pageController.homeIndex = 0;
              pageController.bottomIndex = index;
              // Navigator.of(context).popAndPushNamed('/');
            });
          },
        ),
      ),
    );
  }
}
