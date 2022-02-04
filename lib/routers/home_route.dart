import 'package:bangkit/constants/controller_constants.dart';
import 'package:bangkit/models/area.dart';

import 'package:bangkit/screens/adun_list.dart';
import 'package:bangkit/screens/home.dart';

import 'package:bangkit/screens/mapview.dart';
import 'package:bangkit/screens/page_view.dart';

import 'package:bangkit/screens/repo_list.dart';
import 'package:bangkit/screens/volunteer/volunteer.dart';
import 'package:bangkit/screens/volunteer/volunteers.dart';
import 'package:bangkit/screens/weatherhome.dart';
import 'package:bangkit/services/firebase.dart';
import 'package:flutter/material.dart';

class HomeRoute extends StatefulWidget {
  const HomeRoute({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeRoute> createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  @override
  @override
  void initState() {
    super.initState();
    pageController.load = (int index) {
      setState(() {
        pageController.homeIndex = index;
      });
    };
  }

  Widget getWidgets() {
    switch (pageController.homeIndex) {
      case 0:
        return HomePage();
      case 1:
        return NgoList(query: ngos.where("entityType", isEqualTo: 1), entityType: 'NGO DATABASE');
      case 2:
        return NgoList(query: ngos.where("entityType", isEqualTo: 0), entityType: 'GOVERNMENT AGENCIES');
      case 3:
        return AdunList();
      case 4:
        return const VolunteerList();
      case 5:
        return WeatherHome();
      case 6:
        return const MapView(type: AreaType.floodProne);
      case 7:
        return const MapView(type: AreaType.retentionPond);
      case 8:
        return const MapView(type: AreaType.reserved);
      case 9:
        return const WebViewer();
      default:
        return const Center(child: Text("Page is under constrction"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (pageController.homeIndex == 0) {
          return true;
        } else {
          setState(() {
            pageController.homeIndex = 0;
          });
          return false;
        }
      },
      child: Scaffold(body: getWidgets()),
    );
  }
}
