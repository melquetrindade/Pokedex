import 'package:flutter/material.dart';

class MyDotsApp extends StatelessWidget {
  final int curretIndex;

  MyDotsApp({required this.curretIndex});

  Color getColor(int index) {
    return index == curretIndex ? Colors.white : Colors.white38;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            width: 7,
            height: 7,
            decoration: BoxDecoration(
              color: getColor(0),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            width: 7,
            height: 7,
            decoration: BoxDecoration(
              color: getColor(1),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            width: 7,
            height: 7,
            decoration: BoxDecoration(
              color: getColor(2),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}
