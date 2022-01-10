import 'package:bangkit/aid%20&grants/aidstory.dart';
import 'package:bangkit/constants/themeconstants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AidAndGrants extends StatefulWidget {
  const AidAndGrants({Key? key}) : super(key: key);

  @override
  _AidAndGrantsState createState() => _AidAndGrantsState();
}

class _AidAndGrantsState extends State<AidAndGrants> {


  bool isUseful =false;




  @override


  Widget getImageTile(url,title,ngoname,state) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: GestureDetector(
        onTap: (){

        },
        child: Card(
          elevation: 5,
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
            GestureDetector(
              onTap: (){
                Get.to(()=>Story());
              },

              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.arrow_drop_down_circle),
                    title:  Text(ngoname),
                    subtitle: Text(
                      state,
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                  Image.network(url),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      title,
                      style: getText(context).bodyText1,
                    ),
                  ),
                ],
              ),

            ),

              ButtonBar(

                alignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor: MaterialStateProperty.all(Colors.white)
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
                        backgroundColor: MaterialStateProperty.all(Colors.white)
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


            ],
          ),
        ),
      ),
    );
  }



  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SizedBox( height: getHeight(context)*0.15,
            child: Image.asset('assets/bina.png')),
      ),




        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(),
              child: Container(
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.8)),
                child: Column(children: [



                  getImageTile('https://i.ibb.co/pQDTVF1/111.jpg','Almost everything we own is '
                      'gone : Malaysia flood victims rue damage to property, valuables.','Ngo1',
                      'kuala lampur'),
                  getImageTile('https://i.ibb.co/F8LcyML/222.jpg','Urgently needed 4x4 vehicles and boats to assist flood victims in shah alam.','Ngo1',
                      'kuala lampur'),
                  getImageTile('https://i.ibb.co/4dZFVYN/333.jpg','People Need Climate Adaption Fund','Ngo1',
                      'kuala lampur'),
                  getImageTile('https://i.ibb.co/jVk6PRh/444.jpg','Assistance up to RM20,000 needed for victims who lost their homes.','Ngo1',
                      'kuala lampur'),
                  getImageTile('https://i.ibb.co/pQDTVF1/111.jpg','Almost everything we own is '
                      'gone : Malaysia flood victims rue damage to property, valuables.','Ngo1',
                      'kuala lampur'),
                  getImageTile('https://i.ibb.co/F8LcyML/222.jpg','Urgently needed 4x4 vehicles and boats to assist flood victims in shah alam.','Ngo1',
                      'kuala lampur'),
                  getImageTile('https://i.ibb.co/4dZFVYN/333.jpg','People Need Climate Adaption Fund','Ngo1',
                      'kuala lampur'),
                  getImageTile('https://i.ibb.co/jVk6PRh/444.jpg','Assistance up to RM20,000 needed for victims who lost their homes.','Ngo1',
                      'kuala lampur'),


                ],),
              ),
            ),
          ),
        ));

  }
}
