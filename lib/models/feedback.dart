// To parse this JSON data, do
//
//     final feedback = feedbackFromJson(jsonString);

import 'dart:convert';

import 'package:bangkit/services/firebase.dart';

Feedback feedbackFromJson(String str) => Feedback.fromJson(json.decode(str));

String feedbackToJson(Feedback data) => json.encode(data.toJson());

class Feedback {
  Feedback({
    this.id,
    required this.title,
    required this.description,
    required this.rating,
    required this.uid,
    required this.name,
  });

  String? id;
  String title;
  String description;
  int rating;
  String uid;
  String name;

  factory Feedback.fromJson(Map<String, dynamic> json) => Feedback(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        rating: json["rating"],
        uid: json["uid"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "rating": rating,
        "uid": uid,
        "name": name,
      };

  static Future<dynamic> addfeedback(Feedback feedback) async {
    return firestore.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction.get(counters);
      if (snapshot.exists) {
        var data = snapshot.data() as Map<String, dynamic>;
        feedback.id = data['feedbacks'] + 1;
        return transaction.update(counters, {"feedbacks": feedback.id}).set(feedbacks.doc(feedback.id.toString()), feedback.toJson());
      }
    }).then((value) {
      return {"code": "Success", "message": "Added"};
    }).catchError((error) {
      print(error);
      return {"code": "Failed", "message": error.toString()};
    });
  }
}
