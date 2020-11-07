import 'package:farmers_market_web/styles/tabbar.dart';
import 'package:farmers_market_web/widgets/chat.dart';
import 'package:farmers_market_web/widgets/dashboard.dart';
import 'package:farmers_market_web/widgets/navbar.dart';
import 'package:farmers_market_web/widgets/orders.dart';
import 'package:farmers_market_web/widgets/products.dart';
import 'package:farmers_market_web/widgets/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Vendor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
          body: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  AppNavbar.materialNavBar(title: '', tabBar: vendorTabBar)
                ];
              },
              body: TabBarView(
                children: <Widget>[
                  Products(),
                  Orders(),
                  Chat(),
                  Dashboard(),
                  Profile(),
                ],
              ))),
    );
  }

  static TabBar get vendorTabBar {
    return TabBar(
      //isScrollable: true,
      unselectedLabelColor: TabBarStyles.unselectedLabelColor,
      labelColor: TabBarStyles.labelColor,
      indicatorColor: TabBarStyles.indicatorColor,
      tabs: <Widget>[
        Tab(icon: Icon(Icons.list), text: 'Products'),
        Tab(icon: Icon(Icons.shopping_cart), text: 'Orders'),
        Tab(icon: Icon(Icons.chat), text: 'Chat'),
        Tab(icon: Icon(Icons.dashboard), text: 'Dashboard'),
        Tab(icon: Icon(Icons.person), text: 'Profile'),
      ],
    );
  }
}
