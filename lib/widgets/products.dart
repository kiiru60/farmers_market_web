import 'package:farmers_market_web/blocs/auth_bloc.dart';
import 'package:farmers_market_web/blocs/product_bloc.dart';
import 'package:farmers_market_web/models/product.dart';
import 'package:farmers_market_web/screens/add_product.dart';
import 'package:farmers_market_web/sections/bottom_navigator.dart';
import 'package:farmers_market_web/sections/footer.dart';
import 'package:farmers_market_web/styles/colors.dart';
import 'package:farmers_market_web/styles/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../cards/card.dart';

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var productBloc = Provider.of<ProductBloc>(context);
    var authBloc = Provider.of<AuthBloc>(context);
    return SingleChildScrollView(
        child: pageBody(productBloc, context, authBloc.userId));
  }

  Widget pageBody(
      ProductBloc productBloc, BuildContext context, String vendorId) {
    return StreamBuilder<List<Product>>(
        stream: productBloc.productByVendorId(vendorId),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();

          return Column(
            children: <Widget>[
              SizedBox(height: 10),
              Container(
                height: 100,
                //color: Colors.white,
                child: Text('Products',
                    style: TextStyles.subtitle, textAlign: TextAlign.center),
              ),
              //container staring the the beggining
              Container(
                height: 500,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      var product = snapshot.data[index];
                      return GestureDetector(
                        child: AppCard(
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
              GestureDetector(
                  child: FloatingActionButton(
                      //shape: RoundedRectangleBorder(),
                      tooltip: 'Add product',
                      backgroundColor: AppColors.orange,
                      child: Icon(Icons.add),
                      onPressed: () => Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return AddProduct();
                          })))),
              //container traced to the end
              SizedBox(
                height: 10,
              ),
              Container(
                height: 450,
                color: AppColors.darkblue,
                child: BottomNavigator(),
              ),
              //create a container
              Container(
                height: 70,
                color: AppColors.darkgreen,
                child: Footer(),
              ),
            ],
          );
    });
  }
}
