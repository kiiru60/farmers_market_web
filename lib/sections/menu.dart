import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:farmers_market_web/styles/colors.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        dotColor: AppColors.orange,
        dotSize: 8.5,
        dotSpacing: 16.0,
        dotBgColor: Colors.transparent,
        showIndicator: true,
        overlayShadow: true,
        overlayShadowColors: Colors.white.withOpacity(0.95),
        overlayShadowSize: 0.9,
        images: [
          AssetImage("assets/images/banner.jpg"),
          AssetImage("assets/images/banner2.jpg"),
          AssetImage("assets/images/banner3.jpg"),
          AssetImage("assets/images/banner4.jpg"),
          AssetImage("assets/images/banner6.jpg"),
        ],
      ),
    );
  }
}
