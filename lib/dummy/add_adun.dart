import 'dart:ui';

import 'package:bangkit/models/adun.dart';
import 'package:bangkit/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AddAdun extends StatefulWidget {
  AddAdun({Key? key}) : super(key: key);

  @override
  State<AddAdun> createState() => _AddAdunState();
}

class _AddAdunState extends State<AddAdun> {
  final nameController = TextEditingController();

  final addressController = TextEditingController();

  final postCodeController = TextEditingController();

  final phoneNumberController = TextEditingController();

  final emailController = TextEditingController();

  final descriptioncontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              var adun = Adun(
                name: nameController.text,
                contactNumber: phoneNumberController.text,
                description: descriptioncontroller.text,
                emailAddress: emailController.text,
                officeAddress: addressController.text,
                postCode: postCodeController.text,
              );
              Adun.addAdun(adun);
            },
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "Add ADUN",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                CustomTextFormField(
                    labelText: 'name', controller: nameController),
                const SizedBox(height: 10),
                CustomTextFormField(
                    labelText: 'address', controller: addressController),
                const SizedBox(height: 10),
                CustomTextFormField(
                    labelText: 'phoneNumber',
                    controller: phoneNumberController),
                const SizedBox(height: 10),
                CustomTextFormField(
                    labelText: 'email', controller: emailController),
                const SizedBox(height: 10),
                CustomTextFormField(
                    labelText: 'description',
                    controller: descriptioncontroller),
                const SizedBox(height: 10),
                CustomTextFormField(
                    labelText: 'Post Code', controller: postCodeController),
                const SizedBox(height: 10),
              ],
            ),
          )),
    );
  }
}
