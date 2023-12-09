// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  String? Function(String?)? validator;
  MyTextfield(
      {
      // Key key,
      required this.validator,
      required this.controller,
      required this.hint});
  // : super(key: key);

  @override
  Widget build(BuildContext context) => TextFormField(
        validator: validator,
        controller: controller,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      );
}

class InputWidget extends StatelessWidget {
  String? Function(String?)? validator;
  final TextEditingController controller;
  final String hint;
  final String title;

  InputWidget(
      {
      // Key key,
      required this.validator,
      required this.title,
      required this.controller,
      required this.hint});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 5,
        ),
        Text(
          "$title : ",
          style: TextStyle(
            color: Colors.teal,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Expanded(
          child: MyTextfield(
            validator: validator,
            controller: controller,
            hint: "$hint",
          ),
        ),
        SizedBox(
          width: 5,
        )
      ],
    );
  }
}
