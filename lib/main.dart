import 'package:bangkit/routers/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import 'controllers/auth_controller.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      routes: '/floodReleif' : (context)=>HomeRoute(),
      theme: ThemeData(
        iconTheme: const IconThemeData(color: Colors.black),

        primaryColor: const Color(0xFF00b3df),

        tabBarTheme: TabBarTheme(
          unselectedLabelColor: Colors.black,
          labelColor: Colors.white,
          labelStyle: TextStyle(color: Colors.pink[800]), // color for text
          indicator: const BoxDecoration(color: Color(0xFF00b3df)),
        ),
        scaffoldBackgroundColor: Colors.white,
        bottomAppBarTheme: const BottomAppBarTheme(),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(elevation: 5, backgroundColor: Colors.blue),

        appBarTheme: const AppBarTheme(backgroundColor: Colors.white),

        chipTheme: const ChipThemeData(
          elevation: 4,
          backgroundColor: Colors.grey,
          selectedColor: Color(0xFF63e5ff),
          disabledColor: Colors.white,
          padding: const EdgeInsets.all(0.0),
          brightness: Brightness.light,
          secondaryLabelStyle: const TextStyle(color: Colors.black),
          labelStyle: TextStyle(color: Colors.black),
          secondarySelectedColor: const Color(0xFF63e5ff),
        ),

      
        elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color(0xFF00b3df)))),
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
      ),
      home: const LandingPage(),
    );
  }
}
