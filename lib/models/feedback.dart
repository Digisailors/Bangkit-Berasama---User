import 'dart:convert';

import 'package:bangkit/constants/controller_constants.dart';
import 'package:bangkit/models/response.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

MyFeedback feedbackFromJson(String str) => MyFeedback.fromJson(json.decode(str));

String feedbackToJson(MyFeedback data) => json.encode(data.toJson());

CollectionReference feedback = FirebaseFirestore.instance.collection('Feedback');

class MyFeedback {
  MyFeedback({
    this.uid,
    required this.title,
    required this.description,
    required this.raiseddDate,
    required this.starRatings,
  });

  String? uid;
  String title;
  String description;
  DateTime raiseddDate;
  int starRatings;

  factory MyFeedback.fromJson(Map<String, dynamic> json) => MyFeedback(
        uid: json["uid"],
        title: json["title"],
        description: json["description"],
        raiseddDate: json["raiseddDate"].toDate(),
        starRatings: json["starRatings"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "title": title,
        "description": description,
        "raiseddDate": raiseddDate,
        "starRatings": starRatings,
        "Raised By": profileController.profile!.name,
        "IC number": profileController.profile!.icNumber,
      };

  addFeedback() async {
    // Call the user's CollectionReference to add a new user
    uid = authController.auth.currentUser!.uid;
    return feedback
        .doc(uid)
        .set(toJson())
        .then((value) => Response.success("Feedback Added Sccessfully"))
        .catchError((error) => Response.error(error));
  }

  // Future<void> deleteFeedback() {
  //   return feedback.doc(uid).delete().then((value) => print("Feedback Deleted")).catchError((error) => print("Failed to delete Feedback: $error"));
  // }
}
