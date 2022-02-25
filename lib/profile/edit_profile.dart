import 'package:bangkit/constants/colors.dart';
import 'package:bangkit/constants/controller_constants.dart';
import 'package:bangkit/constants/themeconstants.dart';
import 'package:bangkit/models/profile.dart';
import 'package:bangkit/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/string_extensions.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    super.initState();
    if (profileController.profile != null) {
      nameController.text = profileController.profile!.name;
      phoneController.text = profileController.profile!.phone;
      secondaryphoneController.text = profileController.profile!.secondaryPhone;
      icnumberController.text = profileController.profile!.icNumber;
      emailController.text = profileController.profile!.email;
      primaryAdressController = profileController.profile!.primaryAddress.controller;
      secondaryAdressController = profileController.profile!.secondaryAddress.controller;
      _primaryState = profileController.profile!.primaryAddress.state;
      _secondaryState = profileController.profile!.secondaryAddress.state;
      setPrimaryPostalCodes();
      setSecondaryPostalCodes();
      _primaryPostcode = profileController.profile!.primaryAddress.pincode;
      _secondaryPostcode = profileController.profile!.secondaryAddress.pincode;
      _primaryRoofColor = profileController.profile!.primaryAddress.roofColor;
      _secondaryRoofColor = profileController.profile!.secondaryAddress.roofColor;
      _primaryDoorColor = profileController.profile!.primaryAddress.doorColor;
      _secondaryDoorColor = profileController.profile!.secondaryAddress.doorColor;
    } else {
      _primaryState = states.first;
      _secondaryState = states.first;
      setPrimaryPostalCodes();
      setSecondaryPostalCodes();
      _primaryRoofColor = colors.first;
      _secondaryRoofColor = colors.first;
      _primaryDoorColor = colors.first;
      _secondaryDoorColor = colors.first;
    }
  }

  setPrimaryPostalCodes() {
    primaryCodeList = postalCodes[_primaryState]!.map((e) => e["postCode"].toString()).toList();
    _primaryPostcode = primaryCodeList.first;
  }

  setSecondaryPostalCodes() {
    secondaryCodeList = postalCodes[_secondaryState]!.map((e) => e["postCode"].toString()).toList();
    _secondaryPostcode = secondaryCodeList.first;
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController secondaryphoneController = TextEditingController();
  final TextEditingController icnumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  AdressEditingController primaryAdressController = Address.plainController;
  AdressEditingController secondaryAdressController = Address.plainController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final states = postalCodes.keys.toList();
  late List<String> primaryCodeList;
  late List<String> secondaryCodeList;
  final colors = [
    "red",
    "pink",
    "purple",
    "deepPurple",
    "indigo",
    "blue",
    "lightBlue",
    "",
    "",
    "green",
    "lightGreen",
    "lime",
    "yellow",
    "amber",
    "orange",
    "deepOrange",
    "brown",
    "blueGrey",
    "white",
    "black",
  ];

  get _stateItems => states.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList();
  get _primaryCodeItems => primaryCodeList.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList();
  get _secondaryCodeItems => secondaryCodeList.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList();

  get _colorItems => ColorPalette.coloritems;
  // .map((e) => DropdownMenuItem(
  //     value: e,
  //     child: e == ""
  //         ? Container()
  //         : Row(
  //             children: [
  //               Text(e.split(RegExp('(?<=[a-z])(?=[A-Z])|(?<=[A-Z])(?=[A-Z][a-z])')).map((e) => e.capitalize).join(" ")),
  //               const SizedBox(width: 15),
  //               e == "white"
  //                   ? Container(height: 10, width: 10, color: Colors.white)
  //                   : e == "black"
  //                       ? Container(height: 10, width: 10, color: Colors.black)
  //                       : Container(height: 10, width: 10, color: Colors.primaries.elementAt(colors.indexWhere((element) => element == e))),
  //             ],
  //           )))
  // .where((element) => element.value != "")
  // .toList();

  late String _primaryState;
  late String _primaryPostcode;
  late String _secondaryState;
  late String _secondaryPostcode;
  late String _primaryRoofColor;
  late String _primaryDoorColor;
  late String _secondaryRoofColor;
  late String _secondaryDoorColor;
  String? _requiredValidator(value) {
    value = value ?? '';
    var s = value.isEmpty ? "Name is required field" : null;
    return s;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState?.validate() ?? false) {
            var primaryAddress = primaryAdressController.address;
            var secondaryAddress = secondaryAdressController.address;
            if (authController.auth.currentUser != null) {
              var future = Profile(
                      name: nameController.text,
                      uid: authController.auth.currentUser!.uid,
                      phone: phoneController.text,
                      secondaryPhone: secondaryphoneController.text,
                      email: emailController.text,
                      primaryAddress: primaryAddress,
                      secondaryAddress: secondaryAddress,
                      icNumber: icnumberController.text,
                      isVolunteer: profileController.profile!.isVolunteer,
                      isApproved: profileController.profile!.isApproved,
                      about: profileController.profile!.about,
                      documents: profileController.profile?.documents ?? [],
                      services: profileController.profile?.services ?? [])
                  .updateUser();
              //     .then((response) {
              //   if (response.code == "Success") {
              //     ScaffoldMessenger.of(context).showSnackBar(
              //       SnackBar(
              //         content: Text(response.message),
              //         action: SnackBarAction(
              //             label: "Okay",
              //             onPressed: () {
              //               G
              //             }),
              //       ),
              //     );
              //   }
              // });

              showFutureDialog(
                  context: context,
                  future: future,
                  callback: () {
                    Get.offNamedUntil('/bottomRoute', (route) => false);
                    pageController.bottomIndex = 3;
                  });
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please check the fields")));
          }
        },
        child: const Text("Submit"),
      ),
      appBar: getAppBar(context),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("My Profile", style: getText(context).headline4),
              ),
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Name", style: getText(context).subtitle2),
                ),
                subtitle: CustomTextFormField(suffixIcon: const Icon(Icons.person), controller: nameController),
              ),
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("IC Number", style: getText(context).subtitle2),
                ),
                subtitle: CustomTextFormField(
                  suffixIcon: const Icon(FontAwesomeIcons.idCard),
                  controller: icnumberController,
                  validator: _requiredValidator,
                ),
              ),
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Phone", style: getText(context).subtitle2),
                ),
                subtitle: Table(
                  children: [
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8, right: 8),
                          child: CustomTextFormField(
                            suffixIcon: const Icon(Icons.phone_android),
                            labelText: "Primary",
                            controller: phoneController,
                            validator: _requiredValidator,
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8),
                          child: CustomTextFormField(
                            suffixIcon: const Icon(Icons.phone_android),
                            labelText: "Secondary",
                            controller: secondaryphoneController,
                            validator: _requiredValidator,
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Email",
                    style: getText(context).subtitle2,
                  ),
                ),
                subtitle: CustomTextFormField(
                  suffixIcon: const Icon(Icons.mail_outline),
                  controller: emailController,
                  validator: (text) {
                    if (emailController.text.isEmpty) {
                      return "Email ID is required";
                    } else if (!emailController.text.isEmail) {
                      return "Please enter a valid email";
                    }
                    return null;
                  },
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ExpansionTile(
                  collapsedBackgroundColor: Colors.white,
                  title: Text("Primary Address", style: getText(context).subtitle1),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextFormField(
                        controller: primaryAdressController.line1,
                        labelText: "Line1",
                        validator: _requiredValidator,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextFormField(controller: primaryAdressController.line2, labelText: "line2"),
                    ),
                    Table(
                      children: [
                        TableRow(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomDropDown(
                                labelText: "State",
                                hintText: '',
                                items: _stateItems,
                                selectedValue: _primaryState,
                                onChanged: (p0) {
                                  setState(() {
                                    _primaryState = p0 as String? ?? _primaryState;
                                    setPrimaryPostalCodes();
                                    primaryAdressController.state.text = _primaryState;
                                    primaryAdressController.pincode.text = _primaryPostcode;
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomDropDown(
                                labelText: "Post-code",
                                hintText: '',
                                items: _primaryCodeItems,
                                selectedValue: _primaryPostcode,
                                onChanged: (p0) {
                                  setState(() {
                                    _primaryPostcode = p0 as String? ?? _primaryPostcode;
                                    primaryAdressController.pincode.text = _primaryPostcode;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomDropDown(
                                hintText: '',
                                items: ColorPalette.coloritems,
                                labelText: 'Roof Color',
                                selectedValue: _primaryRoofColor,
                                onChanged: (color) {
                                  setState(() {
                                    _primaryRoofColor = color as String? ?? _primaryRoofColor;
                                    primaryAdressController.roofColor.text = _primaryRoofColor;
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomDropDown(
                                hintText: '',
                                items: _colorItems,
                                labelText: 'Door Color',
                                selectedValue: _primaryDoorColor,
                                onChanged: (color) {
                                  setState(() {
                                    _primaryDoorColor = color as String? ?? _primaryDoorColor;
                                    primaryAdressController.doorColor.text = _primaryDoorColor;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextFormField(
                        controller: primaryAdressController.description,
                        labelText: "Description",
                        validator: _requiredValidator,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ExpansionTile(
                  collapsedBackgroundColor: Colors.white,
                  title: Text("Secondary Address", style: getText(context).subtitle1),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextFormField(
                        controller: secondaryAdressController.line1,
                        labelText: "Line1",
                        validator: _requiredValidator,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextFormField(controller: secondaryAdressController.line2, labelText: "line2"),
                    ),
                    Table(
                      children: [
                        TableRow(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomDropDown(
                                labelText: "State",
                                hintText: '',
                                items: _stateItems,
                                selectedValue: _secondaryState,
                                onChanged: (p0) {
                                  setState(() {
                                    _secondaryState = p0 as String? ?? _secondaryState;
                                    setSecondaryPostalCodes();
                                    secondaryAdressController.state.text = _secondaryState;
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomDropDown(
                                labelText: "Post-code",
                                hintText: '',
                                items: _secondaryCodeItems,
                                selectedValue: _secondaryPostcode,
                                onChanged: (p0) {
                                  setState(() {
                                    _secondaryPostcode = p0 as String? ?? _secondaryPostcode;
                                    secondaryAdressController.pincode.text = _secondaryPostcode;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomDropDown(
                                hintText: '',
                                items: _colorItems,
                                labelText: 'Roof Color',
                                selectedValue: _secondaryRoofColor,
                                onChanged: (color) {
                                  setState(() {
                                    _secondaryRoofColor = color as String? ?? _secondaryRoofColor;
                                    secondaryAdressController.roofColor.text = _secondaryRoofColor;
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomDropDown(
                                hintText: '',
                                items: _colorItems,
                                labelText: 'Door Color',
                                selectedValue: _secondaryDoorColor,
                                onChanged: (color) {
                                  setState(() {
                                    _secondaryDoorColor = color as String? ?? _secondaryDoorColor;
                                    secondaryAdressController.roofColor.text = _secondaryDoorColor;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextFormField(
                        controller: secondaryAdressController.description,
                        labelText: "Description",
                        validator: _requiredValidator,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

doNothing() {}
