// ignore_for_file: file_names

import 'package:bangkit/models/ngo.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomExpansionTile extends StatefulWidget {
  const CustomExpansionTile({Key? key, required this.ngo}) : super(key: key);
  final Ngo ngo;

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  bool showSubtitle = true;

  @override
  Widget build(BuildContext context) {
    // ngo.update();
    return Card(
      child: ExpansionTile(
        onExpansionChanged: (bool value) {
          setState(() {
            showSubtitle = !showSubtitle;
          });
        },
        leading: Padding(
          padding: const EdgeInsets.only(bottom: 8, left: 4, right: 4, top: 4),
          child: ClipOval(
            child: AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  widget.ngo.image,
                  fit: BoxFit.cover,
                )),
          ),
        ),
        title: Padding(
          padding: EdgeInsets.symmetric(vertical: showSubtitle ? 4 : 32),
          child: Text(
            widget.ngo.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        subtitle: showSubtitle
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  widget.ngo.description,
                  maxLines: 2,
                  softWrap: true,
                  style: const TextStyle(overflow: TextOverflow.ellipsis),
                ),
              )
            : null,
        iconColor: Colors.red,
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.ngo.description,
              maxLines: 20,
              softWrap: true,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8),
                child: Icon(Icons.location_on, color: Colors.red),
              ),
              Flexible(
                child: Text(
                  widget.ngo.address,
                  maxLines: 3,
                  softWrap: true,
                  style: const TextStyle(overflow: TextOverflow.clip),
                ),
              )
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
              Text(widget.ngo.contactPersonName)
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
              Text(widget.ngo.phoneNumber)
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
              Text(widget.ngo.email)
            ],
            mainAxisSize: MainAxisSize.max,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(FontAwesomeIcons.facebook, color: Colors.red),
              ),
              Text(widget.ngo.urlSocialMedia)
            ],
            mainAxisSize: MainAxisSize.max,
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
