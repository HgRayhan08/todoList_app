import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardDay extends StatelessWidget {
  double width;
  String content;
  double fontSize;

  CardDay(
      {required this.width,
      required this.fontSize,
      required this.content,
      super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(10),
      width: mediaQuery * width,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Text(
        content,
        style: Theme.of(context)
            .textTheme
            .displayMedium
            ?.copyWith(fontSize: fontSize.toDouble()),
      ),
    );
  }
}
