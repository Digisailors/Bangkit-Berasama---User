import 'package:bangkit/constants/controller_constants.dart';
import 'package:bangkit/models/adun.dart';
import 'package:bangkit/services/firebase.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

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

  List<String> states = [];
  late Query query;
  void _showMultiSelect(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (ctx) {
        return MultiSelectDialog(
          items: postalCodes.keys.map((e) => MultiSelectItem(e.toString(), e.toString())).toList(),
          initialValue: states,
          onConfirm: (values) async {
            states = values.map((e) => e.toString()).toList();
            setState(() {
              query = aduns;
              query = query.where("state", whereIn: states);
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
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
      body: SingleChildScrollView(
        child: Column(
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
                        'ADUN',
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
                  return ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: streamSnapshot.data!.docs.map((snapshot) {
                      var data = snapshot.data()! as Map<String, dynamic>;
                      // print("I am data $data");
                      return CustomExpansionTile(ngo: Adun.fromJson(data));
                    }).toList(),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
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
  const CustomExpansionTile({Key? key, required this.ngo}) : super(key: key);
  final Adun ngo;

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
          padding: const EdgeInsets.all(4.0),
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
                  maxLines: 3,
                  softWrap: true,
                  style: const TextStyle(overflow: TextOverflow.ellipsis),
                ),
              )
            : null,
        iconColor: Colors.red,
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8),
                child: Icon(Icons.location_on, color: Colors.red),
              ),
              Flexible(
                child: Text(
                  widget.ngo.officeAddress,
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
              Text(widget.ngo.name)
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
              Text(widget.ngo.contactNumber)
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
              Text(widget.ngo.emailAddress)
            ],
            mainAxisSize: MainAxisSize.max,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.ngo.description,
              maxLines: 20,
              softWrap: true,
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
