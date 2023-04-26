import 'package:flutter/material.dart';

import '../../card_app.dart';

class PageViewApp extends StatelessWidget {
  final double top;
  //late PageController _pageController;
  final ValueChanged<int> onChanged;
  final GestureDragUpdateCallback onPanUpdate;

  PageViewApp({required this.top, required this.onChanged, required this.onPanUpdate});

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
      top: top,
      height: MediaQuery.of(context).size.height * 0.45,
      left: 0,
      right: 0,
      child: GestureDetector(
        onPanUpdate: onPanUpdate,
        child: PageView(
          onPageChanged: onChanged,
          //controller: _pageController,
          physics: BouncingScrollPhysics(),
          children: [
            CardApp(),
            CardApp(),
            CardApp(),
          ],
        ),
      ),
    );
  }
}
