import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GameTopChartsTabs extends StatefulWidget {
  int colorVal;
  GameTopChartsTabs(this.colorVal);

  _GameTopChartsTabsState createState() => _GameTopChartsTabsState();
}

class _GameTopChartsTabsState extends State<GameTopChartsTabs>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 10);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {
      widget.colorVal = 0xff3f51b5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xffEFF0F1),
      elevation: 14.0,
      shadowColor: Color(0x802196F3),
      child: Padding(
        padding: EdgeInsets.only(top: 5.0),
        child: pageBody(),
      ),
    );
  }

  Widget pageBody() {
    return DefaultTabController(
      length: 10,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          // child: Container(
          child: SafeArea(
            child: Column(
              children: <Widget>[
                //Expanded(child: Container()),
                TabBar(
                  isScrollable: true,
                  controller: _tabController,
                  labelPadding: EdgeInsets.all(10.0),
                  indicatorColor: Color(widget.colorVal),
                  indicatorWeight: 5.0,
                  tabs: [
                    Text("Top Selling",
                        style: TextStyle(
                            color: _tabController.index == 0
                                ? Color(widget.colorVal)
                                : Colors.black)),
                    Text("Kitchen Decorations",
                        style: TextStyle(
                            color: _tabController.index == 1
                                ? Color(widget.colorVal)
                                : Colors.black)),
                    Text("Baking",
                        style: TextStyle(
                            color: _tabController.index == 2
                                ? Color(widget.colorVal)
                                : Colors.black)),
                    Text("kitchen Storage",
                        style: TextStyle(
                            color: _tabController.index == 3
                                ? Color(widget.colorVal)
                                : Colors.black)),
                    Text("Cookware",
                        style: TextStyle(
                            color: _tabController.index == 4
                                ? Color(widget.colorVal)
                                : Colors.black)),
                    Text("Tea and Coffee items",
                        style: TextStyle(
                            color: _tabController.index == 5
                                ? Color(widget.colorVal)
                                : Colors.black)),
                    Text("Kitchen Appliances",
                        style: TextStyle(
                            color: _tabController.index == 6
                                ? Color(widget.colorVal)
                                : Colors.black)),
                    Text("Drink and bar items",
                        style: TextStyle(
                            color: _tabController.index == 7
                                ? Color(widget.colorVal)
                                : Colors.black)),
                    Text("Dining and Serving",
                        style: TextStyle(
                            color: _tabController.index == 8
                                ? Color(widget.colorVal)
                                : Colors.black)),
                    Text("Linens",
                        style: TextStyle(
                            color: _tabController.index == 9
                                ? Color(widget.colorVal)
                                : Colors.black)),
                  ],
                ),
              ],
            ),
          ),
        ),
        //),
        body: new TabBarView(
          controller: _tabController,
          children: <Widget>[
            Container(
              height: 200.0,
              child: Center(child: Text('TOP Free')),
            ),
            Container(
              height: 200.0,
              child: Center(child: Text('TOP GROSSING')),
            ),
            Container(
              height: 200.0,
              child: Center(child: Text('TRENDING')),
            ),
            Container(
              height: 200.0,
              child: Center(child: Text('TOP PAID')),
            ),
            Container(
              height: 200.0,
              child: Center(child: Text('TOP RATED')),
            ),
            Container(
              height: 200.0,
              child: Center(child: Text('TOP RATED')),
            ),
            Container(
              height: 200.0,
              child: Center(child: Text('TOP RATED')),
            ),
            Container(
              height: 200.0,
              child: Center(child: Text('TOP RATED')),
            ),
            Container(
              height: 200.0,
              child: Center(child: Text('TOP RATED')),
            ),
            Container(
              height: 200.0,
              child: Center(child: Text('TOP RATED')),
            ),
          ],
        ),
      ),
    );
  }
}
