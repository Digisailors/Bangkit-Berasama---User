import 'dart:convert';

import 'package:bangkit/models/response.dart';
import 'package:bangkit/services/firebase.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

FloodProneArea floodProneAreaFromJson(String str) => FloodProneArea.fromJson(json.decode(str));

String floodProneAreaToJson(FloodProneArea data) => json.encode(data.toJson());

class FloodProneArea {
  FloodProneArea({
    required this.street,
    required this.area,
    required this.state,
    required this.maxFloodLevel,
    required this.coordinates,
  });

  String street;
  String area;
  String state;
  double maxFloodLevel;
  GeoPoint coordinates;

  factory FloodProneArea.fromJson(Map<String, dynamic> json) => FloodProneArea(
        street: json["street"],
        area: json["area"],
        state: json["state"],
        maxFloodLevel: json["max_flood_level"].toDouble(),
        coordinates: json["coordinates"],
      );

  Map<String, dynamic> toJson() => {"street": street, "area": area, "state": state, "max_flood_level": maxFloodLevel, "coordinates": coordinates};

  LatLng get latlang => LatLng(coordinates.latitude, coordinates.longitude);

  add() {
    floodProneAreas
        .doc(docId)
        .set(toJson())
        .then((value) => Response.success("LocationAdded successfully"))
        .onError((error, stackTrace) => Response.error(error));
  }

  get docId => latlang.toString();
  delete() {
    floodProneAreas
        .doc(docId)
        .delete()
        .then((value) => Response.success("Deleted sccessfully"))
        .onError((error, stackTrace) => Response.error(error));
  }
}

RetentionPond retentionPondsFromJson(String str) => RetentionPond.fromJson(json.decode(str));

String retentionPondsToJson(RetentionPond data) => json.encode(data.toJson());

class RetentionPond {
  RetentionPond({required this.name, required this.location, required this.depth, required this.maxRain, required this.coordinates});

  String name;
  String location;
  String depth;
  String maxRain;
  GeoPoint coordinates;

  factory RetentionPond.fromJson(Map<String, dynamic> json) => RetentionPond(
        name: json["name"],
        location: json["location"],
        depth: json["depth"],
        maxRain: json["max_rain"],
        coordinates: json["coordinates"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "location": location,
        "depth": depth,
        "max_rain": maxRain,
        "coordinates": coordinates,
      };

  add() {
    retentionPonds
        .doc(docId)
        .set(toJson())
        .then((value) => Response.success("LocationAdded successfully"))
        .onError((error, stackTrace) => Response.error(error));
  }

  get docId => latlang.toString();

  delete() {
    retentionPonds.doc(docId).delete().then((value) => Response.success("Deleted sccessfully")).onError((error, stackTrace) => Response.error(error));
  }

  LatLng get latlang => LatLng(coordinates.latitude, coordinates.longitude);
}

class ReservedArea {
  ReservedArea({required this.name, required this.location, required this.description, required this.coordinates});

  String name;
  String location;
  String description;

  GeoPoint coordinates;

  factory ReservedArea.fromJson(Map<String, dynamic> json) => ReservedArea(
        name: json["name"],
        location: json["location"],
        description: json["depth"],
        coordinates: json["coordinates"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "location": location,
        "depth": description,
        "coordinates": coordinates,
      };

  add() {
    reservedAreas
        .doc(docId)
        .set(toJson())
        .then((value) => Response.success("Location Added successfully"))
        .onError((error, stackTrace) => Response.error(error));
  }

  get docId => latlang.toString();

  delete() {
    reservedAreas.doc(docId).delete().then((value) => Response.success("Deleted sccessfully")).onError((error, stackTrace) => Response.error(error));
  }

  LatLng get latlang => LatLng(coordinates.latitude, coordinates.longitude);
}
