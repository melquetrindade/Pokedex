import 'package:flutter/material.dart';
import 'package:my_nubank/pages/home/widgets/item_menu.dart';

class MenuApp extends StatelessWidget {
  final double top;
  final bool showMenu;

  MenuApp({required this.top, required this.showMenu});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      right: 0,
      left: 0,
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 100),
        opacity: showMenu ? 1 : 0,
        child: Container(
          color: Colors.purple[800],
          height: MediaQuery.of(context).size.height * 0.53,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Image.asset(
                  "assets/imgs/qrCode2.png",
                  height: 100,
                  color: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: Text.rich(
                    TextSpan(text: "Banco ", children: [
                      TextSpan(
                        text: "260 - Nu Pagamentos S.A",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ]),
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text.rich(
                    TextSpan(text: "Agência ", children: [
                      TextSpan(
                        text: "0001",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ]),
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text.rich(
                    TextSpan(text: "Conta ", children: [
                      TextSpan(
                        text: "0000000-0",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ]),
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(children: [
                      ItemMenu(
                        icon: Icons.info_outline,
                        text: "Me Ajuda",
                      ),
                      ItemMenu(
                        icon: Icons.person_2_outlined,
                        text: "Perfil",
                      ),
                      ItemMenu(
                        icon: Icons.settings,
                        text: "Configurar Conta",
                      ),
                      ItemMenu(
                        icon: Icons.credit_card,
                        text: "Configurar Cartão",
                      ),
                      ItemMenu(
                        icon: Icons.store_mall_directory,
                        text: "Pedir Conta PJ",
                      ),
                      ItemMenu(
                        icon: Icons.phone_android,
                        text: "Configuração do App",
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: Container(
                          height: 35,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(width: 0.7, color: Colors.white54),
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.purple[800], elevation: 0),
                            child: Text(
                              "SAIR DO APP",
                              style: TextStyle(fontSize: 10),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      )
                    ]),
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
