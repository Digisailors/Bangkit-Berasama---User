import 'package:bangkit/dummy/add_adun.dart';
import 'package:bangkit/dummy/add_ngo.dart';
import 'package:bangkit/routers/bottomRoute.dart';
import 'package:bangkit/routers/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import 'controllers/auth_controller.dart';
import 'controllers/page_controller.dart';
import 'firebase_options.dart';
import 'routers/homeRoute.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(AuthController());
  Get.put(IndexController());
  Get.put(ProfileController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      routes: {
        '/bottomRoute': (context) => BottomRouter(),
        '/homeRoute': (context) => const HomeRoute(),
      },
      theme: ThemeData(

        iconTheme: const IconThemeData(color:Color(0xFF00b3df) ),
        primaryColor: const Color(0xFF00b3df),
        tabBarTheme: TabBarTheme(
          unselectedLabelColor: Colors.black,
          labelColor: Colors.white,
          labelStyle: TextStyle(color: Colors.pink[800]), // color for text
          indicator: const BoxDecoration(color: Color(0xFF00b3df)),
        ),
        scaffoldBackgroundColor: Color(0xFFF5F5F5),
        bottomAppBarTheme: const BottomAppBarTheme(),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            elevation: 5, backgroundColor: Colors.blue),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
        chipTheme: const ChipThemeData(
          elevation: 4,
          backgroundColor: Colors.grey,
          selectedColor: Color(0xFF63e5ff),
          disabledColor: Colors.white,
          padding: EdgeInsets.all(0.0),
          brightness: Brightness.light,
          secondaryLabelStyle: TextStyle(color: Colors.black),
          labelStyle: TextStyle(color: Colors.black),
          secondarySelectedColor: Color(0xFF63e5ff),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(const Color(0xFF00b3df)))
        ),
      ),
      home: LandingPage(),
    );
  }
}

class AddApp extends StatefulWidget {
  AddApp({Key? key}) : super(key: key);

  @override
  _AddAppState createState() => _AddAppState();
}

class _AddAppState extends State<AddApp> {
  bool toggle = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue),
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            ListTile(
              title: const Text("ADD ADUN"),
              onTap: () {
                setState(() {
                  toggle = !toggle;
                });
              },
            ),
            ListTile(
              title: const Text("ADD NGO"),
              onTap: () {
                setState(() {
                  toggle = !toggle;
                });
              },
            ),
          ],
        ),
      ),
      body: toggle ? AddNgo() : AddAdun(),
    );
  }
}
