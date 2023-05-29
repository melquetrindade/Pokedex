import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/showList.dart';

class TypePokemon extends StatelessWidget {
  final String nome;

  TypePokemon({required this.nome});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Text(
            nome,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ),
      ),
    );
  }
}

class PokemonItem extends StatelessWidget {
  final DetailsArg pokemon;
  final Function(String, DetailsArg) onTap;

  PokemonItem({
    required this.pokemon,
    required this.onTap
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap('/details',
              DetailsArg(
                  nome: pokemon.nome,
                  img: pokemon.img,
                  type: (pokemon.type as List<dynamic>)
                      .map((e) => e as String)
                      .toList(),
                  id: pokemon.id,
                  num: pokemon.num)),
      child: Container(
        decoration: BoxDecoration(
            color: pokemon.baseColor!.withOpacity(0.8),
            borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      child: Text(pokemon.nome,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16))),
                  Text('#${pokemon.num}',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.4),
                          fontWeight: FontWeight.bold,
                          fontSize: 14))
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                        pokemon.type.map((e) => TypePokemon(nome: e)).toList(),
                  ),
                  Flexible(child: Image.network(pokemon.img))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
