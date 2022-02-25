// ignore_for_file: empty_statements

import 'package:bangkit/constants/controller_constants.dart';
import 'package:bangkit/constants/themeconstants.dart';
import 'package:bangkit/models/profile.dart';
import 'package:bangkit/screens/page_view.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: getAppBar(context),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 16),
                child: CarouselSlider(
                  items: const [
                    Hero(
                        tag: '1',
                        child: CarouselTile(
                          url: "https://api.met.gov.my/static/images/radar-latest.gif",
                          tag: "1",
                        )),
                    Hero(
                        tag: '2',
                        child: CarouselTile(
                          url: "https://api.met.gov.my/static/images/satelit-latest.gif",
                          tag: "2",
                        )),
                    Hero(
                        tag: '3',
                        child: CarouselTile(
                          url: "https://api.met.gov.my/static/images/swirl-latest.gif",
                          tag: "3",
                        )),
                  ],
                  options: CarouselOptions(
                      enlargeCenterPage: true,
                      initialPage: 1, // enlargeStrategy: CenterPageEnlargeStrategy.height,
                      enableInfiniteScroll: false,
                      reverse: false,
                      height: getHeight(context) * 0.3,
                      // enlargeCenterPage: true,
                      autoPlay: false,
                      aspectRatio: 16 / 9),
                ),
              ),

              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 4, left: 8, right: 8, top: 8),
                      child: Text(
                        "Categories",
                        style: TextStyle(
                          // shadows: [Shadow(color: Colors.black, offset: Offset(0, -5))],
                          color: Colors.black,
                          fontSize: 20,
                          decorationThickness: 4,
                        ),
                      ),
                    ),
                  ),
                  const Divider(),
                  SizedBox(
                    height: getHeight(context) * 0.012,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CategorySquareTile(
                            assetPath: 'assets/ngologo.png',
                            label: 'Database',
                            onTap: () {
                              pageController.load!(1);
                            }),
                        CategorySquareTile(
                            assetPath: 'assets/aa.png',
                            label: 'Gov Agencies',
                            onTap: () {
                              pageController.load!(2);
                            }),
                        CategorySquareTile(
                            assetPath: 'assets/adun.png',
                            label: 'Ahli Parlimen \n & ADUN',
                            onTap: () {
                              pageController.load!(3);
                            }),
                        CategorySquareTile(
                            assetPath: 'assets/volunteer.png',
                            label: 'Volunteers',
                            onTap: () {
                              pageController.load!(4);
                            }),
                      ],
                    ),
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 8, top: 10, right: 8),
                      child: Text(
                        "Disaster Information",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                  ),
                  const Divider(),
                  Scrollbar(
                    controller: _scrollController,
                    thickness: 8,
                    radius: const Radius.circular(8),
                    isAlwaysShown: true,
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Row(
                          children: [
                            CategorySquareTile(
                                assetPath: 'assets/police.png',
                                label: 'E-PDRM\nReporting',
                                onTap: () {
                                  launch("https://ereporting.rmp.gov.my/index.aspx");
                                }),
                            CategorySquareTile(
                                assetPath: 'assets/weather.png',
                                label: 'Weather\nForecast',
                                onTap: () {
                                  pageController.load!(5);
                                }),
                            CategorySquareTile(
                                assetPath: 'assets/floodarea.png',
                                label: 'Flood Prone\nArea',
                                onTap: () {
                                  pageController.load!(6);
                                }),
                            CategorySquareTile(
                                assetPath: 'assets/pond.png',
                                label: 'Retention\nPonds',
                                onTap: () {
                                  pageController.load!(7);
                                }),
                            CategorySquareTile(
                                assetPath: 'assets/reserve.png',
                                label: 'Reserved\nAreas',
                                onTap: () {
                                  pageController.load!(8);
                                }),
                            CategorySquareTile(
                                assetPath: 'assets/dam.jpeg',
                                label: 'Hydraulic\nStructures',
                                onTap: () {
                                  // pageController.pageNumber = 7;
                                  Get.to(() => const WebViewer(url: "https://ihydro.sarawak.gov.my/iHydro/en/map/maps.jsp"));
                                }),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),

              // getImageTile('https://cimages.milaap.org/milaap/image/upload/c_fill,g_faces,h_452,w_603/v1639160721/production/images/campaign/427988/WhatsApp_Image_2021-12-10_at_11.50.38_PM_yy8krg_1639160725.jpg'),
              // getImageTile('https://cimages.milaap.org/milaap/image/upload/c_fill,g_faces,h_452,w_603/v1639992568/production/images/campaign/432649/WhatsApp_Image_2021-12-20_at_14.34.04_ki3c5i_1639992571.jpg'),
              // getImageTile('https://cimages.milaap.org/milaap/image/upload/c_fill,g_faces,h_452,'
              //     'w_603/v1637742107/production/images/campaign/419357/IMG_20210305_110858_fiij8t_1637742113.jpg'),
            ],
          ),
        ),
      ),
    );
  }
}

class CarouselTile extends StatelessWidget {
  const CarouselTile({
    Key? key,
    required this.url,
    required this.tag,
  }) : super(key: key);

  final String url;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => Material(
              child: Stack(
                children: [
                  PhotoView(
                    imageProvider: NetworkImage(url),
                    heroAttributes: PhotoViewHeroAttributes(tag: tag.toString()),
                  ),
                  Positioned(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )),
                  ),
                ],
              ),
            ));
      },
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: Colors.white,
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: NetworkImageLoader(url: url),
      ),
    );
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width / 5,
            width: MediaQuery.of(context).size.width / 5,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: ElevatedButton(
                  onPressed: onTap,
                  child: Image.asset(
                    assetPath,
                    fit: BoxFit.fitHeight,
                    scale: 0.1,
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0), side: const BorderSide(color: Colors.white))))),
            ),
          ),
          Text(label, textAlign: TextAlign.center),
        ],
      ),
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
                      style: const TextStyle(
                        fontFamily: 'Lexend Deca',
                        color: Color(0xFF151B1E),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                const Icon(
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

class NetworkImageLoader extends StatelessWidget {
  const NetworkImageLoader({
    Key? key,
    required this.url,
  }) : super(key: key);
  final String url;

  @override
  Widget build(BuildContext context) {
    // File file = File(url);
    return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(18)),
        child: Image.network(url, fit: BoxFit.fill, width: 1000.0, loadingBuilder: getLoadingBuilder));
  }
}

Widget getLoadingBuilder(BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
  if (loadingProgress == null) return child;
  return const Center(child: CircularProgressIndicator());
}
