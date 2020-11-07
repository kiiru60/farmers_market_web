import 'package:farmers_market_web/styles/colors.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                child: Text('Terms & Conditions',
                    style: TextStyle(color: AppColors.white)),
                onTap: () {},
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                child: Text('Privacy Notice',
                    style: TextStyle(color: AppColors.white)),
                onTap: () {},
              ),
            ),
          ),
          Container(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "2020 © RafikiMarket.com",
              style: TextStyle(color: AppColors.orange),
            ),
          )),
        ],
      ),
    );
  }
}
