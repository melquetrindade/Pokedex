import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/showList.dart';

final dataService = DataService();

class MyPageView extends StatelessWidget {
  final ValueChanged<int> onChanged;
  final int numPokemon;
  final DetailsArg pokemon;

  MyPageView({required this.onChanged, required this.numPokemon, required this.pokemon});

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
          Container(
            width: 100,
            height: 100,
            color: Colors.green,
          )
        ],
      ),
    );
  }
}

class ShowStatus extends StatelessWidget {
  final DetailsArg pokemon;
  ShowStatus({required this.pokemon});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Height",
                style: TextStyle(color: Color.fromARGB(255, 151, 151, 151)),
              ),
              Text(
                pokemon.altura,
                style: TextStyle(color: Color.fromARGB(255, 151, 151, 151)),
              )
            ],
          )
        ],
      ),
    );
  }
}

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
          //color: Colors.red,
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
                  "Evolução",
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
