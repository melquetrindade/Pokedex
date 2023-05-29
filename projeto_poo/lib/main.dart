import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/pages/pokedexRoute.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarBrightness: Brightness.dark));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pokedex",
      theme: ThemeData(primarySwatch: Colors.grey, brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      home: pokedexRoute()
    );
  }
}
