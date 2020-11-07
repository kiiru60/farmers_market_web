import 'package:farmers_market_web/customerWidgets/products_customer.dart';
import 'package:farmers_market_web/screens/signup.dart';
import 'package:farmers_market_web/sections/bottom_navigator.dart';
import 'package:farmers_market_web/sections/footer.dart';
import 'package:farmers_market_web/sections/menu.dart';
import 'package:farmers_market_web/widgets/popular_products.dart';
import 'package:flutter/material.dart';
import 'package:farmers_market_web/styles/colors.dart';
import 'package:farmers_market_web/styles/text.dart';
import 'package:universal_html/html.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      //The body of the home screen
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Menu(),
            //popular products
            PopularProducts(),
            //slogan container
            Container(
              height: 120,
              color: Colors.orange[100],
              child: Center(
                child: Text(
                  'Suprise yourself and get a Product at Afritisan',
                  style: TextStyles.body,
                ),
              ),
            ),
            PopularProducts(),
            Container(
              height: 420,
              color: AppColors.lightgray,
            ),
            Container(
              height: 420,
              color: AppColors.lightgray,
            ),
            Container(
                height: 100,
                color: AppColors.white,
                child: Center(
                    child: Column(
                  children: [
                    Text('Create account for a personalized experince'),
                    FlatButton(
                      color: Colors.orange,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Signup();
                        }));
                      },
                      child: Text(
                        "Create Account",
                        style: TextStyle(color: AppColors.darkblue),
                      ),
                    ),
                  ],
                ))),

            //bottom container
            Container(
              height: 420,
              //width: screenSize.width,
              //color: AppColors.darkblue,
              child: BottomNavigator(),
            ),
            Container(
              height: 70,
              //width: screenSize.width / 4,
              color: AppColors.darkgreen,
              child: Footer(),
            ),
          ],
        ),
      ),
    );
  }
}
