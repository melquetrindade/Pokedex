import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/showList.dart';

class MyPageView extends StatelessWidget {
  final ValueChanged<int> onChanged;
  final int numPokemon;
  final DetailsArg pokemon;

  MyPageView({
    required this.onChanged,
    required this.numPokemon,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      height: 280,
      child: PageView(
        onPageChanged: onChanged,
        children: [
          ShowStatus(pokemon: pokemon),
          ShowEvolution(
            pokemon: pokemon,
            numPokemon: numPokemon,
          )
        ],
      ),
    );
  }
}

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
    if (nexEvolution2.length < 1) {
      return const Text(
        "Este Pokemon não tem evolução!",
        style: TextStyle(color: Colors.black),
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
    } else {
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



class ShowStatus extends StatelessWidget {
  final DetailsArg pokemon;
  ShowStatus({required this.pokemon});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 65, right: 65),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Container(
            //color: Colors.blue,
            //width: 50,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Altura",
                        style: TextStyle(color: Color.fromARGB(255, 151, 151, 151)),
                      ),
                      Text(
                        pokemon.altura,
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Peso",
                        style: TextStyle(color: Color.fromARGB(255, 151, 151, 151)),
                      ),
                      Text(
                        pokemon.peso,
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Spawn Chance",
                        style: TextStyle(color: Color.fromARGB(255, 151, 151, 151)),
                      ),
                      Text(
                        pokemon.spawnChance,
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Ovo",
                        style: TextStyle(color: Color.fromARGB(255, 151, 151, 151)),
                      ),
                      Text(
                        pokemon.ovo,
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Avg Spawns",
                        style: TextStyle(color: Color.fromARGB(255, 151, 151, 151)),
                      ),
                      Text(
                        pokemon.avgSpawns,
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Fraquezas",
                        style: TextStyle(color: Color.fromARGB(255, 151, 151, 151)),
                      ),
                      Column(
                        children: 
                          pokemon.weaknesses.map((e) => Text(e, style: TextStyle(color: Colors.black),)).toList()
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*String peso;
  String spawnChance;
  String ovo;
  String avgSpawns;
  List<String> weaknesses;
 */


class MyDotsApp extends StatelessWidget {
  final int curretIndex;

  MyDotsApp({required this.curretIndex});

  Color getColor(int index) {
    return index == curretIndex
        ? Colors.black
        : Color.fromARGB(255, 183, 183, 183);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        top: 400,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 25, bottom: 12),
                child: Text(
                  "Status",
                  style: TextStyle(
                      color: getColor(0),
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, bottom: 12),
                child: Text(
                  "Evoluções",
                  style: TextStyle(
                      color: getColor(1),
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
