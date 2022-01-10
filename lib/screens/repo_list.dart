import 'dart:developer';

import 'package:bangkit/constants/controller_constants.dart';
import 'package:bangkit/constants/themeconstants.dart';
import 'package:bangkit/models/ngo.dart';
import 'package:bangkit/services/firebase.dart';
import 'package:bangkit/widgets/dropdownSelect.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import 'repoRouter.dart';

class NgoList extends StatefulWidget {
  NgoList({Key? key, required this.query}) : super(key: key);

  final Query query;

  @override
  State<NgoList> createState() => _NgoListState();
}

class _NgoListState extends State<NgoList> {
  List<String> states = [];
  List<ServiceType> serviceTypes = [];
  bool isGovernment = true;

  late Query query;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    query = widget.query;
  }

  Set<dynamic> filters = {};
  void reload() {
    setState(() {
      query = ngos;
      filters = {};
      if (states.isNotEmpty) {
        query = ngos.where("state", whereIn: states);
      }

      if (serviceTypes.isNotEmpty) {
        filters.addAll(serviceTypes.map((e) => e.index).toList());
      }
      if (filters.isNotEmpty) {
        query = ngos.where("searchArray", arrayContains: filters.toList());
      }
      print(filters);
    });
  }

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
      body: Column(
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
          Row(
            children: [
              FilterChip(
                  selected: isGovernment,
                  label: Text("GOVERNMENT", style: TextStyle(color: isGovernment ? Colors.white : const Color(0xFF22A8E0))),
                  onSelected: (bool value) {
                    isGovernment = true;
                  }),
              FilterChip(
                  selected: !isGovernment,
                  label: Text("PRIVATE", style: TextStyle(color: !isGovernment ? Colors.white : const Color(0xFF22A8E0))),
                  onSelected: (bool value) {
                    isGovernment = false;
                  })
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: ServiceType.values
                  .map((e) => Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: FilterChip(
                            selected: getServiceChipStats(e),
                            label: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                e.toString().split('.').last.toUpperCase(),
                                style: TextStyle(color: getServiceChipStats(e) ? Colors.white : Colors.black),
                              ),
                            ),
                            onSelected: (bool value) {
                              if (value == true) {
                                serviceTypes.add(e);
                              } else {
                                serviceTypes.remove(e);
                              }
                              reload();
                            }),
                      ))
                  .toList(),
            ),
          ),
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
      ),
    );
  }

  getServiceChipStats(ServiceType e) {
    return serviceTypes.any((element) {
      if (e == element) {
        return true;
      } else {
        return false;
      }
    });
  }
}
