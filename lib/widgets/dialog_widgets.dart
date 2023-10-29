import 'package:flutter/material.dart';

class DialogWidgets extends StatelessWidget {
  final String textFirst;
  final Function() onpresedFirst;
  final Function() onpresedsecond;
  final String textSecond;
  const DialogWidgets({
    super.key,
    required this.textFirst,
    required this.onpresedFirst,
    required this.textSecond,
    required this.onpresedsecond,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Apakah yakin dihapus"),
      actions: [
        TextButton(
          onPressed: onpresedFirst,
          child: Text(textFirst),
        ),
        TextButton(
          onPressed: onpresedsecond,
          child: Text(textSecond),
        )
      ],
    );
  }
}
