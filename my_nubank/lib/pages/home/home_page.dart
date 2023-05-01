import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:my_nubank/pages/home/widgets/bottom_menu.dart';
import 'package:my_nubank/pages/home/widgets/item_menu_bottom.dart';
import 'package:my_nubank/pages/home/widgets/menu_app.dart';
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
  double _yPosition = 0;

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
    if (_yPosition == 0) {
      _yPosition = _screenHeigth * 0.24;
    }

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
                _yPosition =
                    _showMenu ? _screenHeigth * 0.75 : _screenHeigth * 0.24;
              });
            },
          ),
          MenuApp(
            top: _screenHeigth * 0.20,
            showMenu: _showMenu,
          ),
          BottomMenu(showMenu: _showMenu,),
          PageViewApp(
            top:_yPosition,
            onChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            onPanUpdate: (details) {
              double positionBottomLimit = _screenHeigth * 0.75;
              double positionTopLimit = _screenHeigth * 0.24;
              double midlePosition =
                  (positionTopLimit - positionBottomLimit) / 2;
              setState(() {
                _yPosition += details.delta.dy;

                _yPosition = _yPosition < positionTopLimit
                    ? positionTopLimit
                    : _yPosition;

                _yPosition = _yPosition > positionBottomLimit
                    ? positionBottomLimit
                    : _yPosition;

                if (_yPosition != positionBottomLimit && details.delta.dy > 0) {
                  _yPosition = _yPosition > positionTopLimit + midlePosition
                      ? positionBottomLimit
                      : _yPosition;
                }

                if (_yPosition != positionTopLimit && details.delta.dy < 0) {
                  _yPosition =
                      _yPosition < positionBottomLimit - midlePosition - 50
                          ? positionTopLimit
                          : _yPosition;
                }

                if (_yPosition == positionBottomLimit) {
                  _showMenu = true;
                } else if (_yPosition == positionTopLimit) {
                  _showMenu = false;
                }
              });
            },
            showMenu: _showMenu,
          ),
          MyDotsApp(
            curretIndex: _currentIndex,
            top: _screenHeigth * 0.70,
            showMenu: _showMenu,
          ),
          
        ],
      ),
    );
  }
}
