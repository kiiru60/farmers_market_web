import 'package:farmers_market_web/styles/base.dart';
import 'package:farmers_market_web/styles/buttons.dart';
import 'package:farmers_market_web/styles/colors.dart';
import 'package:farmers_market_web/styles/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDropdownButton extends StatelessWidget {
  final List<String> items;
  final String hintText;
  final IconData materialIcon;
  final IconData cupertinoIcon;
  final String value;
  final Function(String) onChanged;

  AppDropdownButton(
      {@required this.items,
      @required this.hintText,
      this.materialIcon,
      this.cupertinoIcon,
      this.value,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: BaseStyles.listPadding,
      child: Container(
        height: ButtonStyles.buttonHeight,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(BaseStyles.borderRadius),
            border: Border.all(
                color: AppColors.straw, width: BaseStyles.borderWidth)),
        child: Row(
          children: <Widget>[
            Container(width: 35.0, child: BaseStyles.iconPrefix(materialIcon)),
            Expanded(
              child: Center(
                child: DropdownButton<String>(
                  items: buildMaterialItems(items),
                  value: value,
                  hint: Text(hintText, style: TextStyles.suggestion),
                  style: TextStyles.body,
                  underline: Container(),
                  iconEnabledColor: AppColors.straw,
                  onChanged: (value) => onChanged(value),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> buildMaterialItems(List<String> items) {
    return items
        .map((item) => DropdownMenuItem<String>(
              child: Text(
                item,
                textAlign: TextAlign.center,
              ),
              value: item,
            ))
        .toList();
  }
}
