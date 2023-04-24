import 'package:flutter/material.dart';

import '../../card_app.dart';

class PageViewApp extends StatelessWidget {
  final double top;
  //late PageController _pageController;
  final ValueChanged<int> onChanged;

  PageViewApp({required this.top, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      height: MediaQuery.of(context).size.height * 0.45,
      left: 0,
      right: 0,
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
    );
  }
}
