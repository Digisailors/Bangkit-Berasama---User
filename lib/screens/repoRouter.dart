// ignore_for_file: file_names

import 'package:bangkit/models/ngo.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';


import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';


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
          padding: const EdgeInsets.only(bottom: 16, left: 4, right: 4, top: 4),
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
                  widget.ngo.description + "\n\nService Type : ${widget.ngo.service}",
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
              "\nService Type : ${widget.ngo.service}\n",
              maxLines: 2,
              softWrap: true,
              style: const TextStyle(overflow: TextOverflow.ellipsis),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.ngo.description,
              maxLines: 20,
              softWrap: true,
            ),
          ),
          GestureDetector(
            onTap: _launchMapURL,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(Icons.location_on, color: Colors.red),
                ),
                Flexible(
                  child: Text(
                    widget.ngo.address + ",${widget.ngo.postCode}, ${widget.ngo.state}",
                    maxLines: 3,
                    softWrap: true,
                    style: const TextStyle(overflow: TextOverflow.clip),
                  ),
                )
              ],
              mainAxisSize: MainAxisSize.max,
            ),
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
              GestureDetector(
                onTap: _launchPhoneURL,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.phone, color: Colors.red),
                ),
              ),
              Text(widget.ngo.phoneNumber)
            ],
            mainAxisSize: MainAxisSize.max,
          ),
          GestureDetector(
            onTap: _launchMailURL,
            child: Row(
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
          ),
          GestureDetector(
            onTap: _launchURL,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(FontAwesomeIcons.facebook, color: Colors.red),
                ),
                Text(widget.ngo.urlWeb)
              ],
              mainAxisSize: MainAxisSize.max,
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  void _launchMailURL() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: widget.ngo.email,
    );
    String url = params.toString();
    if (await canLaunch(url)) {
      await launch(
        url,

      );
    } else {
      throw 'Could not launch $url';
    }
 }

  void _launchPhoneURL() async {
    final uri = Uri(
      scheme: 'tel',
      path: widget.ngo.phoneNumber,
    );
    var url = uri.toString();
    if (await canLaunch(url)) {
      await launch(
        url,

      );
    } else {
      throw 'Could not launch $url';
    }
  }

  void _launchURL() async {
    if (await canLaunch(widget.ngo.urlWeb)) {
      await launch(widget.ngo.urlWeb);
    }
  }
 void _launchMapURL() async {

      final url = Uri.encodeFull("http://maps.apple.com/?q=${widget.ngo.address}");
      if (await canLaunch(url)) {
        await launch(
          url,
          enableJavaScript: false,
          enableDomStorage: false,
          universalLinksOnly: false,
          headers: <String, String>{'my_header_key': 'my_header_value'},
        );
      } else {
        throw 'Could not launch $url';
      }

   // await launch("http://maps.apple.com/?address${widget.ngo.address}");
    // forceSafariVC: false,
    // forceWebView: true);
  }
}