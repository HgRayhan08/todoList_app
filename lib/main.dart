import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/provider/database_provider.dart';
import 'package:todo_list/screen/create_todo_screen.dart';
import 'package:todo_list/screen/detail_todo_screen.dart';
import 'package:todo_list/screen/home_screen.dart';
import 'package:todo_list/service/db/database_helper.dart';
import 'package:todo_list/style/style.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DatabaseProvider(
            dataBaseHelper: DataBaseHelper(),
          ),
        )
      ],
      child: const MyApp(),
    ),
  );
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
        HomeScreen.routeName: (context) => const HomeScreen(),
        DetailTodoScreen.routeName: (context) => const DetailTodoScreen(),
        CreateTodoScreen.routeName: (context) => CreateTodoScreen(),
      },
    );
  }
}
