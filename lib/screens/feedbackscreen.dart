import 'package:bangkit/constants/controller_constants.dart';
import 'package:bangkit/constants/themeconstants.dart';
import 'package:bangkit/controllers/auth_controller.dart';
import 'package:bangkit/models/feedback.dart';
import 'package:bangkit/profile/profileregistration.dart';
import 'package:bangkit/services/auth.dart';
import 'package:bangkit/widgets/widgets.dart';
import 'package:flutter/material.dart';



class FeedBack extends StatefulWidget {
  const FeedBack({Key? key}) : super(key: key);

  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {


  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Image.asset('assets/bina.png', height: 150),
        centerTitle: true,
      ),

      body: Column(

        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              children: [
                Text('Feedback',style: TextStyle(
                  // shadows: [Shadow(color: Colors.black, offset: Offset(0, -5))],
                  color: Colors.black,
                  fontSize: 20,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.blue,
                  decorationThickness: 4,
                ),),

              ],
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextFormfieldRed(
                  labelText: 'Title',
                  controller: titleController,
                  validator: (value) {
                    value = value ?? '';
                    if (value.isEmpty) {
                      return "This is a required field";
                    }
                  },
                ),


                CustomTextFormfieldRed(
                  labelText: 'description',
                  controller: descriptionController,
                  validator: (value) {
                    value = value ?? '';
                    if (value.isEmpty) {
                      return "This is a required field";
                    }
                  },
                ),
              ],
            ),
          ),


          ElevatedButton(onPressed: (){

               // widget.feedBack!.uid=authController.auth.currentUser!.uid;
               // widget.feedBack!.title = titleController.text.toString();
               // widget.feedBack!.description = descriptionController.text.toString();
            var feedback = MyFeedback(uid: authController.auth.currentUser!.uid, title: titleController.text.toString(), description:
            descriptionController.text.toString(), raiseddDate:
            DateTime.now(),
                starRatings: 5);

            feedback.addFeedback().then((value) {
             showDialog(context: context, builder: (context) {
               return AlertDialog(title: Text("Added Successfully"),);
             });
            }).catchError((error){
              return AlertDialog(title: Text(error.toString()),);
            });





          }, child: Text('Submit'))













        ],
      ),

    );
  }
}
