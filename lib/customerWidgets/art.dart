import 'package:farmers_market_web/sections/menu.dart';
import 'package:farmers_market_web/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ArtView extends StatefulWidget {
  int colorVal;
  ArtView(this.colorVal);
  _ArtViewState createState() => _ArtViewState();
}

class _ArtViewState extends State<ArtView> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 12);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {
      widget.colorVal = 0xffe91e63;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 9,
      child: Scaffold(
        appBar: AppBar(
          leading: Container(),
          centerTitle: false,
          backgroundColor: AppColors.lightgray,
          title: Center(
            child: TabBar(
              isScrollable: true,
              indicatorWeight: 4.0,
              indicatorColor: Color(0xffe91e63),
              unselectedLabelColor: Colors.black,
              controller: _tabController,
              tabs: <Widget>[
                Tab(
                  icon: Icon(FontAwesomeIcons.compass,
                      color: _tabController.index == 0
                          ? Color(widget.colorVal)
                          : Colors.black),
                  child: Text('Just For You',
                      style: TextStyle(
                          color: _tabController.index == 0
                              ? Color(widget.colorVal)
                              : Colors.black)),
                ),
                Tab(
                  icon: Icon(FontAwesomeIcons.paintBrush,
                      color: _tabController.index == 1
                          ? Color(widget.colorVal)
                          : Colors.black),
                  child: Text('Paintings ',
                      style: TextStyle(
                          color: _tabController.index == 1
                              ? Color(widget.colorVal)
                              : Colors.black)),
                ),
                Tab(
                  icon: Icon(FontAwesomeIcons.draft2digital,
                      color: _tabController.index == 2
                          ? Color(widget.colorVal)
                          : Colors.black),
                  child: Text('Digital Prints ',
                      style: TextStyle(
                          color: _tabController.index == 2
                              ? Color(widget.colorVal)
                              : Colors.black)),
                ),
                Tab(
                  icon: Icon(FontAwesomeIcons.chalkboard,
                      color: _tabController.index == 3
                          ? Color(widget.colorVal)
                          : Colors.black),
                  child: Text('Engraved Prints',
                      style: TextStyle(
                          color: _tabController.index == 3
                              ? Color(widget.colorVal)
                              : Colors.black)),
                ),
                Tab(
                  icon: Icon(FontAwesomeIcons.shapes,
                      color: _tabController.index == 4
                          ? Color(widget.colorVal)
                          : Colors.black),
                  child: Text('Giclee Prints',
                      style: TextStyle(
                          color: _tabController.index == 4
                              ? Color(widget.colorVal)
                              : Colors.black)),
                ),
                Tab(
                  icon: Icon(FontAwesomeIcons.envelopeSquare,
                      color: _tabController.index == 5
                          ? Color(widget.colorVal)
                          : Colors.black),
                  child: Text('Event Prints',
                      style: TextStyle(
                          color: _tabController.index == 5
                              ? Color(widget.colorVal)
                              : Colors.black)),
                ),
                Tab(
                  icon: Icon(FontAwesomeIcons.gift,
                      color: _tabController.index == 6
                          ? Color(widget.colorVal)
                          : Colors.black),
                  child: Text('Memorabilia',
                      style: TextStyle(
                          color: _tabController.index == 6
                              ? Color(widget.colorVal)
                              : Colors.black)),
                ),
                Tab(
                  icon: Icon(FontAwesomeIcons.handPaper,
                      color: _tabController.index == 7
                          ? Color(widget.colorVal)
                          : Colors.black),
                  child: Text('Hand Drawings ',
                      style: TextStyle(
                          color: _tabController.index == 7
                              ? Color(widget.colorVal)
                              : Colors.black)),
                ),
                Tab(
                  icon: Icon(FontAwesomeIcons.globeAfrica,
                      color: _tabController.index == 8
                          ? Color(widget.colorVal)
                          : Colors.black),
                  child: Text('Souveniers',
                      style: TextStyle(
                          color: _tabController.index == 8
                              ? Color(widget.colorVal)
                              : Colors.black)),
                ),
                Tab(
                  icon: Icon(FontAwesomeIcons.glassMartiniAlt,
                      color: _tabController.index == 9
                          ? Color(widget.colorVal)
                          : Colors.black),
                  child: Text('Glass Art',
                      style: TextStyle(
                          color: _tabController.index == 9
                              ? Color(widget.colorVal)
                              : Colors.black)),
                ),
                Tab(
                  icon: Icon(FontAwesomeIcons.artstation,
                      color: _tabController.index == 10
                          ? Color(widget.colorVal)
                          : Colors.black),
                  child: Text('Sculpture Art',
                      style: TextStyle(
                          color: _tabController.index == 10
                              ? Color(widget.colorVal)
                              : Colors.black)),
                ),
                Tab(
                  icon: Icon(FontAwesomeIcons.dragon,
                      color: _tabController.index == 11
                          ? Color(widget.colorVal)
                          : Colors.black),
                  child: Text('Dolls and Miniatures',
                      style: TextStyle(
                          color: _tabController.index == 11
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
            Container(
              height: 200.0,
              child: Center(child: Text('For you')),
            ),
            Container(
              height: 200.0,
              child: Center(child: Text('TV')),
            ),
            Container(
              height: 200.0,
              child: Center(child: Text('Top Sellings')),
            ),
            Menu(),
            Container(
              height: 200.0,
              child: Center(child: Text('Genres')),
            ),
            Container(
              height: 200.0,
              child: Center(child: Text('Studio')),
            ),
            Container(
              height: 200.0,
              child: Center(child: Text('Family')),
            ),
            Container(
              height: 200.0,
              child: Center(child: Text('Family')),
            ),
            Container(
              height: 200.0,
              child: Center(child: Text('Family')),
            ),
            Container(
              height: 200.0,
              child: Center(child: Text('Family')),
            ),
            Container(
              height: 200.0,
            ),
            Container(
              height: 200.0,
              child: Center(child: Text('Family')),
            ),
          ],
        ),
      ),
    );
  }
}
