import 'package:bangkit/models/ngo.dart';
import 'package:flutter/material.dart';
import '../profile/profileregistration.dart';
import 'dart:ui';

import 'package:get/get.dart';

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

  final stateController = TextEditingController();

  final phoneNumberController = TextEditingController();

  final contactPersonController = TextEditingController();

  final emailController = TextEditingController();

  final descriptioncontroller = TextEditingController();

  final typeController = TextEditingController();

  final entityTypeController = TextEditingController();

  final imageController = TextEditingController();

  EntityType? entity = EntityType.government;
  // var type;
  ServiceType? serviceType = ServiceType.assistance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    entity = EntityType.government;
    serviceType = ServiceType.assistance;
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              var ngo = Ngo(
                  name: nameController.text,
                  address: addressController.text,
                  image: imageController.text,
                  postCode: postCodeController.text,
                  state: stateController.text,
                  phoneNumber: phoneNumberController.text,
                  email: emailController.text,
                  contactPersonName: contactPersonController.text,
                  description: descriptioncontroller.text,
                  // type: type ?? Type.medical,
                  entityType: entity,
                  serviceType: serviceType);
              if (_formKey.currentState?.validate() ?? false) {
                _formKey.currentState?.save();
                Ngo.addNgo(ngo).then((value) => showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Successfully Saved"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("Okay"),
                          )
                        ],
                      );
                    }));
              }
            },
          ),
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "Add NGO",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  CustomTextFormfieldRed(
                    labelText: 'name',
                    controller: nameController,
                    validator: (value) {
                      value = value ?? '';
                      if (value.isEmpty) {
                        return "This is a required field";
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormfieldRed(
                    labelText: 'Contact Person Name',
                    controller: contactPersonController,
                    validator: (value) {
                      value = value ?? '';
                      if (value.isEmpty) {
                        return "This is a required field";
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormfieldRed(
                    labelText: 'address',
                    controller: addressController,
                    validator: (value) {
                      value = value ?? '';
                      if (value.isEmpty) {
                        return "This is a required field";
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormfieldRed(
                    labelText: 'image url',
                    controller: imageController,
                    validator: (value) {
                      value = value ?? '';
                      if (value.isEmpty) {
                        return "This is a required field";
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormfieldRed(
                    keyboardType: TextInputType.number,
                    labelText: 'phoneNumber',
                    controller: phoneNumberController,
                    validator: (value) {
                      value = value ?? '';
                      if (value.isEmpty) {
                        return "This is a required field";
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormfieldRed(
                    labelText: 'email',
                    controller: emailController,
                    validator: (value) {
                      value = value ?? '';
                      if (value.isEmpty) {
                        return "This is a required field";
                      }
                      if (!emailController.text.isEmail) {
                        return "Enter a valid email";
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormfieldRed(
                    labelText: 'Post Code',
                    controller: postCodeController,
                    validator: (value) {
                      value = value ?? '';
                      if (value.isEmpty) {
                        return "This is a required field";
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormfieldRed(
                    labelText: 'State',
                    controller: stateController,
                    validator: (value) {
                      value = value ?? '';
                      if (value.isEmpty) {
                        return "This is a required field";
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormfieldRed(
                    labelText: 'description',
                    controller: descriptioncontroller,
                    validator: (value) {
                      value = value ?? '';
                      if (value.isEmpty) {
                        return "This is a required field";
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButtonFormField(
                        // validator: (value) => value != null ? "Field is Required" : null,
                        value: entity,
                        onChanged: (EntityType? type) {
                          setState(() {
                            entity = type;
                          });
                        },
                        items: EntityType.values.map((e) => DropdownMenuItem(value: e, child: Text(e.toString()))).toList()),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButtonFormField<ServiceType>(
                      // validator: (value) => value != null ? "Field is Required" : null,
                      value: serviceType,
                      onChanged: (ServiceType? stype) {
                        setState(() {
                          serviceType = stype;
                        });
                      },
                      items: ServiceType.values.map((e) => DropdownMenuItem(value: e, child: Text(e.toString()))).toList(),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
