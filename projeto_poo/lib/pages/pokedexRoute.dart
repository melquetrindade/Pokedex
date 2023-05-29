import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/pages/homeDetails.dart';
import 'package:flutter_application_1/pages/showList.dart';

class pokedexRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (context) {
            return HomePage(onItemTap: (route, arguments) {
              Navigator.of(context).pushNamed(route, arguments: arguments);
            });
          });
        }
        if (settings.name == '/details') {
          return MaterialPageRoute(builder: (context) {
            return HomeDetails(arguments: (settings.arguments) as DetailsArg);
          });
        }
      },
    );
  }
}
