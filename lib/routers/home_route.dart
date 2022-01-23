import 'package:bangkit/constants/controller_constants.dart';
import 'package:bangkit/models/ngo.dart';
import 'package:bangkit/screens/adun_list.dart';
import 'package:bangkit/screens/home.dart';
import 'package:bangkit/screens/maps/flood_prone_area.dart';
import 'package:bangkit/screens/maps/retention_ponds.dart';
import 'package:bangkit/screens/page_view.dart';
import 'package:bangkit/screens/rebuildList.dart';
import 'package:bangkit/screens/repo_list.dart';
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
  void initState() {
    super.initState();
    pageController.load = (index) {
      setState(() {
        _selectedIndex = index;
      });
      print("I am invoked index = $index");
    };
  }

  int _selectedIndex = 4;

  Widget getWidgets() {
    switch (_selectedIndex) {
      case 0:
        return HomePage();
      case 1:
        return NgoList(query: ngos.where("entityType", isEqualTo: 1), entityType: 'NGO DATABASE');
      case 2:
        return NgoList(query: ngos.where("entityType", isEqualTo: 0), entityType: 'GOVERNMENT AGENCIES');
      case 3:
        return AdunList();

      case 4:
        return WeatherHome();
      case 5:
        return FloodProneArea();
      case 6:
        return RetentionPonds();
      case 7:
        return const WebViewer();
      default:
        return const Center(child: Text("Page is under constrction"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_selectedIndex == 0) {
          return true;
        } else {
          pageController.load!(0);
          return false;
        }
      },
      child: Scaffold(
        body: getWidgets(),
      ),
    );
  }
}
