import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:my_nubank/pages/home/widgets/my_app_bar.dart';
import 'package:my_nubank/pages/card_app.dart';
import 'package:my_nubank/pages/home/widgets/my_dots_app.dart';
import 'package:my_nubank/pages/home/widgets/page_view_app.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showMenu = false;
  //int pagAtual = 0;
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _showMenu = false;
    _currentIndex = 0;
    //_pageController = PageController(initialPage: pagAtual);
  }

  @override
  Widget build(BuildContext context) {
    double _screenHeigth = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.purple[800],
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          MyAppBar(
            showMenu: _showMenu,
            onTap: () {
              setState(() {
                _showMenu = !_showMenu;
              });
            },
          ),
          /*
          Positioned(
            top: _screenHeigth * 0.20,
            height: _screenHeigth * 0.55,
            left: 0,
            right: 0,
            child: PageView(
              controller: _pageController,
              physics: BouncingScrollPhysics(),
              children: [
                CardApp(),
                CardApp(),
                CardApp(),
              ],
            ),
          ),*/
          PageViewApp(
            top: _screenHeigth * 0.24,
            onChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          Positioned(
            top: _screenHeigth * 0.70,
            child: MyDotsApp(curretIndex: _currentIndex,),
          )
        ],
      ),
    );
  }
}
