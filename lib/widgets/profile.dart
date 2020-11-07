import 'package:farmers_market_web/blocs/auth_bloc.dart';
import 'package:farmers_market_web/blocs/product_bloc.dart';
import 'package:farmers_market_web/sections/bottom_navigator.dart';
import 'package:farmers_market_web/sections/footer.dart';
import 'package:farmers_market_web/styles/colors.dart';
import 'package:farmers_market_web/vendorWidgets/about.dart';
import 'package:farmers_market_web/vendorWidgets/account.dart';
import 'package:farmers_market_web/vendorWidgets/favorites.dart';
import 'package:farmers_market_web/vendorWidgets/setttings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var productBloc = Provider.of<ProductBloc>(context);
    var authBloc = Provider.of<AuthBloc>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 620,
              color: Colors.white,
              child: pageBody(context),
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

  Widget pageBody(BuildContext context) {
    var authBloc = Provider.of<AuthBloc>(context);
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Account()));
            },
            child: ListTile(
              title: Text('My account'),
              leading: Icon(Icons.person),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text('Fulfilled Orders'),
              leading: Icon(Icons.shopping_basket),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text('Unfulfilled Orders'),
              leading: Icon(Icons.shopping_cart),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Favourites()));
            },
            child: ListTile(
              title: Text('Favourites'),
              leading: Icon(Icons.favorite),
            ),
          ),
          Divider(),
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Settings()));
            },
            child: ListTile(
              title: Text('Settings'),
              leading: Icon(
                Icons.settings,
                color: Colors.blue,
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
            onTap: () => authBloc.logout(),
            child: ListTile(
              title: Text('Log out'),
              leading: Icon(
                Icons.transit_enterexit,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
