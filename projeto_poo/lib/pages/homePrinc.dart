import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomePrinc extends HookWidget {
  final Function(String) onTap;

  HomePrinc({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[800],
      body: Padding(
        padding: const EdgeInsets.only(top: 70),
        child: Center(
          child: ListView(
            children: [
              Container(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/imgs/logo2.png',
                      width: 300,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.white),
                          color: Colors.red.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        width: 320,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
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
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Flexible(child: Text("Criar Conta", style: TextStyle(color: Colors.white))),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Flexible(child: Text("Esqueceu a senha?", style: TextStyle(color: Colors.white))),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 25),
                                child: Container(
                                  decoration: BoxDecoration(
                                    //color: Colors.black.withOpacity(0.6),
                                    border: Border.all(width: 1, color: Colors.white),
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  width: 300,
                                  height: 45,
                                  child: GestureDetector(
                                    onTap: () => onTap('/poke'),
                                    child: Container(
                                      child: Center(
                                        child: Text(
                                          'Entrar',
                                          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ]),
          ),
        ),
    );
  }
}