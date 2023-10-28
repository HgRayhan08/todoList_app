import 'package:flutter/material.dart';

class DialogWidgets extends StatelessWidget {
  String textFirst;
  Function() onpresedFirst;
  Function() onpresedsecond;
  String textSecond;
  DialogWidgets(
      {super.key,
      required this.textFirst,
      required this.onpresedFirst,
      required this.textSecond,
      required this.onpresedsecond});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Apakah yakin dihapus"),
      actions: [
        TextButton(
          onPressed: () {
            onpresedFirst;
          },
          child: Text(textFirst),
        ),
        TextButton(
          onPressed: () {
            onpresedsecond;
          },
          child: Text(textSecond),
        )
      ],
    );
  }
}
