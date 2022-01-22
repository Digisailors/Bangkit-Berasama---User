import 'dart:typed_data';

import 'package:bangkit/widgets/widgets.dart';
import 'package:get/get.dart';

class MapIconsController extends GetxController {
  static MapIconsController instance = Get.find();
  Uint8List? floodMarkerIcon;
  Uint8List? retentionPondIcon;
  Uint8List? reservedLandIcon;

  loadIcons() async {
    floodMarkerIcon = await getBytesFromAsset("assets/floodMarker.png", 110);
    retentionPondIcon = await getBytesFromAsset("assets/pond.ico", 110);
    reservedLandIcon = await getBytesFromAsset("assets/floodarea.png", 110);
  }
}

MapIconsController markerController = MapIconsController.instance;
