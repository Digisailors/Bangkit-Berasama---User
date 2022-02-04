import 'package:bangkit/constants/controller_constants.dart';
import 'package:bangkit/constants/themeconstants.dart';
import 'package:bangkit/models/profile.dart';
import 'package:bangkit/services/firebase.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'add_volunteer.dart';

class VolunteerList extends StatefulWidget {
  const VolunteerList({Key? key, this.setIndex}) : super(key: key);
  final void Function(int)? setIndex;

  @override
  State<VolunteerList> createState() => _VolunteerListState();
}

class _VolunteerListState extends State<VolunteerList> {
  @override
  void initState() {
    super.initState();
    // _selectedState = postalCodes.keys.first;
    // _selectedPincode = postalCodes[_selectedState]!.first["postCode"]!;
    _selectedState = profileController.profile!.primaryAddress.state;
    _selectedPincode = profileController.profile!.primaryAddress.pincode;
    query = users.where("isVolunteer", isEqualTo: true).where("isApproved", isEqualTo: true).where(_selectedState, isEqualTo: true);
  }

  void reload() {
    setState(() {
      query = users.where("isVolunteer", isEqualTo: true).where("isApproved", isEqualTo: true).where(_selectedState, isEqualTo: true);
      if (selectedServices.isNotEmpty) {
        query = query.where("services", arrayContainsAny: selectedServices);
      }
    });
  }

  final states = postalCodes.keys.toList();
  late Query query;
  late String _selectedState;
  late String _selectedPincode;
  List<String> selectedServices = [];

  get items => postalCodes.keys.map((state) => DropdownMenuItem(value: state, child: Text(state))).toList();
  Iterable get pincodes => postalCodes[_selectedState]!.map((e) => e["postCode"]);
  get pincodeItems => pincodes.map((e) => DropdownMenuItem(value: e as String, child: Text(e))).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: profileController.isVolunteer
            ? null
            : ElevatedButton(
                onPressed: () {
                  Get.to(() => const AddVolunteer());
                },
                child: const Text("Become a volunteer")),
        appBar: getAppBar(context),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: profileController.profile!.isVolunteer
                  ? Text(profileController.profile!.isApproved ? "You are a volunteer" : "Your volunteer application is pending for approval")
                  : Container(),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  'VOLUNTEER LIST',
                  style: TextStyle(
                    shadows: [Shadow(color: Colors.black, offset: Offset(0, -5))],
                    color: Colors.transparent,
                    fontSize: 20,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.blue,
                    decorationThickness: 4,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              SizedBox(
                width: getWidth(context) * 0.4,
                child: DropdownButtonFormField(
                  decoration: const InputDecoration(border: InputBorder.none),
                  value: _selectedState,
                  items: items,
                  onChanged: (state) {
                    _selectedState = state as String? ?? _selectedState;
                    _selectedPincode = postalCodes[_selectedState]!.first["postCode"]!;
                    reload();
                  },
                ),
              ),
              SizedBox(
                width: getWidth(context) * 0.4,
                child: DropdownButtonFormField(
                  decoration: const InputDecoration(border: InputBorder.none),
                  value: _selectedPincode,
                  items: pincodeItems,
                  onChanged: (pincode) {
                    _selectedPincode = pincode as String? ?? _selectedPincode;
                    reload();
                  },
                ),
              ),
            ]),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: serviceListController.service!
                  .map((e) => Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ChoiceChip(
                            selected: getServiceChipStats(e),
                            label: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                e.toUpperCase(),
                                style: TextStyle(color: getServiceChipStats(e) ? Colors.white : Colors.black),
                              ),
                            ),
                            onSelected: (bool value) {
                              if (value == true) {
                                selectedServices.add(e);
                              } else {
                                selectedServices.removeWhere((element) => element == e);
                              }
                              reload();
                            }),
                      ))
                  .toList(),
            ),
          ),
          const Divider(),
          StreamBuilder(
            stream: query.snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.active || snapshot.hasData) {
                var documents = snapshot.data!.docs;
                List<Profile> profiles = documents.map((e) => Profile.fromJson(e.data() as Map<String, dynamic>)).toList();
                return Column(children: profiles.map((e) => ProfileCard(profile: e)).toList());
              }
              if (snapshot.hasError) {
                return const Center(child: Text("An error has occured"));
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ]));
  }

  getServiceChipStats(String e) {
    int count = selectedServices.where((element) => element == e).toList().length;
    return count != 0 ? true : false;
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key, required this.profile}) : super(key: key);

  final Profile profile;

  void _launchMailURL() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: profile.email,
    );
    String url = params.toString();
    await launch(url);
  }

  void _launchPhoneURL() async {
    await launch("tel:${profile.phone}");
  }

  void _launchSecondaryPhoneURL() async {
    await launch("tel:${profile.secondaryPhone}");
  }

  void _launchPrimaryAdress() async {
    await launch("https://www.google.com/maps/search/${profile.primaryAddress.fullAddress}");
  }

  void _launchSecondaryAdress() async {
    await launch("https://www.google.com/maps/search/${profile.secondaryAddress.fullAddress}");
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: Text(profile.name),
        subtitle: Text(profile.phone),
        trailing: GestureDetector(onTap: _launchPhoneURL, child: const Icon(FontAwesomeIcons.phoneSquare)),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(profile.about ?? ''),
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.addressBook, color: Colors.red),
            title: Text(profile.primaryAddress.line1 + ', ' + profile.primaryAddress.line2),
            subtitle: Text(profile.primaryAddress.state + ", " + profile.primaryAddress.pincode),
            onTap: _launchPrimaryAdress,
          ),
          ListTile(
            // tileColor: Color(0x9885E9FF),
            minVerticalPadding: 0,
            leading: const Icon(FontAwesomeIcons.addressBook, color: Colors.red),
            title: Text(profile.secondaryAddress.line1 + ', ' + profile.secondaryAddress.line2),
            subtitle: Text(profile.secondaryAddress.state + ", " + profile.secondaryAddress.pincode),
            onTap: _launchSecondaryAdress,
          ),
          Table(
            children: [
              TableRow(
                children: [
                  ListTile(
                    leading: const Icon(Icons.phone_android, color: Colors.red),
                    title: Text(profile.phone),
                    onTap: _launchPhoneURL,
                  ),
                  ListTile(
                    leading: const Icon(Icons.phone_android, color: Colors.red),
                    title: Text(profile.secondaryPhone),
                    onTap: _launchSecondaryPhoneURL,
                  ),
                ],
              ),
            ],
          ),
          ListTile(
            leading: const Icon(Icons.email, color: Colors.red),
            title: Text(profile.email),
            onTap: _launchMailURL,
          ),
        ],
      ),
    );
  }
}
