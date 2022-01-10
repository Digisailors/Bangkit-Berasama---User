import 'package:bangkit/constants/controller_constants.dart';
import 'package:bangkit/models/adun.dart';
import 'package:bangkit/services/firebase.dart';
import 'package:flutter/material.dart';

class AdunList extends StatelessWidget {
  const AdunList({Key? key, required this.query}) : super(key: key);

  final Query query;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/bina.png', height: 80),
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
          Text(
            "ADUN",
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: query.snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot> streamSnapshot) {
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
    );
  }
}

class CustomExpansionTile extends StatelessWidget {
  const CustomExpansionTile({Key? key, required this.ngo}) : super(key: key);
  final Adun ngo;

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
              Text(ngo.officeAddress)
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
              Text(ngo.name)
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
              Text(ngo.contactNumber)
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
              Text(ngo.emailAddress)
            ],
            mainAxisSize: MainAxisSize.max,
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
