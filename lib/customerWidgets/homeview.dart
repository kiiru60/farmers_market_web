import 'package:farmers_market_web/customerWidgets/homeviewScreens/games.dart';
import 'package:farmers_market_web/customerWidgets/homeviewScreens/screen_one.dart';
import 'package:farmers_market_web/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeView extends StatefulWidget {
  HomeView(this.colorVal);
  int colorVal;

  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 11);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {
      widget.colorVal = 0xffff5722;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        appBar: AppBar(
          leading: Container(),
          backgroundColor: AppColors.lightgray,
          title: Center(
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              indicatorWeight: 3.0,
              indicatorColor: Color(0xffff5722),
              unselectedLabelColor: Colors.grey,
              tabs: <Widget>[
                Tab(
                  icon: Icon(FontAwesomeIcons.compass,
                      color: _tabController.index == 0
                          ? Color(widget.colorVal)
                          : Colors.black),
                  child: Text('Just For You ',
                      style: TextStyle(
                          color: _tabController.index == 0
                              ? Color(widget.colorVal)
                              : Colors.black)),
                ),
                Tab(
                  icon: Icon(FontAwesomeIcons.cottonBureau,
                      color: _tabController.index == 1
                          ? Color(widget.colorVal)
                          : Colors.black),
                  child: Text('Floor and Rugs ',
                      style: TextStyle(
                          color: _tabController.index == 1
                              ? Color(widget.colorVal)
                              : Colors.black)),
                ),
                Tab(
                  icon: Icon(FontAwesomeIcons.cookieBite,
                      color: _tabController.index == 2
                          ? Color(widget.colorVal)
                          : Colors.black),
                  child: Text('Kitchen & Dining ',
                      style: TextStyle(
                          color: _tabController.index == 2
                              ? Color(widget.colorVal)
                              : Colors.black)),
                ),
                Tab(
                  icon: Icon(FontAwesomeIcons.bed,
                      color: _tabController.index == 3
                          ? Color(widget.colorVal)
                          : Colors.black),
                  child: Text('Bedroom Items',
                      style: TextStyle(
                          color: _tabController.index == 3
                              ? Color(widget.colorVal)
                              : Colors.black)),
                ),
                Tab(
                  icon: Icon(FontAwesomeIcons.houseUser,
                      color: _tabController.index == 4
                          ? Color(widget.colorVal)
                          : Colors.black),
                  child: Text('Outdoor Home Decors',
                      style: TextStyle(
                          color: _tabController.index == 4
                              ? Color(widget.colorVal)
                              : Colors.black)),
                ),
                Tab(
                  icon: Icon(FontAwesomeIcons.box,
                      color: _tabController.index == 5
                          ? Color(widget.colorVal)
                          : Colors.black),
                  child: Text('Organization and Storage',
                      style: TextStyle(
                          color: _tabController.index == 5
                              ? Color(widget.colorVal)
                              : Colors.black)),
                ),
                Tab(
                  icon: Icon(FontAwesomeIcons.chair,
                      color: _tabController.index == 6
                          ? Color(widget.colorVal)
                          : Colors.black),
                  child: Text('Traditional Furniture',
                      style: TextStyle(
                          color: _tabController.index == 6
                              ? Color(widget.colorVal)
                              : Colors.black)),
                ),
                Tab(
                  icon: Icon(FontAwesomeIcons.home,
                      color: _tabController.index == 7
                          ? Color(widget.colorVal)
                          : Colors.black),
                  child: Text('Home Improvement ',
                      style: TextStyle(
                          color: _tabController.index == 7
                              ? Color(widget.colorVal)
                              : Colors.black)),
                ),
                Tab(
                  icon: Icon(FontAwesomeIcons.home,
                      color: _tabController.index == 8
                          ? Color(widget.colorVal)
                          : Colors.black),
                  child: Text('Office  ',
                      style: TextStyle(
                          color: _tabController.index == 8
                              ? Color(widget.colorVal)
                              : Colors.black)),
                ),
                Tab(
                  icon: Icon(FontAwesomeIcons.home,
                      color: _tabController.index == 9
                          ? Color(widget.colorVal)
                          : Colors.black),
                  child: Text('Food and Drink ',
                      style: TextStyle(
                          color: _tabController.index == 9
                              ? Color(widget.colorVal)
                              : Colors.black)),
                ),
                Tab(
                  icon: Icon(FontAwesomeIcons.cross,
                      color: _tabController.index == 10
                          ? Color(widget.colorVal)
                          : Colors.black),
                  child: Text('Spiritual and Religion ',
                      style: TextStyle(
                          color: _tabController.index == 10
                              ? Color(widget.colorVal)
                              : Colors.black)),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            Scaffold(),
            ScreenOne(),
            GameTopChartsTabs(0xff3f51b5),
            Container(
              height: 200.0,
              child: Center(child: Text('Family')),
            ),
            Container(
              height: 200.0,
              child: Center(child: Text('Early Access')),
            ),
            Container(
              height: 200.0,
              child: Center(child: Text('Editor Choice')),
            ),
            Container(
              height: 200.0,
              child: Center(child: Text('Editor Choice')),
            ),
            Container(
              height: 200.0,
              child: Center(child: Text('Editor Choice')),
            ),
            Container(
              height: 200.0,
              child: Center(child: Text('Editor Choice')),
            ),
            Container(
              height: 200.0,
              child: Center(child: Text('Editor Choice')),
            ),
            Container(
              height: 200.0,
              child: Center(child: Text('Editor Choice')),
            ),
          ],
        ),
      ),
    );
  }
}
