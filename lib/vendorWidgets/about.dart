import 'package:farmers_market_web/styles/colors.dart';
import 'package:farmers_market_web/styles/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
        backgroundColor: AppColors.darkblue,
      ),
      body: pageBody(),
    );
  }

  Widget pageBody() {
    return Scaffold(
        body: Column(
      children: [
        Container(
            child: Wrap(
          children: [
            Text(
                "Digitally connecting African Artisans and International Customers",
                style: TextStyles.body),
          ],
        ))
      ],
    ));
  }
}
