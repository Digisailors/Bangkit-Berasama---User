import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  bool _customTileExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 300,
                color: Colors.red,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        color: Colors.white,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 50,
                          child: Image.asset('assets/man.png', height: 80, width: 80),
                        ),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Rajesh',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      )
                    ],
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                child: ExpansionTile(
                  initiallyExpanded: true,
                  title: Text(
                    'Person Details',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  iconColor: Colors.red,
                  children: [
                    Divider(),
                    ListTile(
                      leading: const Icon(
                        Icons.person,
                        color: Colors.red,
                      ),
                      title: Text('Name'),
                      subtitle: Text('Rajesh'),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.phone,
                        color: Colors.red,
                      ),
                      title: Text('Phone Number'),
                      subtitle: Text('+60 123456678'),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.phone,
                        color: Colors.red,
                      ),
                      title: Text('Secondar Contact Number'),
                      subtitle: Text('+60 123456789'),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.mail,
                        color: Colors.red,
                      ),
                      title: Text('Email'),
                      subtitle: Text('raj@gmail.com'),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                child: ExpansionTile(
                  title: Text(
                    'PrimaryAddress',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  iconColor: Colors.red,
                  children: [
                    Divider(),
                    ListTile(
                      leading: const Icon(
                        Icons.home,
                        color: Colors.red,
                      ),
                      title: Text('Address'),
                      subtitle: Text('2, Jalan Medini Utara 4, 79250 Nusajaya, Johor, Malaysia'),
                    ),
                    ListTile(
                      leading: const Icon(
                        FontAwesomeIcons.hotel,
                        color: Colors.red,
                      ),
                      title: Text('State'),
                      subtitle: Text('Kuala lampur'),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.local_post_office,
                        color: Colors.red,
                      ),
                      title: Text('Postcode'),
                      subtitle: Text('888625'),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.list,
                        color: Colors.red,
                      ),
                      title: Text('Description'),
                      subtitle: Text(
                          'Lorem ipsum is simply dummy text of the printing \nand typesettiing industry.Lorem ipsum has been the industry \'s standard dummy text ever since the 1500s.'),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.door_back_door,
                        color: Colors.red,
                      ),
                      title: Text('Door Color'),
                      subtitle: Text('Orange'),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.roofing,
                        color: Colors.red,
                      ),
                      title: Text('Roof Color'),
                      subtitle: Text('Orange'),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                child: ExpansionTile(
                  title: Text(
                    'PrimaryAddress',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  iconColor: Colors.red,
                  children: [
                    Divider(),
                    ListTile(
                      leading: const Icon(
                        Icons.home,
                        color: Colors.red,
                      ),
                      title: Text('Address'),
                      subtitle: Text('2, Jalan Medini Utara 4, 79250 Nusajaya, Johor, Malaysia'),
                    ),
                    ListTile(
                      leading: const Icon(
                        FontAwesomeIcons.hotel,
                        color: Colors.red,
                      ),
                      title: Text('State'),
                      subtitle: Text('Kuala lampur'),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.local_post_office,
                        color: Colors.red,
                      ),
                      title: Text('Postcode'),
                      subtitle: Text('888625'),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.list,
                        color: Colors.red,
                      ),
                      title: Text('Description'),
                      subtitle: Text(
                          'Lorem ipsum is simply dummy text of the printing \nand typesettiing industry.Lorem ipsum has been the industry \'s standard dummy text ever since the 1500s.'),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.door_back_door,
                        color: Colors.red,
                      ),
                      title: Text('Door Color'),
                      subtitle: Text('Orange'),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.roofing,
                        color: Colors.red,
                      ),
                      title: Text('Roof Color'),
                      subtitle: Text('Orange'),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(onPressed: () {}, child: Text('Sign Out')),
            )
          ],
        ),
      ),
    );
  }
}
