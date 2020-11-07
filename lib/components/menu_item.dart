import 'package:farmers_market_web/styles/colors.dart';
import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String title;
  final Function press;
  final IconData materialIcon;
  const MenuItem({
    Key key,
    this.title,
    this.press,
    this.materialIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        splashColor: Colors.green,
        onTap: press,
        hoverColor: AppColors.orange,
        focusColor: AppColors.frontgreen,
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Icon(
                materialIcon,
                color: Colors.white,
                size: 30.0,
              ),
            ),
          ],
        )
      );
  }
}
