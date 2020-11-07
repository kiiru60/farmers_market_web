import 'package:farmers_market_web/blocs/product_bloc.dart';
import 'package:farmers_market_web/cards/Product_card.dart';
import 'package:farmers_market_web/models/product.dart';
import 'package:farmers_market_web/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PopularProducts extends StatelessWidget {
  String get unitType => null;
  @override
  Widget build(BuildContext context) {
    var productBloc = Provider.of<ProductBloc>(context);
    return Container(
        height: 365, child: pageBody(productBloc, context, unitType));
  }

  Widget pageBody(
      ProductBloc productBloc, BuildContext context, String unitType) {
    return StreamBuilder<List<Product>>(
        stream: productBloc.fetchProductByCategory(unitType),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();

          return Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Popular Right Now',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => print('See More'),
                      child: Text(
                        'See All',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 320,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      var product = snapshot.data[index];
                      return GestureDetector(
                        child: ProductCard(
                          availableUnits: product.availableUnits,
                          price: product.unitPrice,
                          productName: product.productName,
                          unitType: product.unitType,
                          imageUrl: product.imageUrl,
                        ),
                        onTap: () => Navigator.of(context)
                            .pushNamed('/editproduct/${product.productId}'),
                      );
                    }),
              ),
              //container traced to the end
            ],
          );
        });
  }
}
