import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/pokemon_item.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

enum TableStatus { idle, loading, ready, error }

enum ItemType { pokemon, none }

class DataService {
  final ValueNotifier<Map<String, dynamic>> tableStateNotifier = ValueNotifier({
    'status': TableStatus.idle,
    'dataObjects': [],
    'itemType': ItemType.none
  });

  void carregarPokemon() async {
    if (tableStateNotifier.value['status'] == TableStatus.loading) return;
    if (tableStateNotifier.value['itemType'] != ItemType.pokemon) {
      tableStateNotifier.value = {
        'status': TableStatus.loading,
        'dataObjects': [],
        'itemType': ItemType.pokemon
      };
    }

    var jsonString = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json'));
    var usersJson = jsonDecode(jsonString.body) as Map<String, dynamic>;
    final list = usersJson['pokemon'] as List<dynamic>;

    tableStateNotifier.value = {
      'itemType': ItemType.pokemon,
      'status': TableStatus.ready,
      'dataObjects': list,
    };
  }
}

final dataService = DataService();

class ShowList extends StatelessWidget {
  final Function(String, DetailsArg) onItemTap;

  ShowList({required this.onItemTap});

  @override
  Widget build(BuildContext context) {
    dataService.carregarPokemon();
    return ValueListenableBuilder(
        valueListenable: dataService.tableStateNotifier,
        builder: (_, value, __) {
          switch (value['status']) {
            case TableStatus.idle:
              return Center(child: Text("Toque algum botão, abaixo..."));

            case TableStatus.loading:
              return Center(child: CircularProgressIndicator());

            case TableStatus.ready:
              return ListWidget(
                jsonObjects: value['dataObjects'],
                onItemTap: onItemTap,
              );

            case TableStatus.error:
              return Text("Lascou");
          }
          return Text("...");
        });
  }
}

class DetailsArg {
  String nome;
  String img;
  List<String> type;
  int id;
  String num;

  Color? get baseColor => _color(type: type[0]);
  String get image =>
      'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/$num.png';

  DetailsArg(
      {required this.nome,
      required this.img,
      required this.type,
      required this.id,
      required this.num});

  static Color? _color({required String type}) {
    switch (type) {
      case 'Normal':
        return Colors.brown[400];
      case 'Fire':
        return Colors.red;
      case 'Water':
        return Colors.blue;
      case 'Grass':
        return Colors.green;
      case 'Electric':
        return Colors.amber;
      case 'Ice':
        return Colors.cyanAccent[400];
      case 'Fighting':
        return Colors.orange;
      case 'Poison':
        return Colors.purple;
      case 'Ground':
        return Colors.orange[300];
      case 'Flying':
        return Colors.indigo[200];
      case 'Psychic':
        return Colors.pink;
      case 'Bug':
        return Colors.lightGreen[500];
      case 'Rock':
        return Colors.grey;
      case 'Ghost':
        return Colors.indigo[400];
      case 'Dark':
        return Colors.brown;
      case 'Dragon':
        return Colors.indigo[800];
      case 'Steel':
        return Colors.blueGrey;
      case 'Fairy':
        return Colors.pinkAccent[100];
      default:
        return Colors.grey;
    }
  }
}

class ListWidget extends HookWidget {
  final List jsonObjects;
  final Function(String, DetailsArg) onItemTap;

  ListWidget({this.jsonObjects = const [], required this.onItemTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            children: jsonObjects.map((e) => PokemonItem(
              pokemon: DetailsArg(
                nome: e['name'], 
                img: e['img'], 
                type: (e['type'] as List<dynamic>)
                      .map((e) => e as String)
                      .toList(), 
                id: e['id'], 
                num: e['num']),
                onTap: onItemTap,
            )).toList(),
          )),
    );
  }
}
