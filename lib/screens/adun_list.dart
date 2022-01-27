import 'package:bangkit/constants/constituency_list.dart';
import 'package:bangkit/constants/controller_constants.dart';
import 'package:bangkit/constants/themeconstants.dart';
import 'package:bangkit/models/adun.dart';
import 'package:bangkit/services/firebase.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AdunList extends StatefulWidget {
  AdunList({Key? key}) : super(key: key);

  @override
  State<AdunList> createState() => _AdunListState();
}

class _AdunListState extends State<AdunList> {
  @override
  void initState() {
    super.initState();
    query = aduns;
  }

  List<String> selectedStates = [];
  List<String> selectedFederals = [];
  late Query query;
  void _showMultiSelect(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (ctx) {
        return MultiSelectDialog(
          title: const Text("Select State"),
          items: federals.keys.map((e) => MultiSelectItem(e.toString(), e.toString())).toList(),
          initialValue: selectedStates,
          onConfirm: (values) async {
            selectedStates = values.map((e) => e.toString()).toList();
            setState(() {
              query = aduns;
              query = query.where("state", whereIn: selectedStates);
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context),
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
                      'ADUN LIST',
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
          MultiSelectDialogField(
            buttonText: const Text("Select Constituency"),
            title: const Text("Select Constituency"),
            searchable: true,
            searchHint: "Select Constituency",
            items: getFederals(),
            onConfirm: (List<String?> values) {
              setState(() {
                selectedFederals = values.map((e) => e.toString()).toList();
              });
            },
          ),
          StreamBuilder<QuerySnapshot>(
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
                // print(streamSnapshot.hasData);
                return Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(8),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: streamSnapshot.data!.docs.map((snapshot) {
                      var data = snapshot.data()! as Map<String, dynamic>;
                      var adun = Adun.fromJson(data);
                      if (selectedFederals.isNotEmpty) {
                        var result = selectedFederals.contains(adun.federal);
                        return result ? CustomExpansionTile(adun: adun) : Container();
                      } else {
                        return CustomExpansionTile(adun: adun);
                      }
                      // print("I am data $data");
                    }).toList(),
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }

  getFederals() {
    var returns = [];
    if (selectedStates.isEmpty) {
      federals.keys.forEach((element) {
        returns.addAll(federals[element]!.keys.toList());
      });
    } else {
      selectedStates.forEach((element) {
        returns.addAll(federals[element]!.keys.toList());
      });
    }
    return returns.map((e) => MultiSelectItem(e.toString(), e)).toList();
  }
}

// class CustomExpansionTile extends StatelessWidget {
//   const CustomExpansionTile({Key? key, required this.ngo}) : super(key: key);
//   final Adun ngo;

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: ExpansionTile(
//         title: Text(
//           ngo.name,
//           style: const TextStyle(fontWeight: FontWeight.bold),
//         ),
//         subtitle: Text(ngo.description),
//         iconColor: Colors.red,
//         expandedCrossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               const Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Icon(Icons.location_on, color: Colors.red),
//               ),
//               Text(ngo.officeAddress)
//             ],
//             mainAxisSize: MainAxisSize.max,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               const Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Icon(Icons.person_rounded, color: Colors.red),
//               ),
//               Text(ngo.name)
//             ],
//             mainAxisSize: MainAxisSize.max,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               const Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Icon(Icons.phone, color: Colors.red),
//               ),
//               Text(ngo.contactNumber)
//             ],
//             mainAxisSize: MainAxisSize.max,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               const Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Icon(Icons.mail, color: Colors.red),
//               ),
//               Text(ngo.emailAddress)
//             ],
//             mainAxisSize: MainAxisSize.max,
//           ),
//           const SizedBox(height: 8),
//         ],
//       ),
//     );
//   }
// }

class CustomExpansionTile extends StatefulWidget {
  const CustomExpansionTile({Key? key, required this.adun}) : super(key: key);
  final Adun adun;

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  bool showSubtitle = true;

  void _launchMailURL() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: widget.adun.emailAddress,
    );
    String url = params.toString();
    await launch(url);
  }

  void _launchPhoneURL() async {
    await launch("tel:${widget.adun.contactNumber}");
  }

  void _launchURL() async {
    if (await canLaunch(widget.adun.weburl)) {
      await launch(widget.adun.weburl);
    }
  }

  void _launchMapURL() async {
    await launch("https://www.google.com/maps/search/${widget.adun.officeAddress}");
  }

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
          padding: const EdgeInsets.all(4.0),
          child: ClipOval(
            child: AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  widget.adun.image,
                  fit: BoxFit.cover,
                )),
          ),
        ),
        title: Padding(
          padding: EdgeInsets.symmetric(vertical: showSubtitle ? 4 : 32),
          child: Text(
            widget.adun.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        subtitle: showSubtitle
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  widget.adun.description,
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
              widget.adun.description,
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
                    "${widget.adun.officeAddress}, ${widget.adun.state}, ${widget.adun.postCode}",
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
              Text(widget.adun.name)
            ],
            mainAxisSize: MainAxisSize.max,
          ),
          GestureDetector(
            onTap: _launchPhoneURL,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.phone, color: Colors.red),
                ),
                Text(widget.adun.contactNumber)
              ],
              mainAxisSize: MainAxisSize.max,
            ),
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
                Text(widget.adun.emailAddress)
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
                  child: Icon(Icons.facebook, color: Colors.red),
                ),
                Flexible(
                  child: Text(
                    widget.adun.weburl,
                    softWrap: true,
                    maxLines: 3,
                    style: const TextStyle(overflow: TextOverflow.clip),
                  ),
                )
              ],
              mainAxisSize: MainAxisSize.max,
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
