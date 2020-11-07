import 'package:farmers_market_web/styles/base.dart';
import 'package:farmers_market_web/styles/colors.dart';
import 'package:farmers_market_web/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppCard extends StatelessWidget {
  final String productName;
  final String unitType;
  final int availableUnits;
  final double price;
  final String note;
  final String imageUrl;
  final formatCurrency = NumberFormat.simpleCurrency();

  AppCard({
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
      padding: BaseStyles.listPadding,
      decoration: BoxDecoration(
          boxShadow: BaseStyles.boxShadow,
          color: Colors.white,
          border: Border.all(
            color: AppColors.darkblue,
            width: BaseStyles.borderWidth,
          ),
          borderRadius: BorderRadius.circular(BaseStyles.borderRadius)),
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
                    : Image.asset(
                        'assets/images/shoe.jpg',
                        height: 200.0,
                        width: 200,
                      ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(productName, style: TextStyles.cardtext),
              Text('${formatCurrency.format(price)}/Unit',
                  style: TextStyles.body),
              Text('Category: $unitType', style: TextStyles.body),
              (availableUnits > 0)
                  ? Text('Currently Available: $availableUnits',
                      style: TextStyles.bodyLightGreen)
                  : Text('Currently Unavailable', style: TextStyles.bodyRed)
            ],
          ),
          Text(
            'Product Details',
            style: TextStyles.navTitle,
          ),
          Text(note, style: TextStyles.body),
        ],
      ),
    );
  }
}
