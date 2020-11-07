import 'package:farmers_market_web/components/menu_item.dart';
import 'package:farmers_market_web/screens/login.dart';
import 'package:farmers_market_web/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      height: 400,
      color: AppColors.darkblue,
      width: screenSize.width,
      child: SingleChildScrollView(
        //scrollDirection: Axis.horizontal,
        //dragStartBehavior: DragStartBehavior.start,
        child: Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.spaceEvenly,
          crossAxisAlignment: WrapCrossAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    //alignment: AlignmentDirectional.topStart,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'Shop On Rafiki',
                          style: TextStyle(
                            fontSize: 25,
                            color: AppColors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      MenuItem(
                        title: "Amazing Deals?",
                        press: () {},
                      ),
                      MenuItem(
                        title: "Unique Handcrafts",
                        press: () {},
                      ),
                      MenuItem(
                        title: "RafikiMarket Blog",
                        press: () {},
                      ),
                      MenuItem(
                        title: "Know Our Sellers",
                        press: () {},
                      ),
                      MenuItem(
                        title: "Why Us?",
                        press: () {},
                      ),
                    ],
                  )),
            ),
            Container(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      //alignment: AlignmentDirectional.topStart,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            'Sell on Rafiki',
                            style: TextStyle(
                              fontSize: 25,
                              color: AppColors.orange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        MenuItem(
                          title: "Sellers Page",
                          press: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Login()));
                          },
                        ),
                        MenuItem(
                          title: "Sellers Spotlight",
                          press: () {},
                        ),
                        MenuItem(
                          title: "Forums",
                          press: () {},
                        ),
                        MenuItem(
                          title: "Affliates",
                          press: () {},
                        ),
                        MenuItem(
                          title: "Promotions",
                          press: () {},
                        ),
                      ],
                    ))),
            Container(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      //alignment: AlignmentDirectional.topStart,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            'About Us',
                            style: TextStyle(
                              fontSize: 25,
                              color: AppColors.orange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        MenuItem(
                          title: "RafikiMarket.com",
                          press: () {},
                        ),
                        MenuItem(
                          title: "Our Mission",
                          press: () {},
                        ),
                        MenuItem(
                          title: "Impact",
                          press: () {},
                        ),
                        MenuItem(
                          title: "Investors",
                          press: () {},
                        ),
                        MenuItem(
                          title: "Careers",
                          press: () {},
                        ),
                      ],
                    ))),
            Container(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      //alignment: AlignmentDirectional.topStart,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            'Help Center',
                            style: TextStyle(
                              fontSize: 25,
                              color: AppColors.orange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        MenuItem(
                          title: "Your Account",
                          press: () {},
                        ),
                        MenuItem(
                          title: "Your Orders",
                          press: () {},
                        ),
                        MenuItem(
                          title: "Shipping Policies",
                          press: () {},
                        ),
                        MenuItem(
                          title: "Customer Care",
                          press: () {},
                        ),
                        MenuItem(
                          title: "Help",
                          press: () {},
                        ),
                      ],
                    ))),
          ],
        ),
      ),
    );
  }
}
