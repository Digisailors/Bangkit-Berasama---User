import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    this.labelText,
    this.obscureText = false,
    this.hintText,
    this.controller,
  }) : super(key: key);

  final String? labelText;
  final bool obscureText;
  final String? hintText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
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
