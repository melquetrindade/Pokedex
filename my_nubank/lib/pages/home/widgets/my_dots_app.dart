import 'package:flutter/material.dart';

class MyDotsApp extends StatelessWidget {
  final int curretIndex;
  final double top;
  final bool showMenu;

  MyDotsApp({required this.curretIndex, required this.top, required this.showMenu});

  Color getColor(int index) {
    return index == curretIndex ? Colors.white : Colors.white38;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 200),
        opacity: showMenu ? 0 : 1,
        child: Row(
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
        ),
      ),
    );
  }
}
