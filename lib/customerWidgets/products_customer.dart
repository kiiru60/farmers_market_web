import 'package:farmers_market_web/blocs/client_bloc.dart';
import 'package:farmers_market_web/models/product.dart';
import 'package:farmers_market_web/styles/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ProductsCustomer extends StatelessWidget {
  final formatCurrency = NumberFormat.simpleCurrency();

  @override
  Widget build(BuildContext context) {
    var customerBloc = Provider.of<ClientBloc>(context);

    return StreamBuilder<List<Product>>(
        stream: customerBloc.fetchAvailableProducts,
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );

          return Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        var product = snapshot.data[index];

                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRect(
                                child: (product.imageUrl != '')
                                    ? NetworkImage(product.imageUrl)
                                    : AssetImage('assets/images/shoe.png'),
                              ),
                            ),
                            Column(
                              children: [
                                Text(product.productName,
                                    style: TextStyles.body),
                                Text('The Vendor'),
                                Text(
                                    '${formatCurrency.format(product.unitPrice)}/${product.unitType}',
                                    style: TextStyles.bodyLightBlue),
                              ],
                            )
                          ],
                        );
                      }),
                )
              ],
            ),
          );
        });
  }
}
