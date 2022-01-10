import 'package:bangkit/constants/controller_constants.dart';
import 'package:bangkit/models/ngo.dart';
import 'package:bangkit/screens/adunList.dart';
import 'package:bangkit/screens/home.dart';
import 'package:bangkit/screens/rebuildList.dart';
import 'package:bangkit/screens/repo_list.dart';
import 'package:bangkit/services/firebase.dart';
import 'package:flutter/material.dart';

class HomeRoute extends StatelessWidget {
  const HomeRoute({
    Key? key,
  }) : super(key: key);

  Widget getWidgets() {
    switch (pageController.pageNumber) {
      case 0:
        return HomePage();
      case 1:
        return NgoList(query: "repos");
      case 2:
        return NgoList(query: "");
      case 3:
        return AdunList();
      case 4:
        return RebuildList(query: "repos");
      default:
        return Container(color: Colors.white);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (pageController.pageNumber == 0) {
          return true;
        } else {
          pageController.pageNumber = 0;
          Navigator.of(context).popAndPushNamed('/bottomRoute');
          return false;
        }
      },
      child: Scaffold(
        body: getWidgets(),
      ),
    );
  }
}
