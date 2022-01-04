import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    this.labelText,
    this.obscureText = false,
    this.hintText,
    this.controller,
    this.suffixIcon,
  }) : super(key: key);

  final String? labelText;
  final bool obscureText;
  final String? hintText;
  final TextEditingController? controller;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        labelText: labelText,
        labelStyle: const TextStyle(
          fontFamily: 'Lexend Deca',
          color: Colors.grey,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontFamily: 'Lexend Deca',
          color: Colors.grey,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFDBE2E7),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFDBE2E7),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        filled: true,
        fillColor: Colors.white.withOpacity(0.8),
        contentPadding: const EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
      ),
      style: const TextStyle(
        fontFamily: 'Lexend Deca',
        color: Color(0xFF2B343A),
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}

class CustomTextBox extends StatelessWidget {
  const CustomTextBox(
      {Key? key,
      required this.controller,
      required this.labelText,
      required this.hintText,
      this.keyboardType = TextInputType.text,
      this.onChanged,
      this.onTap,
      this.leftPad = 20,
      this.maxLines,
      this.enabled})
      : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final TextInputType keyboardType;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final double? leftPad;
  final int? maxLines;
  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20, 0, leftPad!, 16),
      child: TextFormField(
        maxLines: maxLines,
        onChanged: onChanged,
        onTap: onTap,
        keyboardType: keyboardType,
        enabled: enabled,
        controller: controller,
        obscureText: false,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(
            fontFamily: 'Lexend Deca',
            color: Color(0xFFEF4C43),
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            fontFamily: 'Lexend Deca',
            color: Color(0xFF95A1AC),
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFFDBE2E7),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFFDBE2E7),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
        ),
        style: const TextStyle(
          fontFamily: 'Lexend Deca',
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.items,
    this.onChanged,
    this.onTap,
    this.leftPad = 20,
    required this.selectedValue,
  }) : super(key: key);

  final String labelText;
  final String hintText;
  final Object? selectedValue;

  final void Function(Object?)? onChanged;
  final void Function()? onTap;
  final double? leftPad;

  final List<DropdownMenuItem<Object>>? items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20, 0, leftPad!, 16),
      child: DropdownButtonFormField(
        isExpanded: false,
        value: selectedValue,
        onChanged: onChanged,
        onTap: onTap,
        decoration: InputDecoration(
          constraints: BoxConstraints.expand(height: 65),
          labelText: labelText,
          labelStyle: TextStyle(
            fontFamily: 'Lexend Deca',
            color: Color(0xFFEF4C43),
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            fontFamily: 'Lexend Deca',
            color: Color(0xFF95A1AC),
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFDBE2E7),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFDBE2E7),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
        ),
        style: TextStyle(
          fontFamily: 'Lexend Deca',
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
        items: items,
      ),
    );
  }
}

class RadioButton extends StatefulWidget {
  RadioButton({required this.function});
  final VoidCallback function;
  @override
  State<RadioButton> createState() => _RadioButtonState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _RadioButtonState extends State<RadioButton> {
  @override
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('In Campus'),
          leading: Radio<bool>(
              value: true,
              groupValue: true,
              onChanged: (bool? vale) {
                widget.function();
              }),
        ),
        ListTile(
          title: const Text('Out Campus'),
          leading: Radio<bool>(
              value: false,
              groupValue: false,
              onChanged: (bool? vale) {
                widget.function();
              }),
        ),
      ],
    );
  }
}
