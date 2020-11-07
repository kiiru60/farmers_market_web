import 'package:farmers_market_web/styles/colors.dart';
import 'package:farmers_market_web/widgets/indepedent/block_subtitle.dart';
import 'package:flutter/material.dart';

class FilterSelectableVisibleOption<T> extends StatelessWidget {
  final Map<T, Widget> children;
  final ValueChanged<T> onSelected;
  final String title;

  const FilterSelectableVisibleOption(
      {Key key, this.onSelected, this.children, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        BlockSubtitle(title: title),
        SizedBox(
          height: AppSizes.sidePadding,
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(
              vertical: AppSizes.sidePadding,
              horizontal: AppSizes.sidePadding * 2),
          color: AppColors.white,
          child: Wrap(
            spacing: AppSizes.sidePadding,
            alignment: WrapAlignment.start,
            children: children
                .map((key, widget) => MapEntry(
                    key,
                    InkWell(
                      child: widget,
                      onTap: () {
                        onSelected(key);
                      },
                    )))
                .values
                .toList(growable: false),
          ),
        )
      ],
    );
  }
}
