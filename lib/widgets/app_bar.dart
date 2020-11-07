import 'package:farmers_market_web/screens/homepage.dart';
import 'package:farmers_market_web/screens/vendor.dart';
import 'package:farmers_market_web/styles/colors.dart';
import 'package:farmers_market_web/widgets/search_textfield.dart';
import 'package:flutter/material.dart';
import 'package:farmers_market_web/components/default_button.dart';
import 'package:farmers_market_web/screens/login.dart';
import 'package:farmers_market_web/components/menu_item.dart';
import 'package:flutter/rendering.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final screensize = MediaQuery.of(context).size;
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
        //crossAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            child: GestureDetector(
              child: Image.asset(
                "assets/images/rafiki.png",
                height: 50,
                alignment: Alignment.topCenter,
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
          ),
          SizedBox(width: 5),
          //InputField(content: "search"),
          Container(
            width: MediaQuery.of(context).size.width / 2.5,
            child: SearchTextField(
              hintText: 'Search for anything ',
              materialIcon: Icons.search,
              textInputType: TextInputType.text,
            ),
          ),
          Spacer(),
          MenuItem(
            title: 'Home',
            materialIcon: Icons.home,
            press: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Vendor()));
            },
          ),
          Spacer(),
          MenuItem(
            title: "Why us",
            materialIcon: Icons.question_answer,
            press: () {},
          ),
          Spacer(),
          MenuItem(
            title: "Promotions",
            materialIcon: Icons.home,
            press: () {},
          ),
          Spacer(),
          MenuItem(
            title: "Account",
            materialIcon: Icons.person,
            press: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Login()));
            },
          ),
          Spacer(),
          MenuItem(
            title: "Cart",
            materialIcon: Icons.shopping_cart,
            press: () {},
          ),
          Spacer(),
          DefaultButton(
            text: "Seller Page",
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
              "assets/images/rafiki.png",
              height: 50,
              alignment: Alignment.topCenter,
            ),
          ),
          SizedBox(width: 5),
          Container(
            width: MediaQuery.of(context).size.width / 2.0,
            child: SearchTextField(
              hintText: 'Search for anything ',
              materialIcon: Icons.search,
              textInputType: TextInputType.text,
            ),
          ),
          IconButton(
            icon: Icon(Icons.add_shopping_cart, color: Colors.white),
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
              "assets/images/rafiki.png",
              height: 40,
              alignment: Alignment.topCenter,
            ),
          ),
          SizedBox(width: 5),
          //InputField(content: "search"),
          Container(
            width: MediaQuery.of(context).size.width / 2.0,
            child: SearchTextField(
              hintText: 'Search for anything ',
              materialIcon: Icons.search,
              textInputType: TextInputType.text,
            ),
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
          FlatButton(
            color: AppColors.frontgreen,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            onPressed: () {},
            child: Text("Seller Page"),
          ),
        ],
      ),
    );
  }
}
