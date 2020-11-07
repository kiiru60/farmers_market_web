import 'package:farmers_market_web/sections/bottom_navigator.dart';
import 'package:farmers_market_web/sections/footer.dart';
import 'package:farmers_market_web/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Orders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 820,
              color: Colors.white,
            ),
            //bottom container
            Container(
              height: 420,
              color: AppColors.darkblue,
              child: BottomNavigator(),
            ),
            Container(
              height: 70,
              color: AppColors.darkgreen,
              child: Footer(),
            ),
          ],
        ),
      ),
    );
  }
}
