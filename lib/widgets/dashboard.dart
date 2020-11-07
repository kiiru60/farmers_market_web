import 'package:farmers_market_web/sections/bottom_navigator.dart';
import 'package:farmers_market_web/sections/footer.dart';
import 'package:farmers_market_web/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Material myItems(IconData icon, String heading, int color) {
    return Material(
      color: AppColors.lightgray,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        heading,
                        style:
                            TextStyle(color: new Color(color), fontSize: 20.0),
                      ),
                    ),
                  ),
                  Material(
                    color: new Color(color),
                    borderRadius: BorderRadius.circular(24.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(
                        icon,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 830,
              width: screenSize.width / 2,
              child: pageBody(),
            ),
            //bottom container
            Container(
              height: 420,
              color: AppColors.darkblue,
              child: BottomNavigator(),
            ),
            Container(
              height: 70,
              color: AppColors.darkgreen,
              child: Footer(),
            ),
          ],
        ),
      ),
    );
  }

  Widget pageBody() {
    return Scaffold(
      body: Container(
        child: StaggeredGridView.count(
          crossAxisCount: 4,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          children: <Widget>[
            myItems(Icons.graphic_eq, "Revenue", 0xFF1B5E20),
            myItems(Icons.graphic_eq, "Revenue", 0xFF1B5E20),
            myItems(Icons.graphic_eq, "Revenue", 0xFF1B5E20),
            myItems(Icons.graphic_eq, "Revenue", 0xFF1B5E20),
            myItems(Icons.graphic_eq, "Revenue", 0xFF1B5E20)
          ],
          staggeredTiles: [
            StaggeredTile.extent(4, 250.0),
            StaggeredTile.extent(2, 250.0),
            StaggeredTile.extent(2, 125.0),
            StaggeredTile.extent(2, 125.0),
            StaggeredTile.extent(4, 250.0),
          ],
        ),
      ),
    );
  }
}
