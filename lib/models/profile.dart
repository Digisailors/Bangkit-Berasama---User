// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'dart:convert';

import 'package:bangkit/services/firebase.dart';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  Profile({
    this.uid,
    required this.name,
    required this.phone,
    required this.secondaryPhone,
    required this.email,
    required this.primaryAddress,
    required this.secondaryAddress,
  });

  String? uid;
  String name;
  String phone;
  String secondaryPhone;
  String email;

  Address primaryAddress;
  Address secondaryAddress;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        uid: json["uid"],
        name: json["name"],
        phone: json["phone"],
        secondaryPhone: json["secondaryPhone"],
        email: json["email"],
        primaryAddress: Address.fromJson(json["primaryAddress"]),
        secondaryAddress: Address.fromJson(json["secondaryAddress"]),
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "name": name,
        "phone": phone,
        "secondaryPhone": secondaryPhone,
        "email": email,
        "primaryAddress": primaryAddress.toJson(),
        "secondaryAddress": secondaryAddress.toJson(),
      };

  addUser() {}
}

class Address {
  Address({
    required this.line1,
    required this.line2,
    required this.description,
    required this.roofColor,
    required this.doorColor,
    required this.state,
    required this.pincode,
  });

  String line1;
  String line2;
  String state;
  String pincode;
  String description;
  String roofColor;
  String doorColor;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        line1: json["line1"],
        line2: json["line2"],
        description: json["description"],
        roofColor: json["roofColor"],
        doorColor: json["doorColor"],
        state: json["state"],
        pincode: json["pincode"],
      );

  Map<String, dynamic> toJson() => {
        "line1": line1,
        "line2": line2,
        "description": description,
        "roofColor": roofColor,
        "doorColor": doorColor,
        "state": state,
        "pincode": pincode,
      };
}
