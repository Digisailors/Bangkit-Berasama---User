import 'dart:ui';

import 'package:bangkit/constants/controller_constants.dart';
import 'package:bangkit/models/profile.dart';
import 'package:bangkit/profile/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ProfileWidget extends StatefulWidget {
  ProfileWidget({Key? key, required this.profileModel}) : super(key: key);

  Profile profileModel;

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<Object>(
            stream: widget.profileModel.getCurrentUserasStream(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.active && snapshot.hasData) {
                if (snapshot.data.data() != null) {
                  widget.profileModel = Profile.fromJson(snapshot.data.data());
                }
              }
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                        height: 300,
                        color: Colors.red,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Card(
                                color: Colors.white,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 50,
                                  child: Image.asset('assets/man.png', height: 80, width: 80),
                                ),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  widget.profileModel.name,
                                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                                ),
                              )
                            ],
                          ),
                        )),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Get.to(() => const ProfileView());
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Edit'),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Card(
                        child: ExpansionTile(
                          initiallyExpanded: true,
                          title: const Text(
                            'Profile Details',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          iconColor: Colors.red,
                          children: [
                            const Divider(),
                            ListTile(
                              leading: const Icon(
                                Icons.person,
                                color: Colors.red,
                              ),
                              title: const Text('Name'),
                              subtitle: Text(widget.profileModel.name),
                            ),
                            ListTile(
                              leading: const Icon(
                                FontAwesomeIcons.idBadge,
                                color: Colors.red,
                              ),
                              title: const Text('IC Number'),
                              subtitle: Text(widget.profileModel.icNumber),
                            ),
                            ListTile(
                              leading: const Icon(
                                Icons.phone,
                                color: Colors.red,
                              ),
                              title: const Text('Phone Number'),
                              subtitle: Text(widget.profileModel.phone),
                            ),
                            ListTile(
                              leading: const Icon(
                                Icons.phone,
                                color: Colors.red,
                              ),
                              title: const Text('Secondary Contact Number'),
                              subtitle: Text(widget.profileModel.secondaryPhone),
                            ),
                            ListTile(
                              leading: const Icon(
                                Icons.mail,
                                color: Colors.red,
                              ),
                              title: const Text('Email'),
                              subtitle: Text(widget.profileModel.email),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Card(
                        child: ExpansionTile(
                          title: const Text(
                            'Primary Address',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          iconColor: Colors.red,
                          children: [
                            const Divider(),
                            ListTile(
                              leading: const Icon(
                                Icons.home,
                                color: Colors.red,
                              ),
                              title: const Text('Address'),
                              subtitle: Text(widget.profileModel.primaryAddress.line1 + '\n' + widget.profileModel.primaryAddress.line2),
                            ),
                            ListTile(
                              leading: const Icon(
                                FontAwesomeIcons.hotel,
                                color: Colors.red,
                              ),
                              title: const Text('State'),
                              subtitle: Text(widget.profileModel.primaryAddress.state),
                            ),
                            ListTile(
                              leading: const Icon(
                                Icons.local_post_office,
                                color: Colors.red,
                              ),
                              title: const Text('Postcode'),
                              subtitle: Text(widget.profileModel.primaryAddress.pincode),
                            ),
                            ListTile(
                              leading: const Icon(
                                Icons.list,
                                color: Colors.red,
                              ),
                              title: const Text('Description'),
                              subtitle: Text(widget.profileModel.primaryAddress.description),
                            ),
                            ListTile(
                              leading: const Icon(
                                Icons.door_back_door,
                                color: Colors.red,
                              ),
                              title: const Text('Door Color'),
                              subtitle: Text(widget.profileModel.primaryAddress.doorColor.capitalize!),
                            ),
                            ListTile(
                              leading: const Icon(
                                Icons.roofing,
                                color: Colors.red,
                              ),
                              title: const Text('Roof Color'),
                              subtitle: Text(widget.profileModel.primaryAddress.roofColor.capitalize!),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(5.0),
                    //   child: Card(
                    //     child: ExpansionTile(
                    //       title: const Text(
                    //         'Secondary Address',
                    //         style: const TextStyle(fontWeight: FontWeight.bold),
                    //       ),
                    //       iconColor: Colors.red,
                    //       children: [
                    //         const Divider(),
                    //         ListTile(
                    //           leading: const Icon(
                    //             Icons.home,
                    //             color: Colors.red,
                    //           ),
                    //           title: const Text('Address'),
                    //           subtitle: Text(widget.profileModel.secondaryAddress.line1 + '\n' + widget.profileModel.secondaryAddress.line2),
                    //         ),
                    //         ListTile(
                    //           leading: const Icon(
                    //             FontAwesomeIcons.hotel,
                    //             color: Colors.red,
                    //           ),
                    //           title: const Text('State'),
                    //           subtitle: Text(widget.profileModel.secondaryAddress.state),
                    //         ),
                    //         ListTile(
                    //           leading: const Icon(
                    //             Icons.local_post_office,
                    //             color: Colors.red,
                    //           ),
                    //           title: const Text('Postcode'),
                    //           subtitle: Text(widget.profileModel.secondaryAddress.pincode),
                    //         ),
                    //         ListTile(
                    //           leading: const Icon(
                    //             Icons.list,
                    //             color: Colors.red,
                    //           ),
                    //           title: const Text('Description'),
                    //           subtitle: Text(widget.profileModel.secondaryAddress.description),
                    //         ),
                    //         ListTile(
                    //           leading: const Icon(
                    //             Icons.door_back_door,
                    //             color: Colors.red,
                    //           ),
                    //           title: const Text('Door Color'),
                    //           subtitle: Text(widget.profileModel.secondaryAddress.doorColor.capitalize!),
                    //         ),
                    //         ListTile(
                    //           leading: const Icon(
                    //             Icons.roofing,
                    //             color: Colors.red,
                    //           ),
                    //           title: const Text('Roof Color'),
                    //           subtitle: Text(widget.profileModel.secondaryAddress.roofColor.capitalize!),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ElevatedButton(
                          onPressed: () {
                            authController.auth.signOut();
                          },
                          child: const Text('Sign Out')),
                    )
                  ],
                ),
              );
            }));
  }
}
