import 'package:bangkit/models/profile.dart';
import 'package:bangkit/weather/weatherwidgets.dart';
import 'package:bangkit/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';

class NgoHomepage extends StatefulWidget {
  const NgoHomepage({Key? key, required this.profile}) : super(key: key);
  final Profile profile;

  @override
  _NgoHomepageState createState() => _NgoHomepageState();
}

class _NgoHomepageState extends State<NgoHomepage> {
  @override
  Widget getTile() {
    return GestureDetector(
      onTap: () {
        // Get.to(() => Story());
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: Colors.white,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Image.network(
                    'https://image.freepik.com/free-photo/environment-volunteer-concept-with-group-persons_23-2147807188.jpg',
                    width: MediaQuery.of(context).size.width,
                    height: 160,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 8, 12, 16),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: const [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          child: Text(
                            'Raised by : Prem ji',
                            style: TextStyle(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF4B39EF),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: 1,
                    decoration: const BoxDecoration(
                      color: Color(0xFFDBE2E7),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(14, 4, 24, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: const [
                        Text(
                          '\$14,502',
                          style: TextStyle(
                            fontFamily: 'Lexend Deca',
                            color: Color(0xFF090F13),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                          child: Text(
                            '/ \$24,999',
                            style: TextStyle(
                              fontFamily: 'Lexend Deca',
                              color: Colors.blue,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.9,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFDBE2E7),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  height: 8,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          child: Text(
                            'Charity 5K Race for a Cure',
                            style: TextStyle(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF151B1E),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              // Get.to(PaymentWidget());
                            },
                            child: const Text("Donate")),
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 8),
                  //   child: Row(
                  //     mainAxisSize: MainAxisSize.max,
                  //     children: [
                  //       Padding(
                  //         padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                  //         child: Icon(
                  //           Icons.schedule,
                  //           color: Colors.blue,
                  //           size: 20,
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                  //         child: Text(
                  //           '8:00am',
                  //           style: TextStyle(
                  //             fontFamily: 'Lexend Deca',
                  //             color: Colors.blue,
                  //             fontSize: 14,
                  //             fontWeight: FontWeight.w500,
                  //           ),
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 4),
                  //         child: Icon(
                  //           Icons.location_on_sharp,
                  //           color: Colors.blue,
                  //           size: 20,
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                  //         child: Text(
                  //           'Alamodome, San Antonio...',
                  //           style: TextStyle(
                  //             fontFamily: 'Lexend Deca',
                  //             color: Colors.blue,
                  //             fontSize: 14,
                  //             fontWeight: FontWeight.w500,
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getImageTile(url) {
    return GestureDetector(
      onTap: () {
        // Get.to(() => Story());
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: Colors.white,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Image.network(
                    url,
                    width: MediaQuery.of(context).size.width,
                    height: 160,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: const [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 16),
                          child: Text(
                            'Raised by : Prem ji',
                            style: TextStyle(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF4B39EF),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: 1,
                    decoration: BoxDecoration(
                      color: Color(0xFFDBE2E7),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(14, 4, 24, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: const [
                        Text(
                          '\$14,502',
                          style: TextStyle(
                            fontFamily: 'Lexend Deca',
                            color: Color(0xFF090F13),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                          child: Text(
                            '/ \$24,999',
                            style: TextStyle(
                              fontFamily: 'Lexend Deca',
                              color: Colors.blue,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.9,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFDBE2E7),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  height: 8,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          child: Text(
                            'Charity 5K Race for a Cure',
                            style: TextStyle(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF151B1E),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              // Get.to(PaymentWidget());/
                            },
                            child: const Text("Donate")),
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 8),
                  //   child: Row(
                  //     mainAxisSize: MainAxisSize.max,
                  //     children: [
                  //       Padding(
                  //         padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                  //         child: Icon(
                  //           Icons.schedule,
                  //           color: Colors.blue,
                  //           size: 20,
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                  //         child: Text(
                  //           '8:00am',
                  //           style: TextStyle(
                  //             fontFamily: 'Lexend Deca',
                  //             color: Colors.blue,
                  //             fontSize: 14,
                  //             fontWeight: FontWeight.w500,
                  //           ),
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 4),
                  //         child: Icon(
                  //           Icons.location_on_sharp,
                  //           color: Colors.blue,
                  //           size: 20,
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                  //         child: Text(
                  //           'Alamodome, San Antonio...',
                  //           style: TextStyle(
                  //             fontFamily: 'Lexend Deca',
                  //             color: Colors.blue,
                  //             fontSize: 14,
                  //             fontWeight: FontWeight.w500,
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getCarousel() {
    return // Generated code for this Row-Categories Widget...
        Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 5, 2),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                // Get.to(Homepage());
              },
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 2),
                child: Material(
                  color: Colors.transparent,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Align(
                            alignment: AlignmentDirectional(0.05, 0),
                            child: FaIcon(
                              FontAwesomeIcons.menorah,
                              color: Colors.red,
                              size: 32,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                          child: Text(
                            'Memorial',
                            style: TextStyle(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF8B97A2),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                // Get.to(Homepage());
              },
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                child: Material(
                  color: Colors.transparent,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Align(
                            alignment: AlignmentDirectional(0.05, 0),
                            child: FaIcon(
                              FontAwesomeIcons.medkit,
                              color: Colors.red,
                              size: 32,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                          child: Text(
                            'Medical',
                            style: TextStyle(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF8B97A2),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                // Get.to(Homepage());
              },
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                child: Material(
                  color: Colors.transparent,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Align(
                            alignment: AlignmentDirectional(0.05, 0),
                            child: FaIcon(
                              FontAwesomeIcons.book,
                              color: Colors.red,
                              size: 32,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                          child: Text(
                            'Education',
                            style: TextStyle(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF8B97A2),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                // Get.to(Homepage());
              },
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                child: Material(
                  color: Colors.transparent,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.05, 0),
                            child: FaIcon(
                              FontAwesomeIcons.child,
                              color: Colors.red,
                              size: 32,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                          child: Text(
                            'Children',
                            style: TextStyle(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF8B97A2),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                // Get.to(Homepage());
              },
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                child: Material(
                  color: Colors.transparent,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.05, 0),
                            child: FaIcon(
                              FontAwesomeIcons.fileMedical,
                              color: Colors.red,
                              size: 32,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                          child: Text(
                            'Emergencies',
                            style: TextStyle(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF8B97A2),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                // Get.to(Homepage());
              },
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                child: Material(
                  color: Colors.transparent,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Align(
                            alignment: AlignmentDirectional(0.05, 0),
                            child: FaIcon(
                              FontAwesomeIcons.userShield,
                              color: Colors.red,
                              size: 32,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                          child: Text(
                            'Human Rights',
                            style: TextStyle(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF8B97A2),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                // Get.to(Homepage());
              },
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                child: Material(
                  color: Colors.transparent,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Align(
                            alignment: AlignmentDirectional(0.05, 0),
                            child: FaIcon(
                              FontAwesomeIcons.personBooth,
                              color: Colors.red,
                              size: 32,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                          child: Text(
                            'Elderly',
                            style: TextStyle(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF8B97A2),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                // Get.to(Homepage());
              },
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                child: Material(
                  color: Colors.transparent,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Align(
                            alignment: AlignmentDirectional(0.05, 0),
                            child: FaIcon(
                              FontAwesomeIcons.toolbox,
                              color: Colors.red,
                              size: 32,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                          child: Text(
                            'Technology',
                            style: TextStyle(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF8B97A2),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    bool _isSelected = true;
    bool selected = false;
    bool _customTileExpanded = false;

    return Scaffold(
        appBar: PreferredSize(preferredSize: Size.fromHeight(150), child: CustomAppBar(profile: widget.profile)),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              color: const Color(0xFFF4F4F4),
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
                      options: CarouselOptions(height: 190, enlargeCenterPage: true, autoPlay: false, aspectRatio: 3),
                    ),
                  ),

                  Container(
                    child: Column(
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
                                  assetPath: 'assets/policeman.png',
                                  label: 'Police Report',
                                  onTap: () {
                                    Navigator.of(context).pushNamed('/home');
                                  }),
                              CategorySquareTile(
                                  assetPath: 'assets/ngo.png',
                                  label: 'NGO Emergency',
                                  onTap: () {
                                    Navigator.of(context).pushNamed('/home');
                                  }),
                              CategorySquareTile(
                                  assetPath: 'assets/architect.png',
                                  label: 'Rebuild',
                                  onTap: () {
                                    Navigator.of(context).pushNamed('/home');
                                  }),
                              CategorySquareTile(
                                  assetPath: 'assets/feedback.png',
                                  label: 'Feedback',
                                  onTap: () {
                                    print('feedback');
                                    Navigator.of(context).pushNamed('/home');
                                  }),
                              CategorySquareTile(
                                  assetPath: 'assets/politician.png',
                                  label: 'Adun',
                                  onTap: () {
                                    Navigator.of(context).pushNamed('/home');
                                  }),
                              CategorySquareTile(
                                  assetPath: 'assets/man.png',
                                  label: 'profile',
                                  onTap: () {
                                    Navigator.of(context).pushNamed('/home');
                                  }),
                            ],
                          ),
                        ),
                        Divider(),
                      ],
                    ),
                    height: MediaQuery.of(context).size.height * 0.50,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(18), topRight: Radius.circular(18))),
                  ),

                  // getImageTile('https://cimages.milaap.org/milaap/image/upload/c_fill,g_faces,h_452,w_603/v1639160721/production/images/campaign/427988/WhatsApp_Image_2021-12-10_at_11.50.38_PM_yy8krg_1639160725.jpg'),
                  // getImageTile('https://cimages.milaap.org/milaap/image/upload/c_fill,g_faces,h_452,w_603/v1639992568/production/images/campaign/432649/WhatsApp_Image_2021-12-20_at_14.34.04_ki3c5i_1639992571.jpg'),
                  // getImageTile('https://cimages.milaap.org/milaap/image/upload/c_fill,g_faces,h_452,'
                  //     'w_603/v1637742107/production/images/campaign/419357/IMG_20210305_110858_fiij8t_1637742113.jpg'),
                ],
              ),
            ),
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 80,
            width: 80,
            child: ElevatedButton(
                onPressed: onTap,
                child: Image.asset(assetPath),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0), side: BorderSide(color: Colors.white))))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(label),
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
