import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFormFieldWidgets extends StatelessWidget {
  int maxlines;
  String hintText;
  TextEditingController controller;
  TextFormFieldWidgets(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.maxlines});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxlines,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.amber,
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              20,
            ),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        focusColor: Colors.amber,
      ),
    );
  }
}
