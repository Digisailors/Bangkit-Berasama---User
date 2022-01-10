import 'package:bangkit/models/ngo.dart';
import 'package:bangkit/services/firebase.dart';
import 'package:flutter/material.dart';

import 'repo_list.dart';

class CustomExpansionTile extends StatelessWidget {
  const CustomExpansionTile({Key? key, required this.ngo}) : super(key: key);
  final Ngo ngo;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: Text(
          ngo.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(ngo.description),
        iconColor: Colors.red,
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.location_on, color: Colors.red),
              ),
              Text(ngo.address)
            ],
            mainAxisSize: MainAxisSize.max,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.person_rounded, color: Colors.red),
              ),
              Text(ngo.contactPersonName)
            ],
            mainAxisSize: MainAxisSize.max,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.phone, color: Colors.red),
              ),
              Text(ngo.phoneNumber)
            ],
            mainAxisSize: MainAxisSize.max,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.mail, color: Colors.red),
              ),
              Text(ngo.email)
            ],
            mainAxisSize: MainAxisSize.max,
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
