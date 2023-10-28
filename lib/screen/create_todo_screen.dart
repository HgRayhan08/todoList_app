import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/model/todo_model.dart';
import 'package:todo_list/service/db/database_helper.dart';
import 'package:todo_list/widgets/card_day.dart';
import 'package:todo_list/widgets/textFormField_widgets.dart';
import 'package:uuid/uuid.dart';

// ignore: must_be_immutable
class CreateTodoScreen extends StatelessWidget {
  static const routeName = "/CreateTodoScreen";
  CreateTodoScreen({super.key});

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

  TextEditingController judulTodo = TextEditingController();
  TextEditingController deskripsi = TextEditingController();

  var uuid = Uuid();

  @override
  Widget build(BuildContext context) {
    String nowDay = getDay(dayNow);
    String nowDate = getdate(dayNow);
    final mediaQuery = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("data"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: mediaQuery * 0.07),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CardDay(
                  content: nowDay,
                  width: 0.4,
                  fontSize: 35,
                ),
                CardDay(
                  content: nowDate,
                  width: 0.3,
                  fontSize: 18,
                ),
              ],
            ),
          ),
          TextFormFieldWidgets(
            maxlines: 1,
            hintText: "judul",
            controller: judulTodo,
          ),
          const SizedBox(
            height: 30,
          ),
          TextFormFieldWidgets(
            maxlines: 10,
            hintText: "deskripsi",
            controller: deskripsi,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                if (judulTodo.text == "" || deskripsi.text == "") {
                  print("gagal");
                } else {
                  // print("berhasil");
                  DataBaseHelper().insertTodo(
                    TodoList(
                      id: uuid.v4(),
                      tanggal: nowDate,
                      judul: judulTodo.text,
                      todo: deskripsi.text,
                    ),
                  );
                }
              },
              child: Text(
                "Submit",
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
