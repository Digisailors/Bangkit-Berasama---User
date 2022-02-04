import 'package:bangkit/screens/volunteer/add_volunteer.dart';
import 'package:bangkit/screens/volunteer/volunteers.dart';
import 'package:flutter/material.dart';

class VolunteerView extends StatefulWidget {
  VolunteerView({Key? key}) : super(key: key);

  @override
  State<VolunteerView> createState() => _VolunteerViewState();
}

class _VolunteerViewState extends State<VolunteerView> {
  int index = 0;

  setIndex(value) {
    setState(() {
      index = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: index,
      children: [
        VolunteerList(setIndex: setIndex),
        AddVolunteer(setIndex: setIndex),
      ],
    );
  }
}
