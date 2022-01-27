import 'package:bangkit/controllers/getxcontrollers.dart';
import 'package:bangkit/models/response.dart';
import 'package:bangkit/services/firebase.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

CollectionReference<Map<String, dynamic>> areas = firestore.collection('Areas');

class Area {
  Area({
    this.id,
    required this.property,
    required this.coordinates,
    required this.type,
    this.location,
  });

  String? id;
  String? location;
  Map<String, dynamic> property;
  GeoPoint coordinates;
  AreaType type;

  factory Area.fromJson(Map<String, dynamic> json) => Area(
        id: json["id"],
        property: json["property"],
        coordinates: json["coordinates"],
        type: AreaType.values.elementAt(json["type"]),
        location: json["location"],
      );

  Map<String, dynamic> toJson() => {"id": id, "property": property, "coordinates": coordinates, "type": type};

  LatLng get latlang => LatLng(coordinates.latitude, coordinates.longitude);

  get docId => DateTime.now().millisecondsSinceEpoch.toString();

  Marker marker({void Function()? onTap}) {
    return Marker(
      markerId: MarkerId(id.toString()),
      position: latlang,
      icon: markerIcon,
      visible: true,
      infoWindow: InfoWindow(title: "${coordinates.latitude}, ${coordinates.longitude}", snippet: location.toString()),
      onTap: onTap,
    );
  }

  BitmapDescriptor get markerIcon {
    switch (type) {
      case AreaType.floodProne:
        return BitmapDescriptor.fromBytes(markerController.floodMarkerIcon!);
      case AreaType.reserved:
        return BitmapDescriptor.fromBytes(markerController.reservedLandIcon!);
      case AreaType.retentionPond:
        return BitmapDescriptor.fromBytes(markerController.retentionPondIcon!);

      default:
        return BitmapDescriptor.defaultMarker;
    }
  }

  add() {
    areas
        .doc(docId)
        .set(toJson())
        .then((value) => Response.success("Location Added successfully"))
        .onError((error, stackTrace) => Response.error(error));
  }

  update() {
    areas
        .doc(docId)
        .set(toJson())
        .then((value) => Response.success("Location Updated successfully"))
        .onError((error, stackTrace) => Response.error(error));
  }

  delete() {
    areas.doc(id).delete().then((value) => Response.success("Location Deleted sccessfully")).onError((error, stackTrace) => Response.error(error));
  }
}

enum AreaType { floodProne, retentionPond, reserved }
