import 'package:farmers_market_web/Filters/filters_screen.dart';
import 'package:farmers_market_web/models/filter_rules.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageBody(),
    );
  }

  Widget pageBody() {
    return Center(
        child:
            FiltersScreen(FilterRules(hashTags: null, selectedHashTags: null)));
  }
}
