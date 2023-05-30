import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomePrinc extends HookWidget {
  final Function(String) onTap;

  HomePrinc({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => onTap('/poke'),
        child: Container(
          child: Center(
            child: Text(
              'Testando',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
