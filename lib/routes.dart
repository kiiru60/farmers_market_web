import 'package:farmers_market_web/screens/edit_product.dart';
import 'package:farmers_market_web/screens/HomeScreen.dart';
import 'package:farmers_market_web/screens/login.dart';
import 'package:farmers_market_web/screens/signup.dart';
import 'package:farmers_market_web/screens/vendor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class Routes {
  static MaterialPageRoute materialRoutes(RouteSettings settings) {
    switch (settings.name) {
      case "/homescreen":
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case "/signup":
        return MaterialPageRoute(builder: (context) => Signup());
      case "/login":
        return MaterialPageRoute(builder: (context) => Login());
      case "/vendor":
        return MaterialPageRoute(builder: (context) => Vendor());
      case "/editproduct":
        return MaterialPageRoute(builder: (context) => EditProduct());
      default:
        var routeArray = settings.name.split('/');
        if (settings.name.contains('/editproduct/')) {
          return MaterialPageRoute(
              builder: (context) => EditProduct(
                    productId: routeArray[2],
                  ));
        }
        return MaterialPageRoute(builder: (context) => Login());
    }
  }
}
