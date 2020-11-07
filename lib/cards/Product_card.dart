import 'package:farmers_market_web/styles/base.dart';
import 'package:farmers_market_web/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductCard extends StatelessWidget {
  final String productName;
  final String unitType;
  final int availableUnits;
  final double price;
  final String note;
  final String imageUrl;
  final formatCurrency = NumberFormat.simpleCurrency();

  ProductCard({
    @required this.productName,
    @required this.unitType,
    @required this.availableUnits,
    @required this.price,
    this.note = "",
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      margin: BaseStyles.listPadding,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.only(right: 2.0, bottom: 2.0, top: 2.0),
                child: (imageUrl != null && imageUrl != "")
                    ? ClipRRect(
                        child: Image.network(
                          imageUrl,
                          height: 200.0,
                          width: 200,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      )
                    : ClipRRect(
                        child: Image.asset(
                          'assets/images/shoe.jpg',
                          height: 200.0,
                          width: 200,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(productName, style: TextStyles.frontcardtext),
              Text('${formatCurrency.format(price)}/Unit',
                  style: TextStyles.bodyLightGreen),
              Text('$unitType', style: TextStyles.body),
              (availableUnits > 0)
                  ? Text('Currently Available: $availableUnits',
                      style: TextStyles.bodyLightGreen)
                  : Text('Currently Unavailable', style: TextStyles.bodyRed)
            ],
          ),
        ],
      ),
    );
  }
}
