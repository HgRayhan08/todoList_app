import 'package:flutter/material.dart';

class CreateTodoScreen extends StatelessWidget {
  static const routeName = "/CreateTodoScreen";
  const CreateTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("data"),
      ),
    );
  }
}
