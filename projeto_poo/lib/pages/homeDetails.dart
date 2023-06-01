import 'package:flutter/material.dart';
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
  final DetailsArg arguments;
  HomeDetails({required this.arguments});

  @override
  Widget build(BuildContext context) {
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
                  num: arguments.num)),
          Positioned(
            top: 82,
            left: 0,
            right: 0,
            height: 350,
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
              height: 300,
              child: Flexible(
                child: Image.network(
                  arguments.img,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          MyPageView()
        ],
      ),
    );
  }
}

class MyPageView extends StatefulWidget {
  MyPageView({Key? key}) : super(key: key);
  @override
  _MyPageViewState createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  int pagAtual = 0;
  late PageController pc;
  //final ValueChanged<int> onChanged;

  @override
  void initState() {
    super.initState();
    pc = PageController(initialPage: pagAtual);
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      height: 280,
      child: PageView(
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        //controller: pc,
        children: [
          Container(
            width: 100,
            height: 100,
            color: Colors.blue,
          ),
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
