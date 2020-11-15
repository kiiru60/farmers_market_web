import 'package:farmers_market_web/styles/colors.dart';
import 'package:flutter/material.dart';

class ProfileNavigation extends StatefulWidget {
  const ProfileNavigation({
    Key key,
  }) : super(key: key);

  @override
  _ProfileNavigationState createState() => _ProfileNavigationState();
}

class _ProfileNavigationState extends State<ProfileNavigation> {
  int _selectedIndex = 0;
  List<Widget> containers = [
    Container(
      height: 820,
      //width: 200,
      color: AppColors.white,
    ),
    Container(
      height: 820,
      //width: 200,
      color: AppColors.white,
    ),
    Container(
      height: 820,
      //width: 200,
      color: AppColors.white,
    ),
    Container(
      height: 820,
      //width: 200,
      color: AppColors.white,
    ),
    Container(
      height: 820,
      //width: 200,
      color: AppColors.white,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NavigationRail(
          minExtendedWidth: 200,
          minWidth: 120,
          onDestinationSelected: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          labelType: NavigationRailLabelType.selected,
          backgroundColor: AppColors.lightgray,
          groupAlignment: 0,
          destinations: [
            NavigationRailDestination(
              label: Text('My Account'),
              icon: Icon(Icons.person),
            ),
            NavigationRailDestination(
              label: Text('Favourites'),
              icon: Icon(Icons.favorite),
            ),
            NavigationRailDestination(
              label: Text('Settings'),
              icon: Icon(
                Icons.settings,
                color: Colors.blue,
              ),
            ),
            NavigationRailDestination(
              label: Text('About'),
              icon: Icon(
                Icons.help,
                color: Colors.green,
              ),
            ),
            NavigationRailDestination(
              label: Text('Log out'),
              icon: Icon(
                Icons.transit_enterexit,
                color: Colors.red,
              ),
            ),
          ],
          selectedIndex: _selectedIndex,
        ),
        Expanded(
          child: Center(
            child: containers[_selectedIndex],
          ),
        )
      ],
    );
  }
}
