import 'package:flutter/material.dart';

class MyPageView extends StatelessWidget {
  final ValueChanged<int> onChanged;

  MyPageView({required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      height: 280,
      child: PageView(
        onPageChanged: onChanged,
        children: [
          Container(
            width: 100,
            height: 80,
            color: Colors.blue,
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.green,
          )
        ],
      ),
    );
  }
}

class MyDotsApp extends StatelessWidget {
  final int curretIndex;

  MyDotsApp({required this.curretIndex});

  Color getColor(int index) {
    return index == curretIndex ? Colors.black : Color.fromARGB(255, 183, 183, 183);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        top: 400,
        child: Container(
          //color: Colors.red,
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 25, bottom: 12),
                child: Text(
                  "Status",
                  style: TextStyle(
                      color: getColor(0),
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, bottom: 12),
                child: Text(
                  "Evolução",
                  style: TextStyle(
                      color: getColor(1),
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
