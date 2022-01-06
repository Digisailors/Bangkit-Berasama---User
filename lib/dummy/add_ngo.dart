import 'dart:ui';

import 'package:bangkit/models/ngo.dart';
import 'package:bangkit/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AddNgo extends StatefulWidget {
  AddNgo({Key? key}) : super(key: key);

  @override
  State<AddNgo> createState() => _AddNgoState();
}

class _AddNgoState extends State<AddNgo> {
  final nameController = TextEditingController();

  final addressController = TextEditingController();

  final postCodeController = TextEditingController();

  final phoneNumberController = TextEditingController();

  final emailController = TextEditingController();

  final descriptioncontroller = TextEditingController();

  final typeController = TextEditingController();

  final entityTypeController = TextEditingController();

  var entity;
  var type;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              var ngo = Ngo(
                  name: nameController.text,
                  address: addressController.text,
                  postCode: postCodeController.text,
                  phoneNumber: phoneNumberController.text,
                  email: emailController.text,
                  description: descriptioncontroller.text,
                  type: type ?? Type.medical,
                  entityType: entity,
                  serviceTypes: [ServiceType.assistance, ServiceType.cleaning, ServiceType.food]);
              Ngo.addNgo(ngo);
            },
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "Add NGO",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                CustomTextFormField(labelText: 'name', controller: nameController),
                const SizedBox(height: 10),
                CustomTextFormField(labelText: 'address', controller: addressController),
                const SizedBox(height: 10),
                CustomTextFormField(labelText: 'phoneNumber', controller: phoneNumberController),
                const SizedBox(height: 10),
                CustomTextFormField(labelText: 'email', controller: emailController),
                const SizedBox(height: 10),
                CustomTextFormField(labelText: 'description', controller: descriptioncontroller),
                const SizedBox(height: 10),
                DropdownButtonFormField<Type>(
                  value: type,
                  onChanged: (Type? value) {
                    setState(() {
                      type = value ?? type;
                    });
                  },
                  items: Type.values.map((e) => DropdownMenuItem(value: e, child: Text(e.toString()))).toList(),
                ),
                DropdownButtonFormField<EntityType>(
                  value: entity,
                  onChanged: (EntityType? type) {
                    setState(() {
                      entity = type ?? entity;
                    });
                  },
                  items: EntityType.values.map((e) => DropdownMenuItem(value: e, child: Text(e.toString()))).toList(),
                )
              ],
            ),
          )),
    );
  }
}
