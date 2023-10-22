import 'package:flutter/material.dart';

class TextFormFieldWidgets extends StatelessWidget {
  int maxlines;
  TextFormFieldWidgets({super.key, required this.maxlines});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxlines,
      decoration: const InputDecoration(
        filled: true,
        fillColor: Colors.amber,
        focusedBorder: OutlineInputBorder(
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
