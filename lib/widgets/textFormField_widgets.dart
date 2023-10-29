// ignore_for_file: file_names

import 'package:flutter/material.dart';

class TextFormFieldWidgets extends StatelessWidget {
  final int maxlines;
  final String hintText;
  final TextEditingController controller;
  const TextFormFieldWidgets(
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
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        focusColor: Colors.amber,
      ),
    );
  }
}
