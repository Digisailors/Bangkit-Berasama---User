import 'package:bangkit/controllers/getxcontrollers.dart';
import 'package:bangkit/models/weather.dart';
import 'package:bangkit/services/location.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationController extends GetxController {
  static LocationController instance = Get.find();
  LatLng location = const LatLng(0, 0);
  String address = '';

  static LocationSettings locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.medium,
    distanceFilter: 100,
  );

  listenLocation() async {
    LocationService.locationStream.listen((value) {
      location = LatLng(value.latitude ?? location.latitude, value.longitude ?? location.longitude);
      markerController.myLocation = LatLng(value.latitude ?? location.latitude, value.longitude ?? location.longitude);
      Weather.getAddress(location.latitude, location.longitude).then((value) {
        address = value?.formattedAddress ?? '';
        update();
      });
      update();
    });
  }

  loadLocation() async {
    if (location.latitude == 0 && location.longitude == 0) {
      var posistion = await LocationService.loadPosistion();
      location = LatLng(posistion.latitude, posistion.longitude);
      Weather.getAddress(location.latitude, location.longitude).then((value) {
        address = value?.formattedAddress ?? '';
        update();
      });
      update();
    } else {
      return location;
    }
  }

  @override
  void onInit() {
    if (kDebugMode) {
      print("Listening to location");
    }
    listenLocation();
    super.onInit();
  }
}

LocationController locationController = LocationController.instance;
