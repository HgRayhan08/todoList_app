// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/provider/database_provider.dart';
import 'package:todo_list/screen/detail_todo_screen.dart';
import 'package:todo_list/widgets/dialog_widgets.dart';

class ListTileWidgets extends StatelessWidget {
  final String id;
  final String judul;
  final String subJudul;
  const ListTileWidgets({
    required this.id,
    required this.judul,
    required this.subJudul,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    return Consumer<DatabaseProvider>(
      builder: (context, provider, child) {
        return Slidable(
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (slidebar) {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) => DialogWidgets(
                      textFirst: "Hapus",
                      onpresedFirst: () {
                        provider.removeTodo(id);
                        Navigator.of(context).pop();
                      },
                      textSecond: "cancel",
                      onpresedsecond: () {
                        Navigator.of(context).pop();
                        // print("object");
                      },
                    ),
                  );
                },
                icon: Icons.abc,
                autoClose: true,
                backgroundColor: Colors.amber,
                foregroundColor: Colors.green,
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              )
            ],
          ),
          child: ListTile(
            contentPadding: EdgeInsets.only(left: mediaQueryWidth * 0.1),
            title: Text(
              judul,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            subtitle: Text(
              subJudul,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            onTap: () {
              Navigator.of(context).pushNamed(
                DetailTodoScreen.routeName,
                arguments: judul,
              );
            },
          ),
        );
      },
    );
  }
}
