import 'package:flutter/material.dart';

class MenuApp extends StatelessWidget {
  final double top;
  final bool showMenu;

  MenuApp({required this.top, required this.showMenu});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      right: 0,
      left: 0,
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 200),
        opacity: showMenu ? 1 : 0,
        child: Container(
          color: Colors.red,
          height: MediaQuery.of(context).size.height * 0.56,
          child: Column(
            children: [
              Image.asset("assets/imgs/qrCode2.png",
              height: 80,
              color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
