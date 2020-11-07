import 'package:farmers_market_web/customerWidgets/accesories.dart';
import 'package:farmers_market_web/customerWidgets/art.dart';
import 'package:farmers_market_web/customerWidgets/clothes.dart';
import 'package:farmers_market_web/customerWidgets/decors.dart';
import 'package:farmers_market_web/customerWidgets/entertainment.dart';
import 'package:farmers_market_web/customerWidgets/everyday.dart';
import 'package:farmers_market_web/customerWidgets/gift.dart';
import 'package:farmers_market_web/customerWidgets/homeview.dart';
import 'package:farmers_market_web/screens/homescreen.dart';
import 'package:farmers_market_web/sections/myFlexibleSpace.dart';
import 'package:farmers_market_web/styles/colors.dart';
import 'package:farmers_market_web/vendorWidgets/about.dart';
import 'package:farmers_market_web/vendorWidgets/setttings.dart';
import 'package:farmers_market_web/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final Widget child;

  HomePage({Key key, this.child}) : super(key: key);
  _HomePageState createState() => _HomePageState();
}

Color primaryColor = AppColors.darkblue;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 9,
      child: Scaffold(
          appBar: AppBar(
            // backgroundColor: Color(0xff109618),
            backgroundColor: primaryColor,
            title: Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Navbar(),
            ),
            flexibleSpace: MyFlexiableAppBar(),
            iconTheme: IconThemeData(color: Colors.white, size: 60),
            bottomOpacity: 0.6,
            bottom: TabBar(
              // unselectedLabelColor: AppColors.darkblue,
              //indicatorSize: ,
              isScrollable: true,
              indicatorColor: AppColors.lightgray,
              indicatorWeight: 6.0,
              onTap: (index) {
                setState(() {
                  switch (index) {
                    case 0:
                      primaryColor = Color(0xffff5722);
                      break;
                    case 1:
                      primaryColor = Color(0xff3f51b5);
                      break;
                    case 2:
                      primaryColor = Color(0xffe91e63);
                      break;
                    case 3:
                      primaryColor = Color(0xff9c27b0);
                      break;
                    case 4:
                      primaryColor = Color(0xff2196f3);
                      break;
                    default:
                  }
                });
              },
              tabs: <Widget>[
                Tab(
                  child: Container(
                    child: Text('Welcome to Rafiki!!',
                        style: TextStyle(color: Colors.yellow, fontSize: 16.0)),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Text(
                      'Home & Living',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Text(
                      'Art & Collectables',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Text(
                      'Jewellery & Accessories',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Text(
                      'Clothes & Footware',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Text(
                      'Gift & Occassion Ideas',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Text(
                      'Decors',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Text(
                      'Favourite Collections ',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Text(
                      'Media & Entertainment',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          drawer: Drawer(
            elevation: 16,
            child: ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text('Username'),
                  accountEmail: Text('email.something.com'),
                  currentAccountPicture: GestureDetector(
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(color: AppColors.darkblue),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: ListTile(
                    title: Text(
                      'Home Page',
                    ),
                    leading: Icon(Icons.home),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: ListTile(
                    title: Text('My account'),
                    leading: Icon(Icons.person),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    title: Text('My Orders'),
                    leading: Icon(Icons.shopping_basket),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    title: Text('Shopping Cart'),
                    leading: Icon(Icons.shopping_cart),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    title: Text('Favourites'),
                    leading: Icon(Icons.favorite),
                  ),
                ),
                Divider(),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Settings()));
                  },
                  child: ListTile(
                    title: Text('Settings'),
                    leading: Icon(
                      Icons.settings,
                      color: Colors.grey,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => About()));
                  },
                  child: ListTile(
                    title: Text('About'),
                    leading: Icon(
                      Icons.help,
                      color: Colors.green,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    title: Text('Log out'),
                    leading: Icon(
                      Icons.transit_enterexit,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              HomeScreen(),
              HomeView(0xff9c27b0),
              ArtView(0xff9c27b0),
              Accessories(0xff9c27b0),
              Clothes(0xff9c27b0),
              GiftIdeas(0xff9c27b0),
              Decors(0xff9c27b0),
              EverydayFavourites(0xff9c27b0),
              Entertainment(0xff9c27b0),
            ],
          )),
    );
  }
}
