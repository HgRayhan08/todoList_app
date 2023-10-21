import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailTodoScreen extends StatelessWidget {
  static const routeName = "/DetailTodoScreen";
  const DetailTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String judul = ModalRoute.of(context)!.settings.arguments.toString();

    return Scaffold(
      appBar: AppBar(
        title: Text(judul),
      ),
    );
  }
}
