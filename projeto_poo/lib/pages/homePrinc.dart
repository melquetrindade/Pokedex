import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/searchPoke.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomePrinc extends HookWidget {
  final Function(String) onTap;

  HomePrinc({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Pesquisar"),
        actions: [
          IconButton(
              onPressed: () {
              },
              icon: Icon(Icons.search_outlined))
        ],
      ),
      body: GestureDetector(
        onTap: () => onTap('/poke'),
        child: Container(
          child: Center(
            child: Text(
              'Entrar na Pokedex',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
