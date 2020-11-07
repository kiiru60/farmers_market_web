import 'package:farmers_market_web/screens/HomeScreen.dart';
import 'package:farmers_market_web/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:farmers_market_web/screens/login.dart';
import 'package:farmers_market_web/components/menu_item.dart';
import 'package:flutter/rendering.dart';

class VendorAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, screensize) {
        if (screensize.maxWidth > 1200) {
          return DesktopNavbar();
        } else if (screensize.maxWidth > 800 && screensize.maxWidth < 1200) {
          return TabletNavbar();
        } else {
          return MobileNavbar();
        }
      },
    );
  }
}

class DesktopNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(46),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -2),
            blurRadius: 30,
            color: Colors.transparent,
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Container(
            child: Image.asset(
              "assets/images/mart.png",
              height: 60,
              alignment: Alignment.topCenter,
            ),
          ),
          SizedBox(width: 15),
          InputField(content: "search"),
          Spacer(),
          MenuItem(
            title: "Home",
            press: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomeScreen()));
            },
          ),
          MenuItem(
            title: "chat",
            press: () {},
          ),
          MenuItem(
            title: "Products",
            press: () {},
          ),
          MenuItem(
            title: "Orders",
            press: () {},
          ),
          MenuItem(
            title: "Account",
            press: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Login()));
            },
          ),
        ],
      ),
    );
  }
}

class MobileNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(46),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -2),
            blurRadius: 30,
            color: Colors.transparent,
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Container(
            child: Image.asset(
              "assets/images/mart.png",
              height: 60,
              alignment: Alignment.topCenter,
            ),
          ),
          SizedBox(width: 15),
          InputField(content: "search"),
          IconButton(
            icon: Icon(Icons.home, color: Colors.white),
            iconSize: 40,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.add_shopping_cart, color: Colors.white),
            iconSize: 40,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.person, color: Colors.white),
            iconSize: 40,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class TabletNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(46),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -2),
            blurRadius: 30,
            color: Colors.transparent,
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Container(
            child: Image.asset(
              "assets/images/mart.png",
              height: 60,
              alignment: Alignment.topCenter,
            ),
          ),
          SizedBox(width: 15),
          InputField(content: "search"),
          IconButton(
            icon: Icon(Icons.home, color: Colors.white),
            iconSize: 40,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.add_shopping_cart, color: Colors.white),
            iconSize: 40,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.person, color: Colors.white),
            iconSize: 40,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
