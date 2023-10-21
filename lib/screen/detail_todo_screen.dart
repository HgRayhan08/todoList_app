import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailTodoScreen extends StatelessWidget {
  String judul;
  DetailTodoScreen({required this.judul, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(judul),
      ),
    );
  }
}
