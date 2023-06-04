import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/showList.dart';

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