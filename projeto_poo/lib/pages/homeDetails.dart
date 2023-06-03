import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/containerStatus.dart';
import 'package:flutter_application_1/pages/pokemon_item.dart';
import 'package:flutter_application_1/pages/showList.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AppBarDetails extends HookWidget {
  final DetailsArg pokemon;

  AppBarDetails({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    var state = useState<bool>(false);
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: AppBar(
        elevation: 0,
        backgroundColor: pokemon.baseColor,
        actions: [
          IconButton(
              onPressed: () {
                state.value = !state.value;
              },
              icon: Icon(state.value ? Icons.favorite : Icons.favorite_border))
        ],
      ),
    );
  }
}

class HomeDetails extends HookWidget {
  int pagAtual = 0;
  final DetailsArg arguments;

  HomeDetails({required this.arguments});

  @override
  Widget build(BuildContext context) {
    var status = useState(pagAtual);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          AppBarDetails(
              pokemon: DetailsArg(
                  nome: arguments.nome,
                  img: arguments.img,
                  type: arguments.type,
                  id: arguments.id,
                  num: arguments.num,
                  altura: arguments.altura,
                  peso: arguments.peso,
                  spawnChance: arguments.spawnChance,
                  ovo: arguments.ovo,
                  avgSpawns: arguments.avgSpawns,
                  weaknesses: (arguments.weaknesses as List<dynamic>)
                      .map((e) => e as String)
                      .toList(),
                  nexEvolution: arguments.nexEvolution,
                  prevEvolution: arguments.prevEvolution
                  )),
          Positioned(
            top: 82,
            left: 0,
            right: 0,
            height: 320,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)),
                color: arguments.baseColor,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            arguments.nome,
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        Text(
                          '#${arguments.num}',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 24, top: 20, right: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: arguments.type
                          .map((e) => TypePokemon(nome: e))
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              top: 200,
              left: 150,
              right: -20,
              child: Opacity(
                opacity: 0.1,
                child: Image.network(
                  "https://cdn.onlinewebfonts.com/svg/img_445231.png",
                  width: 200,
                  height: 200,
                ),
              )),
          Positioned(
            top: 180,
            left: 45,
            right: 45,
            child: Container(
              height: 200,
              child: Flexible(
                child: Image.network(
                  'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/${arguments.num}.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          MyDotsApp(
            curretIndex: pagAtual,
          ),
          MyPageView(
            onChanged: (value) {
              pagAtual = value;
              status.value = value;
            },
            numPokemon: arguments.id,
            pokemon: DetailsArg(
                nome: arguments.nome,
                img: arguments.img,
                type: arguments.type,
                id: arguments.id,
                num: arguments.num,
                altura: arguments.altura,
                peso: arguments.peso,
                spawnChance: arguments.spawnChance,
                ovo: arguments.ovo,
                avgSpawns: arguments.avgSpawns,
                weaknesses: (arguments.weaknesses as List<dynamic>)
                    .map((e) => e as String)
                    .toList(),
                nexEvolution: arguments.nexEvolution,
                prevEvolution: arguments.prevEvolution
                ),
          )
        ],
      ),
    );
  }
}
