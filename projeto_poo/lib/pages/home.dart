import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/showList.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
              onPressed: () {}, 
              icon: Icon(Icons.search)),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
              top: -60,
              right: 0,
              child: Opacity(
                opacity: 0.1,
                child: Image.network(
                  "https://cdn.onlinewebfonts.com/svg/img_445231.png",
                  height: 240,
                  width: 240,
                ),
              )),
          ShowList(
            onItemTap: onItemTap,
          ),
        ],
      ),
    );
  }
}
