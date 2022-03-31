import 'package:bangkit/constants/colors.dart';
import 'package:bangkit/constants/controller_constants.dart';
import 'package:bangkit/models/profile.dart';
import 'package:bangkit/widgets/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController secondaryphoneController = TextEditingController();
  final TextEditingController icnumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController primaryAdresssLine1 = TextEditingController();
  final TextEditingController primaryAdressline2 = TextEditingController();
  final TextEditingController secondaryAddressLine1 = TextEditingController();
  final TextEditingController secondaryAdressLIne2 = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController descriptionController2 = TextEditingController();
  final TextEditingController roofcolorController = TextEditingController();
  final TextEditingController doorcolorController = TextEditingController();
  final TextEditingController landmarkController = TextEditingController();
  final TextEditingController primaryaddrsseController = TextEditingController();
  final TextEditingController secondaryaddressController = TextEditingController();
  final TextEditingController roofcolor2Controller = TextEditingController();
  final TextEditingController doorcolor2Controller = TextEditingController();
  final TextEditingController landmark2Controller = TextEditingController();

  bool _secondaryExpansion = false;

  @override
  void initState() {
    super.initState();
    colors = ["Black", "White", "Red", "Yellow", "Blue", "Orange", "Brown", "Grey", "Purple", "Pink"];
    states = postalCodes.keys.toList();
    doorColorPrimary = colors.first;
    doorColorSecondary = colors.first;
    roofColorPrimary = colors.first;
    roofColorSecondary = colors.first;
    primaryState = states.first;
    secondaryState = states.first;
    doorColorSecondary = colors.first;
    roofColorPrimary = colors.first;
    roofColorSecondary = colors.first;
    emailController.text = authController.auth.currentUser!.email ?? '';

    primaryCodeList = postalCodes[primaryState]!.map((e) => e["postCode"].toString()).toList();
    secondaryCodeList = postalCodes[secondaryState]!.map((e) => e["postCode"].toString()).toList();
    primaryPostCode = primaryCodeList.first;
    secondaryPostCode = secondaryCodeList.first;
    // print("$primaryPostCode, $secondaryPostCode");
  }

  setPrimaryPostalCodes() {
    primaryCodeList = postalCodes[primaryState]!.map((e) => e["postCode"].toString()).toList();
    primaryPostCode = primaryCodeList.first;
  }

  setSecondaryPostalCodes() {
    secondaryCodeList = postalCodes[secondaryState]!.map((e) => e["postCode"].toString()).toList();
    secondaryPostCode = secondaryCodeList.first;
  }

  get colorItems => ColorPalette.coloritems;
  getsubmitData() {
    var primaryAddress = Address(
        line1: primaryAdresssLine1.text,
        line2: primaryAdressline2.text,
        description: descriptionController.text,
        roofColor: roofColorPrimary,
        doorColor: doorColorPrimary,
        state: primaryState,
        pincode: primaryPostCode);
    var secondaryAddress = Address(
        line1: secondaryAddressLine1.text,
        line2: secondaryAdressLIne2.text,
        description: descriptionController2.text,
        roofColor: roofColorSecondary,
        doorColor: doorColorSecondary,
        state: secondaryState,
        pincode: primaryPostCode);
    return Profile(
        name: nameController.text,
        phone: phoneController.text,
        secondaryPhone: secondaryphoneController.text,
        email: emailController.text,
        primaryAddress: primaryAddress,
        // secondaryAddress: secondaryAddress,
        icNumber: icnumberController.text,
        documents: [],
        services: []);
  }

  late List<String> colors;
  late List<String> states;
  List<String> primaryCodeList = [];
  List<String> secondaryCodeList = [];

  late String doorColorPrimary;
  late String primaryState;
  late String secondaryState;
  late String doorColorSecondary;
  late String roofColorPrimary;
  late String roofColorSecondary;
  late String primaryPostCode;
  late String secondaryPostCode;
  bool _customTileExpanded = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? requiredValidator(String? text) {
    text = text ?? '';
    if (text.isEmpty) {
      return "This is a required field";
    }
    return null;
  }

  String? requiredEmail(String? text) {
    text = text ?? '';
    if (text.isEmpty) {
      return "This is a required field";
    } else if (text.isEmail) {
      return "Please enter a valid email address";
    }
    return null;
  }

  String? requiredValidatorSnackbar(String? value) {
    value = value ?? '';
    if (value.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please fill-out all fields in address")));
      return "This is  a required field";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(child: const Icon(Icons.logout), onPressed: authController.auth.signOut),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            authController.auth.signOut();
          },
          icon: const Icon(Icons.arrow_back_rounded),
          color: Colors.black,
        ),
        title: const Text(
          'Registration',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 16, bottom: 16),
                child: Align(
                  child: Text('Personal details'),
                  alignment: Alignment.centerLeft,
                ),
              ),
              CustomTextFormfieldRed(
                controller: nameController,
                hintText: 'Name',
                labelText: 'Enter your name',
                icon: const Icon(Icons.person),
                keyboardType: TextInputType.name,
                validator: requiredValidator,
              ),
              CustomTextFormfieldRed(
                controller: phoneController,
                hintText: '+60 12-345 6789',
                labelText: 'Enter your Phone Number',
                icon: const Icon(Icons.phone),
                keyboardType: TextInputType.phone,
                validator: requiredValidator,
              ),
              CustomTextFormfieldRed(
                controller: secondaryphoneController,
                hintText: '+60 12-345 6789',
                labelText: 'Enter Secondary Phone Number',
                icon: const Icon(Icons.phone),
                keyboardType: TextInputType.phone,
                validator: requiredValidator,
              ),
              CustomTextFormfieldRed(
                controller: icnumberController,
                hintText: 'Ex. F12345678I',
                labelText: 'Enter your Ic Number/Passport Number',
                icon: const Icon(FontAwesomeIcons.passport),
                validator: requiredValidator,
              ),
              CustomTextFormfieldRed(
                controller: emailController,
                hintText: 'name@email.com',
                labelText: 'Enter your Email',
                icon: const Icon(Icons.email),
                enabled: false,
                keyboardType: TextInputType.emailAddress,
              ),
              ExpansionTile(
                leading: const Icon(Icons.home),
                title: const Text('House address'),
                initiallyExpanded: true,
                trailing: Icon(
                  _customTileExpanded ? Icons.arrow_drop_down_circle : Icons.arrow_drop_down,
                ),
                children: <Widget>[
                  const Divider(),
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Align(
                      child: Text('House Address'),
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                  CustomTextFormfieldRed(
                    controller: primaryAdresssLine1,
                    hintText: '123 Street',
                    labelText: 'Address line 1',
                    icon: const Icon(Icons.home),
                    keyboardType: TextInputType.streetAddress,
                    validator: requiredValidatorSnackbar,
                  ),
                  CustomTextFormfieldRed(
                    controller: primaryAdressline2,
                    hintText: '123 Street',
                    labelText: 'Address line 2',
                    icon: const Icon(Icons.home),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: CustomDropDownButtonformField(
                      labelText: 'Choose State',
                      Icon: const Icon(FontAwesomeIcons.hotel),
                      value: primaryState,
                      onChanged: (String? newValue) {
                        setState(() {
                          primaryState = newValue!;
                          setPrimaryPostalCodes();
                        });
                      },
                      item: states.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: CustomDropDownButtonformField(
                      labelText: 'Choose PostCode',
                      Icon: const Icon(FontAwesomeIcons.hotel),
                      value: primaryPostCode,
                      onChanged: (String? newValue) {
                        setState(() {
                          primaryPostCode = newValue!;
                        });
                      },
                      item: primaryCodeList.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  CustomTextFormfieldRed(
                    maxLines: 4,
                    controller: descriptionController,
                    hintText: 'Type Your Text Here',
                    labelText: 'Description',
                    icon: const Icon(Icons.list),
                    validator: requiredValidatorSnackbar,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: CustomDropDownButtonformField(
                      labelText: 'Door Colour For Emergency Assistance',
                      Icon: const Icon(Icons.door_back_door),
                      value: doorColorPrimary,
                      onChanged: (String? newValue) {
                        setState(() {
                          doorColorPrimary = newValue!;
                        });
                      },
                      item: colorItems,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: CustomDropDownButtonformField(
                      labelText: 'Roof Color',
                      Icon: const Icon(Icons.roofing),
                      value: roofColorPrimary,
                      onChanged: (String? newValue) {
                        setState(() {
                          roofColorPrimary = newValue!;
                        });
                      },
                      item: colorItems,
                    ),
                  ),
                ],
                onExpansionChanged: (bool expanded) {
                  setState(() => _customTileExpanded = expanded);
                },
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: ElevatedButton(
                    onPressed: () {
                      if (kDebugMode) {
                        print("Hello");
                      }
                      if (_formKey.currentState?.validate() ?? false) {
                        _formKey.currentState?.save();
                        Profile submitProfile = getsubmitData();
                        showFutureDialog(context: context, future: submitProfile.addUser(authController.auth.currentUser!.uid));
                      }
                    },
                    child: const Text(
                      'Register',
                      style: TextStyle(
                        fontFamily: 'Lexend Deca',
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      // primary: Colors.redAccent,
                      shadowColor: const Color(0xFF757575),
                      side: const BorderSide(
                        width: 1,
                        color: Colors.transparent,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomDropDownButtonformField extends StatelessWidget {
  const CustomDropDownButtonformField({
    Key? key,
    this.Icon,
    this.Icon2,
    this.labelText,
    this.hintText,
    this.item,
    this.value,
    this.onChanged,
  }) : super(key: key);

  final Widget? Icon;
  final Widget? Icon2;
  final String? labelText;
  final String? hintText;
  final List<DropdownMenuItem<String>>? item;
  final String? value;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: DropdownButtonFormField<String>(
        value: value,
        onChanged: onChanged,
        items: item,
        decoration: InputDecoration(
          suffixIcon: Icon2,
          prefixIcon: Icon,
          labelText: labelText,
          labelStyle: const TextStyle(
            fontFamily: 'Lexend Deca',
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            fontFamily: 'Lexend Deca',
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
        ),
      ),
    );
  }
}

class CustomTextFormfieldRed extends StatelessWidget {
  const CustomTextFormfieldRed({
    Key? key,
    required this.controller,
    this.icon,
    this.icon2,
    this.labelText,
    this.hintText,
    this.maxLines,
    this.enabled,
    this.keyboardType,
    this.validator,
  }) : super(key: key);
  final TextEditingController controller;

  final Widget? icon;
  final Widget? icon2;
  final String? labelText;
  final String? hintText;
  final int? maxLines;
  final bool? enabled;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 60),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16, 10, 16, 10),
        child: TextFormField(
          validator: validator,
          expands: false,
          keyboardType: keyboardType,
          enabled: enabled,
          maxLines: maxLines,
          controller: controller,
          decoration: InputDecoration(
            suffixIcon: icon2,
            prefixIcon: icon,
            labelText: labelText,
            labelStyle: const TextStyle(
              fontFamily: 'Lexend Deca',
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            hintText: hintText,
            hintStyle: const TextStyle(
              fontFamily: 'Lexend Deca',
              color: Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.blue,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
          ),
          style: const TextStyle(
            fontFamily: 'Lexend Deca',
            color: Color(0xFF2B343A),
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
