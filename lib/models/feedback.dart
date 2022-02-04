import 'dart:convert';

import 'package:bangkit/constants/controller_constants.dart';
import 'package:bangkit/models/response.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

MyFeedback feedbackFromJson(String str) => MyFeedback.fromJson(json.decode(str));

String feedbackToJson(MyFeedback data) => json.encode(data.toJson());

CollectionReference feedback = FirebaseFirestore.instance.collection('Users').doc(authController.auth.currentUser!.uid).collection("Feedback");

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
        "uid": authController.auth.currentUser!.uid,
        "title": title,
        "description": description,
        "raiseddDate": raiseddDate,
        "starRatings": starRatings,
        "Raised By": profileController.profile!.name,
        "IC number": profileController.profile!.icNumber,
      };

  static Stream<QuerySnapshot> myFeedbacks() {
    return feedback.where("uid", isEqualTo: authController.auth.currentUser!.uid).orderBy("raiseddDate", descending: true).snapshots();
  }

  addFeedback() async {
    return feedback
        .doc(DateTime.now().millisecondsSinceEpoch.toString())
        .set(toJson())
        .then((value) => Response.success("Feedback Added Sccessfully"))
        .catchError((error) => Response.error(error));
  }
}
