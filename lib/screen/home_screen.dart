import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/screen/create_todo_screen.dart';
import 'package:todo_list/service/db/database_helper.dart';
import 'package:todo_list/widgets/listTile_widgets.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  static const routeName = "/HomeScreen";
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                Text(nowDay, style: Theme.of(context).textTheme.displayLarge),
                Text(nowDate, style: Theme.of(context).textTheme.displaySmall),
              ],
            ),
          ),
        ),
      ),
      body: FutureBuilder(
        future: DataBaseHelper().getListTodo(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data;
            return RefreshIndicator(
              onRefresh: () {
                setState(() {});
                return DataBaseHelper().getListTodo();
              },
              child: ListView.builder(
                itemCount: data?.length,
                itemBuilder: (context, index) {
                  return ListTileWidgets(
                    id: data?[index].id ?? "",
                    judul: data?[index].judul ?? "",
                    subJudul: data?[index].todo ?? "",
                  );
                },
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(CreateTodoScreen.routeName);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
