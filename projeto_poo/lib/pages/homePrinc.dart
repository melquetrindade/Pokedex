import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/searchPoke.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomePrinc extends HookWidget {
  final Function(String) onTap;

  HomePrinc({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/imgs/capa1.jpg'), fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.only(top: 70),
          child: Column(children: [
            Image.asset(
              'assets/imgs/logo2.png',
              width: 300,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Center(
                child: GestureDetector(
                  onTap: () => onTap('/poke'),
                  child: Container(
                    child: Center(
                      child: Text(
                        'Entrar na Pokedex',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

/*
        child: GestureDetector(
          onTap: () => onTap('/poke'),
          child: Container(
            child: Center(
              child: Text(
                'Entrar na Pokedex',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          ),
        ),*/
/*
TextField(
                  decoration: InputDecoration(
                      labelText: "E-mail",
                      prefixIcon: Icon(Icons.mail),
                      border: OutlineInputBorder())),
                Container(
                  height: 20,
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Senha",
                      prefixIcon: Icon(Icons.password),
                      border: OutlineInputBorder()),
                ),
              ],
              ),
              
              GestureDetector(
                onTap: () => onTap('/poke'),
                child: Container(
                  child: Center(
                    child: Text(
                      'Entrar na Pokedex',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  ),
                ),*/