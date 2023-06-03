import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/pokemon_item.dart';
import 'package:flutter_application_1/pages/showList.dart';

final dataService = DataService();

class Search extends SearchDelegate {
  List pokemon = [];
  final Function(String, DetailsArg) onItemTap;

  Search({required this.onItemTap});

  @override
  String get searchFieldLabel => "nome do pokemon";

  @override
  List<Widget> buildActions(BuildContext context) {
    dataService.carregarPokemon();
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, '');
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List nexEvolution = [];
    dataService.carregarPokemon();
    pokemon = dataService.tableStateNotifier.value['dataObjects'];
    List matchQuery = [];
    for (var poke in pokemon) {
      if (poke['name'].toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(poke);
      }
    }
    List nex = [];
    for (var poke in pokemon) {
      print("entrou");
      if (poke['next_evolution'] != null) {
        nex.add(poke);
      }
    }
    
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            children: matchQuery
                .map((e) => PokemonItem(
                      pokemon: DetailsArg(
                        nome: e['name'],
                        img: e['img'],
                        type: (e['type'] as List<dynamic>)
                            .map((e) => e as String)
                            .toList(),
                        id: e['id'],
                        num: e['num'],
                        altura: e['height'],
                        peso: e['weight'],
                        spawnChance: (e['spawn_chance']).toString(),
                        ovo: e['egg'],
                        avgSpawns: (e['avg_spawns']).toString(),
                        weaknesses: (e['weaknesses'] as List<dynamic>)
                            .map((e) => e as String)
                            .toList(),
                        nexEvolution: nex
                      ),
                      onTap: onItemTap,
                    ))
                .toList(),
          )),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    dataService.carregarPokemon();
    pokemon = dataService.tableStateNotifier.value['dataObjects'];
    List matchQuery = [];
    for (var poke in pokemon) {
      if (poke['name'].toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(poke);
      }
    }
    List nex = [];
    for (var poke in pokemon) {
      print("entrou");
      if (poke['next_evolution'] != null) {
        nex.add(poke);
      }
    }
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            children: matchQuery
                .map((e) => PokemonItem(
                      pokemon: DetailsArg(
                          nome: e['name'],
                          img: e['img'],
                          type: (e['type'] as List<dynamic>)
                              .map((e) => e as String)
                              .toList(),
                          id: e['id'],
                          num: e['num'],
                          altura: e['height'],
                          peso: e['weight'],
                          spawnChance: (e['spawn_chance']).toString(),
                          ovo: e['egg'],
                          avgSpawns: (e['avg_spawns']).toString(),
                          weaknesses: (e['weaknesses'] as List<dynamic>)
                              .map((e) => e as String)
                              .toList(),
                          nexEvolution: nex),
                      onTap: onItemTap,
                    ))
                .toList(),
          )),
    );
  }
}
