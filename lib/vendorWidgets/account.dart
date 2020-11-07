import 'package:farmers_market_web/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Account'),
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
          children: [],
        ))
      ],
    ));
  }
}
