import 'package:bangkit/controllers/getxcontrollers.dart';
import 'package:bangkit/services/firebase.dart';
import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:bangkit/models/marker_info.dart' as model;

class FloodProneArea extends StatefulWidget {
  FloodProneArea({Key? key}) : super(key: key);

  @override
  _FloodProneAreaState createState() => _FloodProneAreaState();
}

class _FloodProneAreaState extends State<FloodProneArea> {
  late GoogleMapController mapController;

  double _pinPillPosition = -100;

  model.FloodProneArea? _currentPinData;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  LatLng? getAveragePosistion() {
    double latitude = 0;
    double longitude = 0;
    for (var marker in markers) {
      latitude += marker.position.latitude;
      longitude += marker.position.longitude;
    }
    var average = LatLng(latitude / markers.length, longitude / markers.length);
    return average;
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
          // print("dx : $_height, dy : $_width");
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
                      infoWindow: InfoWindow(title: "Flood Level : ${area.maxFloodLevel}", snippet: area.area + ", " + area.street),
                      onTap: () {}));
                }
                double latitude = 0;
                double longitude = 0;
                for (var marker in markers) {
                  latitude += marker.position.latitude;
                  longitude += marker.position.longitude;
                }
                var average = LatLng(latitude / markers.length, longitude / markers.length);
                return Stack(
                  children: [
                    GoogleMap(
                      onMapCreated: _onMapCreated,
                      initialCameraPosition: CameraPosition(zoom: 8.0, target: average),
                      markers: markers.toSet(),
                      tiltGesturesEnabled: false,
                      onTap: (LatLng location) {
                        setState(() {
                          _pinPillPosition = -100;
                        });
                      },
                    ),
                    AnimatedPositioned(
                      bottom: _pinPillPosition,
                      right: 0,
                      left: 0,
                      duration: const Duration(milliseconds: 200),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: const EdgeInsets.all(20),
                          height: 70,
                          decoration:
                              BoxDecoration(color: Colors.white, borderRadius: const BorderRadius.all(Radius.circular(50)), boxShadow: <BoxShadow>[
                            BoxShadow(
                              blurRadius: 20,
                              offset: Offset.zero,
                              color: Colors.grey.withOpacity(0.5),
                            )
                          ]),
                          child: _currentPinData != null
                              ? Column(
                                  children: [
                                    Text("Flood Level : " + _currentPinData!.maxFloodLevel.toString()),
                                    Text("Street : " + _currentPinData!.street),
                                    Text("State : " + _currentPinData!.state),
                                  ],
                                )
                              : Container(),
                        ),
                      ),
                    ),
                  ],
                );
              }
              return const CircularProgressIndicator();
            }),
      ),
    );
  }
}
