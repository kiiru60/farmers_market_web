import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:farmers_market_web/styles/colors.dart';

class MyFlexiableAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      height: 120,
      child: Column(
        children: [
          Container(
            color: AppColors.darkblue,
            child: Stack(
              children: <Widget>[
                //make curves for desgining
                ClipPath(
                  child: Container(
                    color: AppColors.green,
                    height: 108,
                    width: screenSize.width,
                  ),
                  clipper: WaveClipperOne(),
                ),

                ClipPath(
                  child: Container(
                    color: AppColors.darkblue,
                    height: 108,
                    width: screenSize.width,
                  ),
                  clipper: WaveClipperTwo(reverse: true),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
