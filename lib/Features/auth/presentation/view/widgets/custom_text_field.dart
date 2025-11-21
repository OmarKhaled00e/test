import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText, this.validator,
  });

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xffFFFFFF),
        hintText: hintText,
        hintStyle: TextStyle(color: Color(0xffACA7A7)),
        border: OutlineInputBorder(),

        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff64C3BF), width: 2),
          borderRadius: BorderRadius.circular(5),
        ),

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff64C3BF), width: 2),
        ),
      ),
    );
  }
}
