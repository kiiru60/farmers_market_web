import 'package:farmers_market_web/styles/colors.dart';
import 'package:flutter/material.dart';

class OpenFlutterButton extends StatelessWidget {
  final double width;
  final double height;
  final Function onPressed;
  final String title;
  final IconData icon;
  final double iconSize;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;

  OpenFlutterButton({
    Key key,
    this.width,
    this.height,
    @required this.title,
    @required this.onPressed,
    this.icon,
    this.backgroundColor = Colors.red,
    this.textColor = Colors.white,
    this.borderColor = Colors.red,
    this.iconSize = 18.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    EdgeInsetsGeometry edgeInsets = EdgeInsets.all(0);
    if (width == null || height == null) {
      edgeInsets = EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0);
    }
    return Padding(
      padding: edgeInsets,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: width,
          height: height,
          padding: edgeInsets,
          decoration: BoxDecoration(
              color: backgroundColor,
              border: Border.all(color: borderColor),
              borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
              boxShadow: [
                BoxShadow(
                    color: backgroundColor.withOpacity(0.3),
                    blurRadius: 4.0,
                    offset: Offset(0.0, 5.0)),
              ]),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildIcon(_theme),
                _buildTitle(_theme),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(ThemeData _theme) {
    return Text(
      title,
      style: _theme.textTheme.button.copyWith(
        backgroundColor: _theme.textTheme.button.backgroundColor,
        color: textColor,
      ),
    );
  }

  Widget _buildIcon(ThemeData theme) {
    if (icon != null) {
      return Padding(
        padding: const EdgeInsets.only(
          right: 8.0,
        ),
        child: Icon(
          icon,
          size: iconSize,
          color: theme.textTheme.button.color,
        ),
      );
    }

    return SizedBox();
  }
}
