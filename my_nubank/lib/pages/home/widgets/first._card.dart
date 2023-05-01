import 'package:flutter/material.dart';

class FirstCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Column(
        children: [
          Expanded(child: Container()),
          Expanded(child: Container(
            color: Colors.grey,
          )),
        ],
      ),
    );
  }
}
