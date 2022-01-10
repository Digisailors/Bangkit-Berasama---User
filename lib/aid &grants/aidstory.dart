import 'package:bangkit/constants/themeconstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Story extends StatefulWidget {
  const Story({Key? key}) : super(key: key);

  @override
  State<Story> createState() => _StoryState();
}

class _StoryState extends State<Story> {


  bool isUseful =false;


  Widget getImage(BuildContext context, String url, width, height) {
    return Padding(
      padding:EdgeInsets.all(10.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: Color(0xFFDBE2E7),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      url,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: Color(0x3A000000),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: Color(0x3A000000),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget listOfDetails(title,icon) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          ListTile(
            leading: Icon(icon,color: Color(0xFF00b3df),),
            title: Text(title,style: getText(context).subtitle2,),
          ),


        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {




    return // Generated code for this Column Widget...
        SafeArea(
          child: Scaffold(
            appBar:AppBar(
              iconTheme: IconThemeData(color: Colors.black),
              automaticallyImplyLeading: true,

              centerTitle: true,
              title: SizedBox( height: getHeight(context)*0.15,
                  child: Image.asset('assets/bina.png')),
            ),
      body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 20, 24, 0),
                      child: Text(
                        'Help Support Families of Frontline Forest'
                        'Staff Who Died of Covid',
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        maxLines: 3,
                        softWrap: true,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontFamily: 'Lexend Deca',
                          color: Color(0xFF090F13),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 4, 24, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                              child: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna '
                                'aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo '
                                'consequat.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi.\n'
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore '
                                'magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi.',
                                style: TextStyle(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF8B97A2),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                                softWrap: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Images&Videos',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Container(
                          height: getHeight(context) * 0.004,
                          width: getWidth(context) * 0.4,
                          color: const Color(0xFF22A8E0),
                        ),
                      ),
                    ),
                    const Divider(),
                    SizedBox(
                        height: getHeight(context) * 0.20,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              getImage(
                                context,
                                'https://i.ibb.co/F8LcyML/222.jpg'
                                'Urgently '
                                'needed 4x4 vehicles and boats to assist flood victims in shah alam.Ngo1 kuala lampur',
                                getHeight(context) * 0.10,
                                getHeight(context) * 0.10,
                              ),
                              getImage(
                                context,
                                'https://i.ibb.co/4dZFVYN/333.jpg'
                                'People Need Climate Adaption Fund'
                                'Ngo1'
                                'kuala lampur',
                                getHeight(context) * 0.10,
                                getHeight(context) * 0.10,
                              ),
                              getImage(
                                context,
                                'https://cdn-icons-png.flaticon.com/512/860/860831.png',
                                getHeight(context) * 0.10,
                                getHeight(context) * 0.10,
                              ),
                              getImage(
                                context,
                                'https://i.ibb.co/4dZFVYN/333.jpg'
                                    'People Need Climate Adaption Fund'
                                    'Ngo1'
                                    'kuala lampur',
                                getHeight(context) * 0.10,
                                getHeight(context) * 0.10,
                              ),
                            ],
                          ),
                        )),


                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Attachment',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Container(
                          height: getHeight(context) * 0.004,
                          width: getWidth(context) * 0.4,
                          color: const Color(0xFF22A8E0),
                        ),
                      ),
                    ),
                    const Divider(),

                    SizedBox(
                        height: getHeight(context) * 0.20,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              getImage(
                                context,
                                'https://cdn-icons-png.flaticon.com/512/3997/3997593.png',
                                getHeight(context) * 0.15,
                                getHeight(context) * 0.15,
                              ),

                            ],
                          ),
                        )),
                    Divider(),

                    SizedBox(
                      height: 20,
                    ),
                    listOfDetails(
                      '2, Jalan Medini Utara 4, 79250 Nusajaya, Johor, Malaysia',Icons.location_pin

                    ),
                    listOfDetails(
                        'Adam',Icons.person

                    ),
                    listOfDetails(
                        '+60 826505648',Icons.phone

                    ),
                    listOfDetails(
                        'new.info@gmail.com',Icons.mail

                    ),
                    ButtonBar(

                      alignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0),
                              backgroundColor: MaterialStateProperty.all(Color(0xFFF5F5F5))
                          ),

                          onPressed: () {
                            setState(() {

                              isUseful=true;
                            });
                            // Perform some action
                          },
                          child: SizedBox(
                            width: getWidth(context)*0.25,
                            child: Row(
                              children: [
                                Icon(isUseful==true?Icons.thumb_up:Icons.thumb_up_alt_outlined,color: isUseful==true?Colors.green: Color
                                  (0xFF22A8E0) ,),

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Useful',style: TextStyle(color: isUseful==true?Colors.green: Color
                                    (0xFF22A8E0))),
                                ),
                              ],
                            ),
                          ),
                        ),

                        ElevatedButton(
                          style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0),
                              backgroundColor: MaterialStateProperty.all(Color(0xFFF5F5F5))
                          ),

                          onPressed: () {
                            setState(() {
                              isUseful=false;


                            });
                            // Perform some action
                          },
                          child: SizedBox(
                            width: getWidth(context)*0.25,
                            child: Row(
                              children: [
                                Icon(isUseful==false?Icons.thumb_down:Icons.thumb_down_alt_outlined,color:
                                isUseful==false?Colors.green: Color
                                  (0xFF22A8E0) ,),

                                Padding(
                                  padding:  EdgeInsets.only(left: 8.0),
                                  child: Text('Not Useful',style: TextStyle(color:
                                  isUseful==false?Colors
                                      .green: Color
                                    (0xFF22A8E0))),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: getHeight(context)*0.20,)
                  ],
                ),
              ),
            ),
          ],
      ),
    ),
        );
  }
}
