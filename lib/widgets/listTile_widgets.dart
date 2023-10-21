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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListTile(
        title: Text(judul),
        subtitle: Text(subJudul),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailTodoScreen(
              judul: judul,
            ),
          ));
        },
      ),
    );
  }
}
