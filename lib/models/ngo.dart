import 'dart:convert';

import 'dart:core';
import 'package:bangkit/services/firebase.dart';
import 'package:firebase_database/firebase_database.dart' as rtdb;

Ngo ngoFromJson(String str) => Ngo.fromJson(json.decode(str));

String ngoToJson(Ngo data) => json.encode(data.toJson());

class Ngo {
  Ngo({
    this.id,
    required this.name,
    required this.address,
    required this.postCode,
    required this.phoneNumber,
    required this.email,
    required this.description,
    this.props,
    required this.type,
    this.entityType,
    this.serviceTypes,
  });
  int? id;
  String name;
  String address;

  String postCode;
  String phoneNumber;
  String email;
  String description;
  String? props;
  Type type;
  EntityType? entityType;
  List<ServiceType>? serviceTypes;

  factory Ngo.fromJson(Map<String, dynamic> json) => Ngo(
        name: json["name"],
        address: json["address"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        description: json["description"],
        props: json["props"],
        type: Type.values.elementAt(json["type"]),
        entityType: EntityType.values.elementAt(json["entityType"]),
        serviceTypes: List<ServiceType>.from(json["serviceTypes"].map((x) => EntityType.values.elementAt(x))),
        postCode: json["postCode"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "address": address,
        "phoneNumber": phoneNumber,
        "email": email,
        "description": description,
        "props": props,
        "type": type.index,
        "entityType": entityType != null ? entityType!.index : null,
        "serviceTypes": serviceTypes != null ? List<dynamic>.from(serviceTypes!.map((x) => x.index)) : null,
        "modifiedDate": DateTime.now(),
        "postCode": postCode,
        "searchText": searchString,
      };

  static addNgo(Ngo ngo) {
    return databaseRef.child("globalData/ngos").runTransaction((Object? transaction) {
      if (transaction == null) {
        return rtdb.Transaction.abort();
      }
      int _transaction = (transaction as int) + 1;
      ngo.id = _transaction;
      return rtdb.Transaction.success(_transaction);
    }).then((value) {
      return ngos.doc(ngo.id.toString()).set(ngo.toJson()).then((value) => {"code": "success", "message": "NGO has been added"}).catchError((error) {
        return {"code": "Failed", "message": "Unknown error, Please try again"};
      });
    }).catchError((error) {
      return {"code": "Failed", "message": "Unknown error, Please try again"};
    });
  }

  delete() {
    ngos.doc(id.toString()).delete().then((value) => {"code": "success", "message": "NGO has been deleted"}).catchError((error) {
      print(error.toString());
      return {"code": "Failed", "message": error.toString()};
    });
  }

  static list({required Type type, required String postCode, EntityType? entityType, List<ServiceType>? serviceTypes, String? searchText}) {
    Query query = ngos;
    if (entityType != null) {
      query = query.where("entityType", isEqualTo: entityType.index);
    }
    if (serviceTypes != null) {
      query = query.where("serviceTypes", arrayContainsAny: serviceTypes.map((e) => e.index).toList());
    }
    if (serviceTypes != null) {
      query = query.where("serviceTypes", arrayContainsAny: serviceTypes.map((e) => e.index).toList());
    }
    if (serviceTypes != null) {
      query = query.where("serviceTypes", arrayContainsAny: serviceTypes.map((e) => e.index).toList());
    }
  }

  List<String> get searchString => makeSearchString(name);
  makeSearchString(String text) {
    List<String> returns = [];
    var length = text.length;
    for (int i = 0; i < length; i++) {
      returns.add(text.substring(0, i));
    }
    returns.add(text);
    return returns;
  }
}

enum Type { medical, floodReleif, volunteer }
enum EntityType { government, private }
enum ServiceType { cleaning, food, assistance }
