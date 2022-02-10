import 'dart:io';

// ignore: unused_import
import 'package:bangkit/constants/controller_constants.dart';
import 'package:bangkit/constants/themeconstants.dart';
import 'package:bangkit/models/response.dart' as response;
import 'package:bangkit/profile/profileregistration.dart';
import 'package:bangkit/services/firebase.dart';
import 'package:bangkit/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class AddVolunteer extends StatefulWidget {
  const AddVolunteer({Key? key, this.setIndex}) : super(key: key);

  final void Function(int)? setIndex;

  @override
  _AddVolunteerState createState() => _AddVolunteerState();
}

class _AddVolunteerState extends State<AddVolunteer> {
  @override
  late List<String?> items = [null];
  List<File?> get files => items.map((e) => e != null ? File(e) : null).toList();
  final aboutController = TextEditingController();
  List<String?>? services = [];

  List<MultiSelectItem<String?>> get multiItems => serviceListController.service!.map((e) => MultiSelectItem(e, e)).toList();
  Future chooseFile() async {
    var files = await ImagePicker().pickMultiImage();
    if (files != null) {
      setState(() {
        if (items.isNotEmpty) items.removeLast();
        items.addAll(files.map((e) => e.path));
        items.add(null);
      });
    }
  }

  Future captureFile() async {
    var file = await ImagePicker().pickImage(source: ImageSource.camera);
    if (file != null) {
      setState(() {
        if (items.isNotEmpty) items.removeLast();
        items.add(file.path);
        items.add(null);
      });
    }
  }

  saveDocumentsToProfile() async {
    var ref = storage.ref("supportingDocuments/${authController.auth.currentUser!.uid}");
    if (services!.isEmpty) {
      return response.Response.error("Please select any services");
    } else if (files.isEmpty) {
      return response.Response.error("Please upload any proof documents");
    }
    return await uploadFiles(files, ref).then((urls) {
      profileController.profile!.isVolunteer = true;
      profileController.profile!.isApproved = false;
      profileController.profile!.documents = urls;
      profileController.profile!.about = aboutController.text;
      profileController.profile!.services = services!.map((e) => e.toString()).toList();
      return profileController.profile!.updateUser();
    }).then(
        (value) => response.Response.success("Your profile has been submitted to pending volunteer list. You'll receive notification on approval"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          showFutureDialog(
              context: context,
              future: saveDocumentsToProfile(),
              callback: () {
                items.clear();
                Get.toNamed('/bottomRoute');
              });
        },
        child: const Icon(Icons.upload),
      ),
      appBar: getAppBar(context),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Align(
            alignment: const AlignmentDirectional(0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: SizedBox(width: getWidth(context) / 3, child: Image.asset("assets/volunteer.png")),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Thank you for showing interest on becoming a volunteer",
                      style: getText(context).subtitle2,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Tell us anything about yourself (optional)",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextFormfieldRed(
                    controller: aboutController,
                    maxLines: 3,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Select any of the services below",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                MultiSelectDialogField(
                  buttonText: const Text("Select Services"),
                  title: const Text("Select Services"),
                  searchable: true,
                  searchHint: "Select services",
                  onConfirm: (List<String?> value) {
                    services = value;
                  },
                  items: multiItems,
                ),
                const Divider(),
                const Padding(
                  padding: EdgeInsets.only(left: 24.0),
                  child: Text(
                    "Please attach fromt and back side of your ID",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Wrap(
                          alignment: WrapAlignment.start,
                          children: items.map((e) => getItem(e)).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getTile(Paths path, int? index) {
    switch (path.type) {
      case PathType.url:
        return NetworkImage(url: path.path!);

      case PathType.file:
        return FileImage(path: path.path!);

      case PathType.noPath:
        return const NullImage();
    }
  }

  void showSucessDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text("Successfully Compliant Created", style: TextStyle(color: Colors.black)),
          );
        });
  }

  Widget getItem(String? path) {
    if (path != null) {
      return FileImage(
          path: path,
          onTap: () {
            setState(() {
              items.remove(path);
            });
          });
    } else {
      return NullImage(
        onTap: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(onTap: captureFile, leading: const Icon(Icons.camera), title: const Text("Take a photo")),
                    ListTile(onTap: chooseFile, leading: const Icon(Icons.photo_album), title: const Text("Pick Images from Gallery")),
                  ],
                );
              });
          // chooseFile();
        },
      );
    }
  }
}

class NullImage extends StatelessWidget {
  const NullImage({
    Key? key,
    this.onTap,
  }) : super(key: key);
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsetsDirectional.all(12),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.25,
          decoration: BoxDecoration(
            color: const Color(0xFFEEEEEE),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const AspectRatio(
            aspectRatio: 1,
            child: Icon(
              Icons.add_a_photo,
              // color: FlutterFlowTheme.primaryColor,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }
}

class FileImage extends StatelessWidget {
  const FileImage({
    Key? key,
    required this.path,
    this.onTap,
  }) : super(key: key);
  final String path;

  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.all(12),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.25,
        decoration: BoxDecoration(
          color: const Color(0xFFEEEEEE),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Image.file(File(path)),
            ),
            Positioned(
              top: 1,
              right: 1,
              child: GestureDetector(onTap: onTap, child: const Icon(Icons.cancel)),
            )
          ],
        ),
      ),
    );
  }
}

Widget getLoadingBuilder(BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
  if (loadingProgress == null) return child;
  return const Center(child: CircularProgressIndicator());
}

class NetworkImage extends StatelessWidget {
  const NetworkImage({
    Key? key,
    required this.url,
  }) : super(key: key);
  final String url;

  @override
  Widget build(BuildContext context) {
    // File file = File(url);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        elevation: 5,
        child: Container(
          // color: Colors.grey,
          height: 10,
          margin: const EdgeInsets.all(4),
          child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(18)),
              child: Image.network(url,
                  fit: BoxFit.fill, height: getWidth(context) * 0.25, width: getWidth(context) * 0.25, loadingBuilder: getLoadingBuilder)),
        ),
      ),
    );
  }
}

class Paths {
  Paths({
    required this.type,
    this.path,
  });
  String? path;
  PathType type;
}

enum PathType { url, file, noPath }
