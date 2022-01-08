import 'package:bangkit/constants/controller_constants.dart';
import 'package:bangkit/models/profile.dart';
import 'package:bangkit/profile/profile.dart';
import 'package:bangkit/services/auth.dart';
import 'package:bangkit/weather/weatherwidgets.dart';
import 'package:bangkit/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

import 'ngo_emergency.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key,  required this.profile}) : super(key: key);
  final Profile profile;

  @override
  _HomePageState createState() => _HomePageState();
}





class _HomePageState extends State<HomePage> {


  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }







  @override
  Widget build(BuildContext context) {










    return Scaffold(
        floatingActionButton:BottomNavigationBar(
          items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            tooltip: 'Home',


            // backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            tooltip: 'Home',


            // backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            tooltip: 'Home',


            // backgroundColor: Colors.red,
          ),



        ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.red,
          onTap: _onItemTapped,
        ),
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


            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  widget.profile.name,
                  style: Theme.of(context).textTheme.headline6,
                )
              ],
            ),
            toolbarHeight: 100,

        ),


        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 30),
                child: CarouselSlider(
                  items: [
                    // Generated code for this Card Widget...
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: Colors.white,
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Stack(
                        children: const [
                          WeatherBoard(
                            assetlocation: 'https://cdn-icons-png.flaticon.com/512/1146/1146869.png',
                          ),
                        ],
                      ),
                    ),
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: Colors.white,
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const WeatherBoard(
                        assetlocation: 'https://cdn-icons-png.flaticon.com/512/3445/3445722.png',
                      ),
                    ),

                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: Colors.white,
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Stack(
                        children: const [
                          Align(
                              alignment: AlignmentDirectional(-0.8, -0.65),
                              child: VideoApp(
                                url: 'https://media.istockphoto.com/videos/hurricane-matthew-2016-landfall-radar-video-id1017267864',
                              )),
                        ],
                      ),
                    ),
                  ],
                  options: CarouselOptions(height: 225, enlargeCenterPage: true, autoPlay:
                  false, aspectRatio: 4),
                ),
              ),

              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(),
                    child: Text(
                      'Categories',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Wrap(
                      alignment: WrapAlignment.spaceEvenly,
                      children: [
                        CategorySquareTile(
                            assetPath: 'assets/police.png',
                            label: 'Police Report',
                            onTap: () {
                              Navigator.of(context).pushNamed('/ngoEmergencyLanding');
                            }),
                        CategorySquareTile(
                            assetPath: 'assets/ngo.png',
                            label: 'NGO Emergency',
                            onTap: () {
                              Get.to(() => NGOLandingPage());
                            }),
                        CategorySquareTile(
                            assetPath: 'assets/Rebuild.png',
                            label: 'Rebuild',
                            onTap: () {
                              Navigator.of(context).pushNamed('/ngoEmergencyLanding');
                            }),
                        CategorySquareTile(
                            assetPath: 'assets/feedback.png',
                            label: 'Feedback',
                            onTap: () {
                              print('feedback');
                              Navigator.of(context).pushNamed('/ngoEmergencyLanding');
                            }),
                        CategorySquareTile(
                            assetPath: 'assets/adun.png',
                            label: 'Adun',
                            onTap: () {
                              Navigator.of(context).pushNamed('/ngoEmergencyLanding');
                            }),
                        CategorySquareTile(
                            assetPath: 'assets/man.png',
                            label: 'profile',
                            onTap: () {
                              Get.to(ProfileWidget( profileModel:widget.profile));
                            }),
                      ],
                    ),
                  ),
                  Divider(),
                ],
              ),

              // getImageTile('https://cimages.milaap.org/milaap/image/upload/c_fill,g_faces,h_452,w_603/v1639160721/production/images/campaign/427988/WhatsApp_Image_2021-12-10_at_11.50.38_PM_yy8krg_1639160725.jpg'),
              // getImageTile('https://cimages.milaap.org/milaap/image/upload/c_fill,g_faces,h_452,w_603/v1639992568/production/images/campaign/432649/WhatsApp_Image_2021-12-20_at_14.34.04_ki3c5i_1639992571.jpg'),
              // getImageTile('https://cimages.milaap.org/milaap/image/upload/c_fill,g_faces,h_452,'
              //     'w_603/v1637742107/production/images/campaign/419357/IMG_20210305_110858_fiij8t_1637742113.jpg'),
            ],
          ),
        ));
  }
}

class CategorySquareTile extends StatelessWidget {
  const CategorySquareTile({
    Key? key,
    required this.assetPath,
    required this.label,
    this.onTap,
  }) : super(key: key);
  final String assetPath;
  final String label;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.width / 3.5,
          width: MediaQuery.of(context).size.width / 3.5,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: ElevatedButton(
                onPressed: onTap,
                child: Image.asset(assetPath),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0), side: BorderSide(color: Colors.white))))),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 3.5,
          child: Center(child: Text(label)),
        )
      ],
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.profile,
  }) : super(key: key);

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.location_pin,
                    color: Colors.red,
                  ),
                  Text(
                    profile.primaryAddress.state.toString(),
                    style: const TextStyle(color: Colors.black),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Text(
                  profile.primaryAddress.pincode,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        )
      ],
      leading: Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 8),
        child: Container(
          width: 70,
          height: 70,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            'assets/man.png',
          ),
        ),
      ),
      toolbarHeight: 80,
      elevation: 0,
      backgroundColor: const Color(0xFFF4F4F4),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome back',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            profile.name,
            style: Theme.of(context).textTheme.headline6,
          )
        ],
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: Colors.white,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
                  child: Icon(
                    Icons.search,
                    color: Colors.red,
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                    child: TextFormField(
                      obscureText: false,
                      decoration: const InputDecoration(
                        labelText: 'Search',
                        labelStyle: TextStyle(
                          fontFamily: 'Lexend Deca',
                          color: Color(0xFF82878C),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x004B39EF),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x004B39EF),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                      ),
                      style: TextStyle(
                        fontFamily: 'Lexend Deca',
                        color: Color(0xFF151B1E),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                Icon(
                  Icons.filter_alt,
                  color: Colors.red,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
