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
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(80.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Flood Relief'),
                ),
                Card(
                  child: TabBar(
                    tabs: [
                      Tab(
                        text: 'Government',
                      ),
                      Tab(
                        text: 'Ngo',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          toolbarHeight: 100,
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
                child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ChoiceChip(
                        selectedColor: Colors.red,
                        selected: _choicevalue,
                        label: SizedBox(
                            width: chipWidth,
                            child: Center(
                                child: Text(
                              'Cleaning',
                              style: TextStyle(color: Colors.white),
                            ))),
                        onSelected: (bool selected) {
                          setState(() {
                            _choicevalue = selected;
                          });
                        }),
                    ChoiceChip(
                        selectedColor: Colors.red,
                        selected: _choicevalue,
                        label: SizedBox(
                            width: chipWidth,
                            child: Center(
                                child: Text(
                              'Food',
                              style: TextStyle(color: Colors.white),
                            ))),
                        onSelected: (bool selected) {
                          setState(() {
                            _choicevalue = selected;
                          });
                        }),
                    ChoiceChip(
                        selectedColor: Colors.red,
                        selected: _choicevalue,
                        label: SizedBox(
                            width: chipWidth,
                            child: Center(
                                child: Text(
                              'Assistance',
                              style: TextStyle(color: Colors.white),
                            ))),
                        onSelected: (bool selected) {
                          setState(() {
                            _choicevalue = selected;
                          });
                        })
                  ],
                ),
                CustomExpansionTile(
                  hospitalname: 'Gleneagles Hospital Medini Johor',
                  hospitaladdress: '2, Jalan Medini Utara 4, 79250 Nusajaya, Johor, Malaysia',
                  phonenumber: '+60 123456789',
                  description:
                      'Lorem ipsum is simply dummy text of the printing \nand typesettiing industry.Lorem ipsum has been the industry \'s standard dummy text ever since the 1500s.',
                  contactperson: 'Adam',
                  emailid: 'new.info@gmail.com',
                ),
              ],
            )),
            SingleChildScrollView(
                child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ChoiceChip(
                        selectedColor: Colors.red,
                        selected: _choicevalue,
                        label: SizedBox(
                            width: chipWidth,
                            child: Center(
                                child: Text(
                              'Cleaning',
                              style: TextStyle(color: Colors.white),
                            ))),
                        onSelected: (bool selected) {
                          setState(() {
                            _choicevalue = selected;
                          });
                        }),
                    ChoiceChip(
                        selectedColor: Colors.red,
                        selected: _choicevalue,
                        label: SizedBox(
                            width: chipWidth,
                            child: Center(
                                child: Text(
                              'Food',
                              style: TextStyle(color: Colors.white),
                            ))),
                        onSelected: (bool selected) {
                          setState(() {
                            _choicevalue = selected;
                          });
                        }),
                    ChoiceChip(
                        selectedColor: Colors.red,
                        selected: _choicevalue,
                        label: SizedBox(
                            width: chipWidth,
                            child: const Center(
                                child: Text(
                              'Assistance',
                              style: TextStyle(color: Colors.white),
                            ))),
                        onSelected: (bool selected) {
                          setState(() {
                            _choicevalue = selected;
                          });
                        })
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CustomExpansionTile(
                    hospitalname: 'Hospital1',
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
          ],
        ),
      ),
    );
  }
}

class CustomExpansionTile extends StatelessWidget {
  const CustomExpansionTile({
    Key? key,
    this.hospitalname,
    this.hospitaladdress,
    this.description,
    this.contactperson,
    this.Hospitalname,
    this.phonenumber,
    this.emailid,
  }) : super(key: key);
  final String? hospitalname;
  final String? hospitaladdress;
  final String? description;
  final String? contactperson;
  final String? Hospitalname;
  final String? phonenumber;
  final String? emailid;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 2,
        child: ExpansionTile(
          title: Text(
            '$hospitalname',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          iconColor: Colors.red,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text('$description'),
            ),
            Divider(),
            ListTile(
              leading: const Icon(
                Icons.add_location_alt_sharp,
                color: Colors.red,
              ),
              title: Text('$hospitaladdress'),
            ),
            ListTile(
              leading: const Icon(
                Icons.person_rounded,
                color: Colors.red,
              ),
              title: Text('$contactperson'),
            ),
            ListTile(
              leading: const Icon(
                Icons.phone,
                color: Colors.red,
              ),
              title: Text('$phonenumber'),
            ),
            ListTile(
              leading: const Icon(
                Icons.mail,
                color: Colors.red,
              ),
              title: Text('$emailid'),
            ),
          ],
        ),
      ),
    );
  }
}
