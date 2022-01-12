import 'dart:developer';

import 'package:bangkit/constants/controller_constants.dart';
import 'package:bangkit/constants/themeconstants.dart';
import 'package:bangkit/models/ngo.dart';
import 'package:bangkit/models/service_category.dart';
import 'package:bangkit/services/firebase.dart';
import 'package:bangkit/widgets/dropdownSelect.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import 'repoRouter.dart';

class NgoList extends StatefulWidget {
  NgoList({Key? key, required this.query}) : super(key: key);

  final String query;

  @override
  State<NgoList> createState() => _NgoListState();
}

class _NgoListState extends State<NgoList> {
  List<String> states = [];
  List<String> services = [];
  late String selectedService;
  ServiceType serviceType = ServiceType.cleaning;
  bool isGovernment = true;

  late Query query;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    query = ngos;
    // services = NgoService.getServices();
    print(services);
    selectedService = 'All';
  }

  Set<dynamic> filters = {};
  void reload() {
    setState(() {
      query = ngos;

      filters = {};

      if (states.isNotEmpty) {
        query = query.where("state", whereIn: states);
      }
      // query = isGovernment ? query.where("entityType", isEqualTo: 0) : ngos.where("entityType", isEqualTo: 1);
      if (widget.query != "repos") {
        query = query.where("service", isEqualTo: selectedService);
      }
    });
  }

  get showChips => widget.query == "repos";

  void _showMultiSelect(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (ctx) {
        return MultiSelectDialog(
          items: postalCodes.keys.map((e) => MultiSelectItem(e.toString(), e.toString())).toList(),
          initialValue: states,
          onConfirm: (values) async {
            states = values.map((e) => e.toString()).toList();
            reload();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        title: Image.asset('assets/bina.png', height: 150),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            pageController.pageNumber = 0;
            Navigator.popAndPushNamed(context, '/bottomRoute');
          },
          child: const Icon(Icons.arrow_back, color: Colors.blue),
        ),
      ),
      body: FutureBuilder(
          future: NgoService.getServices(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.connectionState == ConnectionState.active || snapshot.connectionState == ConnectionState.done) {
              services = snapshot.data as List<String>? ?? [];

              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text(
                              'REPOSITORY',
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
                      GestureDetector(
                        onTap: () {
                          _showMultiSelect(context);
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Icon(
                            Icons.filter_alt_sharp,
                            color: Color(0xFF22A8E0),
                          ),
                        ),
                      )
                    ]),
                  ),
                  // showChips
                  //     ? Container()
                  //     : Row(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: [
                  //           Padding(
                  //             padding: const EdgeInsets.all(4.0),
                  //             child: FilterChip(
                  //                 selected: isGovernment,
                  //                 shape: const StadiumBorder(side: BorderSide(color: Color(0xFF22A8E0))),
                  //                 label: Text("GOVERNMENT", style: TextStyle(color: isGovernment ? Colors.white : const Color(0xFF22A8E0))),
                  //                 onSelected: (bool value) {
                  //                   isGovernment = true;
                  //                   reload();
                  //                 }),
                  //           ),
                  //           Padding(
                  //             padding: const EdgeInsets.all(4.0),
                  //             child: FilterChip(
                  //                 selected: !isGovernment,
                  //                 shape: const StadiumBorder(side: BorderSide(color: Color(0xFF22A8E0))),
                  //                 label: Text("PRIVATE", style: TextStyle(color: !isGovernment ? Colors.white : const Color(0xFF22A8E0))),
                  //                 onSelected: (bool value) {
                  //                   isGovernment = false;
                  //                   reload();
                  //                 }),
                  //           )
                  //         ],
                  //       ),
                  showChips
                      ? Container()
                      : StreamBuilder<List<String>>(
                          stream: null,
                          builder: (context, snapshot) {
                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: services
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
                                                  selectedService = e;
                                                }
                                                reload();
                                              }),
                                        ))
                                    .toList(),
                              ),
                            );
                          }),
                  Expanded(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: query.snapshots(),
                      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                        if (streamSnapshot.connectionState == ConnectionState.active) {
                          if (streamSnapshot.hasError) {
                            return const Text("Error");
                          }
                          if (streamSnapshot.connectionState == ConnectionState.waiting) {
                            return Column(
                              children: const [
                                CircularProgressIndicator(),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text("Loading"),
                                )
                              ],
                            );
                          }
                          print(streamSnapshot.hasData);
                          return ListView(
                            padding: const EdgeInsets.all(8),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            children: streamSnapshot.data!.docs.map((snapshot) {
                              var data = snapshot.data()! as Map<String, dynamic>;
                              // print("I am data $data");
                              // Ngo.fromJson(data).update();
                              return CustomExpansionTile(ngo: Ngo.fromJson(data));
                            }).toList(),
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
                ],
              );
            }
            return const Text("Eroor Occured");
          }),
    );
  }

  getServiceChipStats(String service) {
    return selectedService == service;
  }
}
