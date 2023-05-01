import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ItemMenu extends StatelessWidget {
  final IconData icon;
  final String text;

  ItemMenu({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(width: 0.7, color: Colors.white38),
            top: BorderSide(width: 0.7, color: Colors.white38)),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.purple[800], elevation: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Row(children: [
            Icon(icon),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(text, style: TextStyle(fontSize: 12),),
            )
          ],),
          Icon(Icons.chevron_right, size: 16,)
        ],),
        onPressed: (){},
      ),
    );
  }
}
