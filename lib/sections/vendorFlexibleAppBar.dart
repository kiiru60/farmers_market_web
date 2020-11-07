import 'package:farmers_market_web/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:farmers_market_web/styles/colors.dart';

class MyVendorFlexiableAppBar extends StatelessWidget {
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
                    height: 80,
                    width: screenSize.width,
                  ),
                  clipper: WaveClipperTwo(),
                ),
                Positioned(
                  child: Container(
                    child: GestureDetector(
                      child: Image.asset(
                        "assets/images/rafiki.png",
                        height: 50,
                        alignment: Alignment.topCenter,
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                    ),
                  ),
                  bottom: 50,
                  left: 60,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
