import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/pages/pokedexRoute.dart';


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
