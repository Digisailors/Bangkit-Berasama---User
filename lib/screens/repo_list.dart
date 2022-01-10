import 'package:bangkit/constants/controller_constants.dart';
import 'package:bangkit/models/ngo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'repoRouter.dart';

class NgoList extends StatelessWidget {
  const NgoList({Key? key, required this.query}) : super(key: key);

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
      body: StreamBuilder<QuerySnapshot>(
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
                return CustomExpansionTile(ngo: Ngo.fromJson(data));
              }).toList(),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
