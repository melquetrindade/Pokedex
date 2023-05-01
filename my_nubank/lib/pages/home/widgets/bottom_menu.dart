import 'package:flutter/material.dart';
import 'package:my_nubank/pages/home/widgets/item_menu_bottom.dart';

class BottomMenu extends StatelessWidget {
  final bool showMenu;

  BottomMenu({required this.showMenu});

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 100),
      bottom: !showMenu ? 0 + MediaQuery.of(context).padding.bottom : 0,
      height: MediaQuery.of(context).size.height * 0.14,
      left: 0,
      right: 0,
      child: IgnorePointer(
        ignoring: showMenu,
        child: AnimatedOpacity(
          duration: Duration(milliseconds: 100),
          opacity: showMenu ? 0 : 1,
          child: Container(
            child: ListView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [
                ItemMenuBottom(
                  icon: Icons.person_add,
                  text: "Indicar Amigos",
                ),
                ItemMenuBottom(
                  icon: Icons.phone_android,
                  text: "Recarga de Celular",
                ),
                ItemMenuBottom(
                  icon: Icons.chat,
                  text: "Cobrar",
                ),
                ItemMenuBottom(
                  icon: Icons.monetization_on,
                  text: "Empréstimos",
                ),
                ItemMenuBottom(
                  icon: Icons.move_to_inbox,
                  text: "Depositar",
                ),
                ItemMenuBottom(
                  icon: Icons.mobile_screen_share,
                  text: "Transferir",
                ),
                ItemMenuBottom(
                  icon: Icons.format_align_center,
                  text: "Ajustar Limite",
                ),
                ItemMenuBottom(
                  icon: Icons.chrome_reader_mode,
                  text: "Pagar",
                ),
                ItemMenuBottom(
                  icon: Icons.lock_open,
                  text: "Bloquear Cartão",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
