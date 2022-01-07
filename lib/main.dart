import 'package:bangkit/auth/login.dart';
import 'package:bangkit/dummy/NgoEmergency/ngoemergencylanding.dart';
import 'package:bangkit/dummy/add_ngo.dart';
import 'package:bangkit/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import 'controllers/auth_controller.dart';
import 'firebase_options.dart';
import 'fundraiser/home.dart';
import 'profile/profile.dart';

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
      theme: ThemeData(
        tabBarTheme: TabBarTheme(
          unselectedLabelColor: Colors.black,
          labelColor: Colors.white,
          labelStyle: TextStyle(color: Colors.pink[800]), // color for text
          indicator: const BoxDecoration(color: Colors.red),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF4F4F4),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red.shade700))),
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LandingPage(),
        '/sign-in': (context) => const SignInWidget(),
        '/home': (context) => const Homepage(),
        '/addNgo': (context) => AddNgo(),
        '/ngoEmergencyLanding': (context) => NgoEmergencyLanding(),
        '/profile': (context) => const ProfileWidget(),
      },
      // home: LandingPage(auth: Auth()),
    );
  }
}
