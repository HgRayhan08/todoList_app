import 'package:flutter/material.dart';
import 'package:todo_list/screen/create_todo_screen.dart';
import 'package:todo_list/screen/detail_todo_screen.dart';
import 'package:todo_list/screen/home_screen.dart';
import 'package:todo_list/style/style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      theme: ThemeData(textTheme: myTextTheme),
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        DetailTodoScreen.routeName: (context) => const DetailTodoScreen(),
        CreateTodoScreen.routeName: (context) => CreateTodoScreen(),
      },
    );
  }
}
