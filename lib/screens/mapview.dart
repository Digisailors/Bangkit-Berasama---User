import 'package:bangkit/constants/themeconstants.dart';
import 'package:bangkit/controllers/getxcontrollers.dart';
import 'package:bangkit/models/area.dart';
import 'package:bangkit/services/firebase.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../constants/controller_constants.dart';

class MapView extends StatefulWidget {
  const MapView({Key? key, required this.type}) : super(key: key);
  final AreaType type;

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  late Query query;
  late GoogleMapController mapController;
  List<Marker> markers = [];

  var initPosistion;

  double _pinPillPosition = 0;

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

  @override
  void initState() {
    super.initState();
    query = areas.where("type", isEqualTo: widget.type.index);
    // query = areas;
  }

  getDetailsCard(Area area) {
    List<TableRow> children = [];
    children.addAll(area.property.keys.map((e) => TableRow(children: [Text(e), Text(area.property[e].toString())])).toList());
    children.add(TableRow(children: [
      const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text("Location"),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(area.location.toString()),
      ),
    ]));
    // return Table(
    //   border: const TableBorder(
    //     bottom: BorderSide(width: 1, style: BorderStyle.solid),
    //     horizontalInside: BorderSide(width: 1, style: BorderStyle.solid),
    //   ),
    //   children: children,
    // );
    List<DataColumn> columns = ["KEY", "VALUE"].map((e) => DataColumn(label: Text(e))).toList();
    List<DataRow> rows = [];
    area.property.forEach((key, value) {
      var row = DataRow(cells: [
        DataCell(
          Text(key),
        ),
        DataCell(
          Text(value),
        )
      ]);
      rows.add(row);
    });
    return DataTable(columns: columns, rows: rows);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              pageController.homeIndex = 0;
              Navigator.of(context).popAndPushNamed('/');
            }),
        centerTitle: true,
        title: SizedBox(height: getHeight(context) * 0.15, child: Image.asset('assets/bina.png')),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: query.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active && snapshot.hasData) {
            var docs = snapshot.data!.docs;
            var areas = docs.map((e) => Area.fromJson(e.data() as Map<String, dynamic>)).toList();
            markers.clear();
            markers = areas
                .map((e) => e.marker(onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(content: getDetailsCard(e));
                          });
                    }))
                .toList();
            if (markers.isNotEmpty) {
              initPosistion = getAveragePosistion();
            } else {
              initPosistion = markerController.myLocation ?? const LatLng(3.140853, 101.693207);
            }
            if (markerController.myLocation != null) {
              markers.add(
                Marker(
                  markerId: const MarkerId("MyLocation"),
                  position: markerController.myLocation!,
                  icon: markerController.locationMarkerDescriptor ?? BitmapDescriptor.fromBytes(markerController.locationMarkerIcon!),
                ),
              );
            }
            return Stack(
              children: [
                GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(zoom: 8.0, target: initPosistion),
                  markers: markers.toSet(),
                  tiltGesturesEnabled: false,
                  onTap: (LatLng location) {
                    setState(() {
                      _pinPillPosition = -100;
                    });
                  },
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
