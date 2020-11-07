import 'package:farmers_market_web/components/menu_item.dart';
import 'package:farmers_market_web/styles/colors.dart';
import 'package:flutter/material.dart';

class ProductMenu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<ProductMenu> {
  int selectedIndex = 0;
  int hoverIndex = 0;
  List<dynamic> menuItems = [
    "Home & Living",
    "Art & Collectables",
    "Jewellery & Accessories",
    "Designer Clothes",
    "Gift Ideas",
    "Decors",
    "Everyday Favourites"
  ];
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20 * 2.5),
      constraints: BoxConstraints(maxWidth: screenSize.width / 7),
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        children: menuItems
            .asMap()
            .entries
            .map(
              (MapEntry map) => buildMenuItem(map.key),
            )
            .toList(),
      ),
    );
  }

  Widget buildMenuItem(int index) => InkWell(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        onHover: (value) {
          setState(() {
            value ? hoverIndex = index : hoverIndex = selectedIndex;
          });
        },
        child: Container(
          constraints: BoxConstraints(minWidth: 122),
          height: 40,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text(
                menuItems[index],
                style: TextStyle(
                  fontSize: 16,
                  color:
                      selectedIndex == index ? AppColors.orange : Colors.white,
                ),
              ),
              // Hover
              AnimatedPositioned(
                duration: Duration(milliseconds: 200),
                left: 0,
                right: 0,
                bottom:
                    selectedIndex != index && hoverIndex == index ? -20 : -32,
                child: Container(
                  margin: EdgeInsets.only(top: 20 / 4), //top padding 5
                  height: 5,
                  width: 30,
                  color: selectedIndex == index
                      ? Colors.orange
                      : Colors.transparent,
                ),
              ),
              // Select
              AnimatedPositioned(
                duration: Duration(milliseconds: 200),
                left: 0,
                right: 0,
                bottom: selectedIndex == index ? -2 : -32,
                child: Container(
                  margin: EdgeInsets.only(top: 20 / 4), //top padding 5
                  height: 5,
                  width: 30,
                  color: selectedIndex == index
                      ? Colors.orange
                      : Colors.transparent,
                ),
              ),
            ],
          ),
        ),
      );
}
