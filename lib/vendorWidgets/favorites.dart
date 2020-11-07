import 'package:farmers_market_web/styles/colors.dart';
import 'package:farmers_market_web/styles/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Favourites extends StatefulWidget {
  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourites'),
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
            Text('Favourites'),
          ],
        ))
      ],
    ));
  }
}
