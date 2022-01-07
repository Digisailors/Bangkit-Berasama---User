import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'floodrelief.dart';

class Volunteer extends StatefulWidget {
  const Volunteer({Key? key}) : super(key: key);

  @override
  _VolunteerState createState() => _VolunteerState();
}

class _VolunteerState extends State<Volunteer> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    bool _pinned = true;
    bool _snap = false;
    bool _floating = false;

    bool _choicevalue = true;

    int _initialindex = 1;
    var chipWidth = MediaQuery.of(context).size.width / 5;
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
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
          backgroundColor: Color(0xFFF4F4F4),
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
          toolbarHeight: 100,
        ),
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Volunteer'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomExpansionTile(
                hospitalname: 'Gleneagles Hospital Medini Johor',
                hospitaladdress: '2, Jalan Medini Utara 4, 79250 Nusajaya, Johor, Malaysia',
                phonenumber: '+60 123456789',
                description:
                    'Lorem ipsum is simply dummy text of the printing \nand typesettiing industry.Lorem ipsum has been the industry \'s standard dummy text ever since the 1500s.',
                contactperson: 'Adam',
                emailid: 'new.info@gmail.com',
              ),
            ),
          ],
        )),
      ),
    );
  }
}
