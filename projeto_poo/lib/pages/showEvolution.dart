import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/showList.dart';

class ShowEvolution extends StatelessWidget {

  final DetailsArg pokemon;
  final int numPokemon;
  List nexEvolution = [];
  List nexEvolution2 = [];

  List prevEvolution = [];
  List prevEvolution2 = [];
  ShowEvolution({required this.pokemon, required this.numPokemon});

  @override
  Widget build(BuildContext context) {

    // verifica se o pokemon tem nexEvolution e adiciona na lista
    for (var poke in pokemon.nexEvolution) {
      if ((poke['next_evolution'] != null) && poke['id'] == numPokemon) {
        nexEvolution.add(poke['next_evolution']);
      }
    }
    for (var poke in nexEvolution) {
      for (var e in poke) {
        nexEvolution2.add(e);
      }
    }
    
    // verifica se o pokemon tem prevEvolution e adiciona na lista
    for (var poke in pokemon.prevEvolution) {
      if ((poke['prev_evolution'] != null) && poke['id'] == numPokemon) {
        prevEvolution.add(poke['prev_evolution']);
      }
    }
    for (var poke in prevEvolution) {
      for (var e in poke) {
        prevEvolution2.add(e);
      }
    }

    // birfucação para verifica as quantidades de evoluções
    if ((nexEvolution2.length == 0) && (prevEvolution2.length == 0)) {
      return Center(
        child: const Text(
          "Este Pokemon não tem evolução!",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      );
    } else if ((nexEvolution2.length > 0) && (prevEvolution2.length > 0)) {
      return ListView(
        scrollDirection: Axis.vertical,
        children:  [
          Container(
            child: Column(
            children: prevEvolution2
                .map((e) => DetailsEvolution(numPoke: e['num']))
                .toList()),
          ),
          Container(
            child: Column(
            children: nexEvolution2
                .map((e) => DetailsEvolution(numPoke: e['num']))
                .toList()),
          ),
        ]
      );
    } else if(prevEvolution2.length > 0){
      return ListView(
        scrollDirection: Axis.vertical,
        children:  [
          Container(
            child: Column(
            children: prevEvolution2
                .map((e) => DetailsEvolution(numPoke: e['num']))
                .toList()),
          ),
        ]
      );
    }
    else {
      return ListView(
        children: nexEvolution2
            .map((e) => DetailsEvolution(numPoke: e['num']))
            .toList()
      );
    }
  }
}

class DetailsEvolution extends StatelessWidget {
  final String numPoke;
  DetailsEvolution({required this.numPoke});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Image.network(
        'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/$numPoke.png',
        width: 100,
        height: 100,
      ),
    );
  }
}