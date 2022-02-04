export 'package:cloud_firestore/cloud_firestore.dart';
export 'package:cloud_functions/cloud_functions.dart';
export 'dart:convert';
export './auth.dart';
import 'package:bangkit/controllers/getxcontrollers.dart';
import 'package:path/path.dart';

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';
// import 'package:path/path.dart';

final databaseRef = FirebaseDatabase.instance.refFromURL("https://bangkit-83a09-default-rtdb.asia-southeast1.firebasedatabase.app");
final FirebaseFunctions functions = FirebaseFunctions.instance;
final FirebaseFirestore firestore = FirebaseFirestore.instance;

final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
final FirebaseStorage storage = FirebaseStorage.instance;

CollectionReference<Map<String, dynamic>> users = firestore.collection('Users');
CollectionReference<Map<String, dynamic>> ngos = firestore.collection('Ngos');
CollectionReference<Map<String, dynamic>> aduns = firestore.collection('Aduns');
CollectionReference<Map<String, dynamic>> posts = firestore.collection('Posts');
CollectionReference<Map<String, dynamic>> rebuilds = firestore.collection('Rebuilds');
CollectionReference<Map<String, dynamic>> services = firestore.collection('Services');
CollectionReference<Map<String, dynamic>> feedbacks = firestore.collection('Feedbacks');
CollectionReference<Map<String, dynamic>> floodProneAreas = firestore.collection('FloodProneAreas');
CollectionReference<Map<String, dynamic>> retentionPonds = firestore.collection('RetentionPonds');
CollectionReference<Map<String, dynamic>> reservedAreas = firestore.collection('ReservedAreas');

DocumentReference<Map<String, dynamic>> counters = firestore.collection('globalData').doc('counters');
DocumentReference<Map<String, dynamic>> damLinks = firestore.collection('globalData').doc('DamLinks');

Future<String> uploadFile(File file) async {
  var url = await storage.ref("pics").child(basename(file.path)).putBlob(file.readAsBytes()).snapshot.ref.getDownloadURL();
  return url;
}

Future<String> uploadFileInReference(File file, Reference ref) async {
  var url = await ref.child(basename(file.path)).putFile(file).then((p0) {
    return p0.ref.getDownloadURL();
  });
  return url;
}

Future<List<String>> uploadFiles(List<File?> files, Reference ref) async {
  List<String> urls = [];
  for (var item in files) {
    if (item != null) {
      var url = await uploadFileInReference(item, ref);
      urls.add(url);
    }
  }
  return urls;
}

Future<List<File>?> selectFiles() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    allowMultiple: true,
    allowedExtensions: ['jpg', 'pdf', 'doc'],
  );
  if (result != null) {
    List<File> files = result.paths.map((path) => File(path!)).toList();
    return files;
  } else {
    return null;
  }
}
