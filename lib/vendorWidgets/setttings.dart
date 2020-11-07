import 'package:farmers_market_web/styles/colors.dart';
import 'package:farmers_market_web/styles/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
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
            Text('Settings'),
          ],
        ))
      ],
    ));
  }
}
