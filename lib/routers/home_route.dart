import 'package:bangkit/constants/controller_constants.dart';
import 'package:bangkit/models/ngo.dart';
import 'package:bangkit/screens/adun_list.dart';
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
        return NgoList(
          query: ngos.where("entityType", isEqualTo: 1),
          entityType: 'NGO REPOSITORY',
        );
      case 2:
        return NgoList(query: ngos.where("entityType", isEqualTo: 0), entityType: 'GOVERNMENT AGENCIES');
      case 3:
        return AdunList();
      case 4:
        return NgoList(
            query: ngos.where("entityType", isEqualTo: 0).where("serviceType", isEqualTo: "Rebuild"), entityType: 'GOVERNMENT REBUILD AGENCIES');
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
