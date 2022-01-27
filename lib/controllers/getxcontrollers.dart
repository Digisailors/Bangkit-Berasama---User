import 'dart:typed_data';

import 'package:bangkit/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapIconsController extends GetxController {
  static MapIconsController instance = Get.find();
  Uint8List? floodMarkerIcon;
  Uint8List? retentionPondIcon;
  Uint8List? reservedLandIcon;
  Uint8List? locationMarkerIcon;
  BitmapDescriptor? locationMarkerDescriptor;

  loadIcons() async {
    floodMarkerIcon = await getBytesFromAsset("assets/MarkerFlood.png", 110);
    reservedLandIcon = await getBytesFromAsset("assets/MarkerReserved.png", 110);
    retentionPondIcon = await getBytesFromAsset("assets/MarkerPond.png", 110);
    locationMarkerIcon = await getBytesFromAsset("assets/bluedot.png", 110);
    // locationMarkerIcon = await getBytesFromAsset("assets/locationMarker.png", 110);

    locationMarkerDescriptor = await BitmapDescriptor.fromAssetImage(const ImageConfiguration(size: Size(2, 2)), 'assets/bluedot.png');
  }

  LatLng? myLocation;
}

MapIconsController markerController = MapIconsController.instance;
