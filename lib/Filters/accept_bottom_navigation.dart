import 'package:farmers_market_web/styles/colors.dart';
import 'package:farmers_market_web/widgets/indepedent/custom_button.dart';
import 'package:flutter/material.dart';

class AcceptBottomNavigation extends StatelessWidget {
  final VoidCallback onApply;

  const AcceptBottomNavigation({Key key, this.onApply}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: AppColors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            child: OpenFlutterButton(
              title: 'Discard',
              onPressed: () {
                Navigator.of(context).pop();
              },
              backgroundColor: AppColors.white,
              borderColor: Colors.black,
              textColor: Colors.black,
            ),
          ),
          Expanded(
            child: OpenFlutterButton(
              title: 'Apply',
              onPressed: onApply,
            ),
          )
        ],
      ),
    );
  }
}
