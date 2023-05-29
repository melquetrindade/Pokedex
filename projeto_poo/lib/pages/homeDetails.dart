import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/showList.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AppBarDetails extends StatelessWidget {
  final DetailsArg pokemon;

  AppBarDetails({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: AppBar(
        elevation: 0,
        backgroundColor: pokemon.baseColor,
        title: Text(pokemon.nome),
      ),
    );
  }
}

class HomeDetails extends HookWidget {
  final DetailsArg arguments;
  HomeDetails({required this.arguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AppBarDetails(pokemon: DetailsArg(
            nome: arguments.nome, 
            img: arguments.img, 
            type: arguments.type, 
            id: arguments.id, 
            num: arguments.num
            )),
            Positioned(
              top: 82,
              left: 0,
              right: 0,
              height: 200,
              child: Container(
                color: arguments.baseColor,
                child: Column(children: [
            
                ],),
              ),
            )
        ],
      ),
    );
  }
}
