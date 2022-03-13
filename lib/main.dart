import 'dart:typed_data';

import 'package:bangkit/constants/controller_constants.dart';
import 'package:bangkit/controllers/location_controller.dart';
import 'package:bangkit/models/service_category.dart';
import 'package:bangkit/web/add_adun.dart';
import 'package:bangkit/web/add_agency.dart';
import 'package:bangkit/web/add_ngo.dart';
import 'package:bangkit/web/add_post.dart';
import 'package:bangkit/routers/bottom_route.dart';
import 'package:bangkit/routers/landing_page.dart';
import 'package:bangkit/web/add_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'controllers/auth_controller.dart';
import 'controllers/getxcontrollers.dart';
import 'controllers/page_controller.dart';
import 'firebase_options.dart';
import 'routers/home_route.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'services/location.dart';

AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description: 'This channel is used for important notifications.', // description
    importance: Importance.max,
    playSound: true,
    sound: const RawResourceAndroidNotificationSound('notification'),
    vibrationPattern: Int64List.fromList([0, 500, 1000, 1500]));

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
const initializationSettings = InitializationSettings(android: AndroidInitializationSettings('@mipmap/ic_launcher'));

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Get.put(AuthController());
  Get.put(IndexController());
  Get.put(ServiceListController());
  Get.put(DamLinkController());
  Get.put(MapIconsController());
  Get.put(LocationController());

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  serviceListController.service = await NgoService.getServices();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging.instance.subscribeToTopic('posts');
  await markerController.loadIcons();
  LocationService.loadPosistion().then((value) {
    // print("Location Initialized");
    markerController.myLocation = LatLng(value.latitude, value.longitude);
  }).onError((error, stackTrace) {
    // print(error);
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      getPages: [
        GetPage(name: "/bottomRoute", page: () => BottomRouter()),
        GetPage(name: "/homeRoute", page: () => const HomeRoute()),
        // GetPage(name: "/", page: ()=> )
      ],
      theme: ThemeData(
        fontFamily: 'Roboto',
        iconTheme: const IconThemeData(color: Colors.black),
        primaryColor: const Color(0xFF00b3df),
        tabBarTheme: TabBarTheme(
          unselectedLabelColor: Colors.black,
          labelColor: Colors.white,
          labelStyle: TextStyle(color: Colors.pink[800]), // color for text
          indicator: const BoxDecoration(color: Color(0xFF00b3df)),
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
        bottomAppBarTheme: const BottomAppBarTheme(),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(elevation: 5, backgroundColor: Colors.blue),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white, iconTheme: IconThemeData(color: Color(0xFF00b3df))),
        chipTheme: const ChipThemeData(
          elevation: 4,
          backgroundColor: Colors.white,
          selectedColor: Color(0xFF22A8E0),
          disabledColor: Colors.white,
          showCheckmark: false,
          padding: EdgeInsets.all(0.0),
          brightness: Brightness.light,
          secondaryLabelStyle: TextStyle(color: Colors.black),
          labelStyle: TextStyle(color: Colors.white),
          secondarySelectedColor: Color(0xFF63e5ff),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color(0xFF00b3df)))),
      ),
      home: const LandingPage(),
    );
  }
}

class AddApp extends StatefulWidget {
  const AddApp({Key? key}) : super(key: key);

  @override
  _AddAppState createState() => _AddAppState();
}

class _AddAppState extends State<AddApp> {
  final pageController = PageController();
  bool toggle = true;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 5,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            bottom: const TabBar(
              tabs: [
                Tab(
                  child: Text("Gov"),
                ),
                Tab(
                  child: Text("NGO"),
                ),
                Tab(
                  child: Text("ADUN"),
                ),
                Tab(
                  child: Text("Services"),
                ),
                Tab(
                  child: Text("AID & GRANT"),
                ),
              ],
            ),
          ),
          drawer: Drawer(
            child: Column(
              children: [
                const SizedBox(height: 60),
                ListTile(
                  title: const Text("ADD ADUN"),
                  onTap: () {
                    setState(() {
                      pageController.jumpToPage(0);
                    });
                  },
                ),
                ListTile(
                  title: const Text("ADD NGO"),
                  onTap: () {
                    setState(() {
                      pageController.jumpToPage(1);
                    });
                  },
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [AddAgency(), AddNgo(), AddAdun(), const AddService(), AddPost()],
          )),
    );
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {}
