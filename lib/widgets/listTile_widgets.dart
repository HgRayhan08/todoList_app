// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:todo_list/screen/detail_todo_screen.dart';
import 'package:todo_list/widgets/dialog_widgets.dart';

// ignore: must_be_immutable
class ListTileWidgets extends StatelessWidget {
  String id;
  String judul;
  String subJudul;
  ListTileWidgets({
    required this.id,
    required this.judul,
    required this.subJudul,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    return Dismissible(
      key: Key(id.toString()),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        showDialog<String>(
          useSafeArea: false,
          context: context,
          builder: (BuildContext context) => DialogWidgets(
            textFirst: "delete",
            onpresedFirst: () {},
            textSecond: "Cancel",
            onpresedsecond: () {},
          ),
        );
        // DataBaseHelper().removeTodo(id);
      },
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
  }
}
