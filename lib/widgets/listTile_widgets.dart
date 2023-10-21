// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:todo_list/screen/detail_todo_screen.dart';

// ignore: must_be_immutable
class ListTileWidgets extends StatelessWidget {
  String judul;
  String subJudul;
  ListTileWidgets({
    required this.judul,
    required this.subJudul,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    return ListTile(
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
    );
  }
}
