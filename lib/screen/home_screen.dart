import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/screen/create_todo_screen.dart';
import 'package:todo_list/widgets/listTile_widgets.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  DateTime dayNow = DateTime.now();
  // memanggil hari
  String getDay(DateTime now) {
    final DateFormat format = DateFormat("EEEE");
    final String formatday = format.format(now);
    return formatday;
  }

  // Mengambil tanggal
  String getdate(DateTime now) {
    final DateFormat format = DateFormat("M/d/y");
    final String formatDate = format.format(now);
    return formatDate;
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    String nowDay = getDay(dayNow);
    String nowDate = getdate(dayNow);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: mediaQueryWidth * 0.1,
                vertical: mediaQueryHeight * 0.02,
              ),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nowDay,
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    nowDate,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            )),
      ),
      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) {
          return ListTileWidgets(
            judul: "Judul ${index + 1}",
            subJudul: "tanggal",
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const CreateTodoScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
