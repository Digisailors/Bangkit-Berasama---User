import 'package:flutter/material.dart';
import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';

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
    markers.add(
      Marker(
          markerId: const MarkerId("Kuala Lumpur"),
          // icon: BitmapDescriptor.fromJson(json),
          draggable: false,
          onTap: () {
            print("Marker Tapped");
          },
          position: const LatLng(3.140853, 101.693207)),
    );
    markers.add(
      Marker(
          markerId: const MarkerId("Kuala"),
          draggable: false,
          infoWindow: const InfoWindow(title: "Kuala lumpur", snippet: "yuwefbpwuiew\nuvbwbvweivbwibv\nwuybvewbvwei\n"),
          onTap: () {
            print("Marker Tapped");
            showAboutDialog(context: context, children: const [Text("Hello")]);
          },
          position: const LatLng(3.120853, 101.493207)),
    );
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
        child: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: const CameraPosition(zoom: 8.0, target: LatLng(4.693950, 101.117577)),
          markers: markers.toSet(),
          onTap: (LatLng cordinates) {
            setState(() {
              markers.add(Marker(markerId: const MarkerId("markerId"), position: cordinates));
            });
          },
        ),
      ),
    );
  }
}
