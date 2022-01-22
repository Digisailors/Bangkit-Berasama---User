import 'package:bangkit/controllers/getxcontrollers.dart';
import 'package:bangkit/models/marker_info.dart';
import 'package:bangkit/services/firebase.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:bangkit/models/marker_info.dart' as model;

class FloodProneArea extends StatefulWidget {
  FloodProneArea({Key? key}) : super(key: key);

  @override
  _FloodProneAreaState createState() => _FloodProneAreaState();
}

class _FloodProneAreaState extends State<FloodProneArea> {
  late GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  List<Marker> markers = [];
  double _height = 0;
  double _width = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTapUp: (details) {
          _height = details.localPosition.dx;
          _width = details.localPosition.dy;
          print("dx : $_height, dy : $_width");
        },
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: floodProneAreas.snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active && snapshot.hasData) {
                markers.clear();
                List<QueryDocumentSnapshot<Map<String, dynamic>>> documents = snapshot.data!.docs;
                List<model.FloodProneArea> areas = documents.map((document) => model.FloodProneArea.fromJson(document.data())).toList();

                for (var area in areas) {
                  markers.add(Marker(
                    markerId: MarkerId(area.latlang.toString()),
                    position: area.latlang,
                    icon: BitmapDescriptor.fromBytes(markerController.floodMarkerIcon!),
                  ));
                }
                double latitude = 0;
                double longitude = 0;
                for (var marker in markers) {
                  latitude += marker.position.latitude;
                  longitude += marker.position.longitude;
                }
                var average = LatLng(latitude / markers.length, longitude / markers.length);
                return GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(zoom: 8.0, target: average),
                  markers: markers.toSet(),
                  onTap: (LatLng cordinates) {
                    markers.add(Marker(markerId: const MarkerId("markerId"), position: cordinates));
                  },
                );
              }
              return const CircularProgressIndicator();
            }),
      ),
    );
  }
}
