import 'package:farmers_market_web/styles/textfields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormTextField extends StatefulWidget {
  final String hintText;
  final IconData materialIcon;
  final TextInputType textInputType;
  final bool obscureText;
  final void Function(String) onChanged;
  final String errorText;
  final String initialText;

  FormTextField(
      {@required this.hintText,
      @required this.materialIcon,
      this.textInputType = TextInputType.text,
      this.obscureText = false,
      this.onChanged,
      this.errorText,
      this.initialText});

  @override
  _FormTextFieldState createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  FocusNode _node;
  bool displayCupertinoErrorBorder;
  TextEditingController _controller;

  @override
  void initState() {
    _node = FocusNode();
    _controller = TextEditingController();
    if (widget.initialText != null) _controller.text = widget.initialText;
    _node.addListener(_handleFocusChange);
    displayCupertinoErrorBorder = false;
    super.initState();
  }

  void _handleFocusChange() {
    if (_node.hasFocus == false && widget.errorText != null) {
      displayCupertinoErrorBorder = true;
    } else {
      displayCupertinoErrorBorder = false;
    }

    widget.onChanged(_controller.text);
  }

  @override
  void dispose() {
    _node.removeListener(_handleFocusChange);
    _node.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: TextFieldStyles.textBoxHorizontal,
          vertical: TextFieldStyles.textBoxVertical),
      child: FormBuilderTextField(
        attribute: 'textfield',
        keyboardType: widget.textInputType,
        cursorColor: TextFieldStyles.cursorColor,
        style: TextFieldStyles.text,
        textAlign: TextFieldStyles.textAlign,
        decoration: TextFieldStyles.materialDecoration(
            widget.hintText, widget.materialIcon, widget.errorText),
        obscureText: widget.obscureText,
        controller: _controller,
        onChanged: widget.onChanged,
      ),
    );
  }
}
