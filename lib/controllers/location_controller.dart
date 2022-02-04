import 'dart:async';

import 'package:bangkit/services/location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationController extends GetxController {
  static LocationController instance = Get.find();
  LatLng location = const LatLng(0, 0);

  static LocationSettings locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
  );
  loadLocation() async {
    location = await LocationService.loadPosistion().then((value) => LatLng(value.latitude, value.longitude)) ?? location;
    print("Location fetched ${location.latitude}, ${location.longitude}");

    update();
  }

  @override
  void onInit() {
    loadLocation();
    super.onInit();
  }
}

LocationController locationController = LocationController.instance;
