import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/homePrinc.dart';
import 'package:flutter_application_1/pages/searchPoke.dart';
import 'package:flutter_application_1/pages/showList.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomePage extends HookWidget {
  final Function(String, DetailsArg) onItemTap;

  HomePage({required this.onItemTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        //backgroundColor: Colors.grey,
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: const Text("Pokedex"),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: Search(onItemTap: onItemTap));
                },
                icon: Icon(Icons.search)),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ShowList(
            onItemTap: onItemTap,
          ),
        ],
      ),
    );
  }
}
