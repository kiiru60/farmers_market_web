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
      color: Colors.blue,
    ),
    Container(
      height: 820,
      //width: 200,
      color: Colors.green,
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
          backgroundColor: Colors.amberAccent,
          groupAlignment: 0,
          destinations: [
            NavigationRailDestination(
              label: Text('drink'),
              icon: Icon(Icons.favorite_border),
            ),
            NavigationRailDestination(
              label: Text('donuts'),
              icon: Icon(Icons.bookmark_border),
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
