import 'package:bangkit/models/ngo.dart';
import 'package:bangkit/services/firebase.dart';
import 'package:flutter/material.dart';

class FloodRelief extends StatefulWidget {
  const FloodRelief({Key? key}) : super(key: key);

  @override
  _FloodReliefState createState() => _FloodReliefState();
}

class _FloodReliefState extends State<FloodRelief> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chipLength = ServiceType.values.length;
    _tabController = TabController(length: 2, vsync: this);
  }

  int chipLength = 0;

  Query getQuery() {
    switch (_tabController.index) {
      case 0:
        return Ngo.list(type: Type.floodReleif, entityType: EntityType.government, postCode: "");
      case 1:
        return Ngo.list(type: Type.floodReleif, entityType: EntityType.private, postCode: "");
      default:
        return Ngo.list(type: Type.floodReleif, entityType: EntityType.government, postCode: "");
    }
  }

  Widget choiceChip({required bool choicevalue, double? chipWidth}) {
    return ChoiceChip(
        selectedColor: Colors.red,
        selected: choicevalue,
        label: SizedBox(
            width: chipWidth,
            child: const Center(
                child: Text(
              'All',
              style: TextStyle(color: Colors.white),
            ))),
        onSelected: (bool selected) {
          setState(() {
            choicevalue = selected;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    bool _choicevalue = true;

    var chipWidth = MediaQuery.of(context).size.width / 5;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  size: 30,
                  color: Colors.red,
                )),
          )
        ],
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 8),
          child: Container(
            width: 50,
            height: 50,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              'assets/man.png',
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: const Color(0xFFF4F4F4),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome back',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              'Andrew simons',
              style: Theme.of(context).textTheme.headline6,
            )
          ],
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              text: 'Government',
            ),
            Tab(
              text: 'Ngo',
            ),
          ],
        ),
        toolbarHeight: 100,
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  FilterChip(label: Text(""), onSelected: (bool value) {}),
                ],
              ),
              Expanded(child: NgoList(query: getQuery()))
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ChoiceChip(
                        selectedColor: Colors.red,
                        selected: _choicevalue,
                        label: SizedBox(
                            width: chipWidth,
                            child: const Center(
                                child: Text(
                              'All',
                              style: TextStyle(color: Colors.white),
                            ))),
                        onSelected: (bool selected) {
                          setState(() {
                            _choicevalue = selected;
                          });
                        }),
                  ),
                ],
              ),
              Expanded(child: NgoList(query: getQuery()))
            ],
          ),
        ],
      ),
    );
  }
}

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
        iconColor: Colors.red,
        children: [
          Container(
            color: Colors.grey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(ngo.description),
                ),
                Divider(),
                ListTile(
                  leading: const Icon(
                    Icons.add_location_alt_sharp,
                    color: Colors.red,
                  ),
                  title: Text(ngo.address),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.person_rounded,
                    color: Colors.red,
                  ),
                  title: Text(ngo.contactPersonName),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.phone,
                    color: Colors.red,
                  ),
                  title: Text(ngo.phoneNumber),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.mail,
                    color: Colors.red,
                  ),
                  title: Text(ngo.email),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NgoList extends StatelessWidget {
  const NgoList({Key? key, required this.query}) : super(key: key);

  final Query query;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
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
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: streamSnapshot.data!.docs.map((snapshot) {
              var data = snapshot.data()! as Map<String, dynamic>;
              print("I am data $data");
              return CustomExpansionTile(ngo: Ngo.fromJson(data));
            }).toList(),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
