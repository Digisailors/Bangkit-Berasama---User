import 'dart:core';
import 'package:bangkit/services/firebase.dart';

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
    required this.contactPersonName,
    this.props,
    required this.type,
    this.entityType,
    this.serviceTypes,
  });
  int? id;
  String name;
  String address;
  String contactPersonName;
  String postCode;
  String phoneNumber;
  String email;
  String description;
  String? props;
  Type type;
  EntityType? entityType;
  List<ServiceType>? serviceTypes;

  factory Ngo.fromJson(Map<String, dynamic> json) => Ngo(
        name: json["name"] ?? '',
        address: json["address"] ?? '',
        phoneNumber: json["phoneNumber"] ?? '',
        email: json["email"] ?? '',
        description: json["description"] ?? '',
        contactPersonName: json["contactPersonName"] ?? '',
        props: json["props"],
        type: Type.values.elementAt(json["type"] ?? 0),
        entityType: EntityType.values.elementAt(json["entityType"] ?? 0),
        serviceTypes: List<ServiceType>.from(
            json["serviceTypes"].map((x) => ServiceType.values.elementAt(x))),
        postCode: json["postCode"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "address": address,
        "phoneNumber": phoneNumber,
        "email": email,
        "description": description,
        "contactPersonName": contactPersonName,
        "props": props,
        "type": type.index,
        "entityType": entityType != null ? entityType!.index : null,
        "serviceTypes": serviceTypes != null
            ? List<dynamic>.from(serviceTypes!.map((x) => x.index))
            : null,
        "modifiedDate": DateTime.now(),
        "postCode": postCode,
        "searchText": searchString,
      };

  static addNgo(Ngo ngo) async {
    return firestore.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction.get(counters);
      if (snapshot.exists) {
        var data = snapshot.data() as Map<String, dynamic>;
        ngo.id = data['ngos'] + 1;
        return transaction.update(counters, {"ngos": ngo.id}).set(
            ngos.doc(ngo.id.toString()), ngo.toJson());
      }
    }).then((value) {
      return {"code": "Success", "message": "Added"};
    }).catchError((error) {
      print(error);
      return {"code": "Failed", "message": error.toString()};
    });
  }

  delete() {
    ngos
        .doc(id.toString())
        .delete()
        .then((value) => {"code": "success", "message": "NGO has been deleted"})
        .catchError((error) {
      return {"code": "Failed", "message": error.toString()};
    });
  }

  static list(
      {Type? type,
      String? postCode,
      EntityType? entityType,
      List<ServiceType>? serviceTypes,
      String? searchText}) {
    Query query = ngos;
    if (postCode != null) {
      query = query.where("postCode", isEqualTo: postCode);
    }
    if (type != null) {
      query = query.where("type", isEqualTo: type.index);
    }
    if (entityType != null) {
      query = query.where("entityType", isEqualTo: entityType.index);
    }
    if (serviceTypes != null) {
      query = query.where("serviceTypes",
          arrayContainsAny: serviceTypes.map((e) => e.index).toList());
    }
    if (serviceTypes != null) {
      query = query.where("serviceTypes",
          arrayContainsAny: serviceTypes.map((e) => e.index).toList());
    }
    if (serviceTypes != null) {
      query = query.where("serviceTypes",
          arrayContainsAny: serviceTypes.map((e) => e.index).toList());
    }
    return query;
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
