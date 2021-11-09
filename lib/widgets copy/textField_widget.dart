import 'package:flutter/material.dart';

import '../ui_helper.dart';

class TextFieldWidget extends StatelessWidget {
  final TextInputType textInputType;
  final String labelText;
  final String requiredText;
  final FocusNode emailNode;

  const TextFieldWidget({
    Key key,
    this.textInputType,
    this.labelText,
    this.requiredText,
    this.emailNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: TextFormField(
          keyboardType: textInputType,
          autocorrect: true,
          focusNode: emailNode,
          onEditingComplete: () => FocusScope.of(context).requestFocus(),
          obscureText: false,
          style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              labelText: labelText,
              hintStyle: TextStyle(color: UIHelper.MUZ_TEXT_COLOR),
              border: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0))),
          validator: (value) {
            if (value.trim().isEmpty) return requiredText;
          }),
    );
  }
}

class PasswordFieldWidget extends StatefulWidget {
  final TextInputType textInputType;
  final String labelText;
  final String requiredText;
  final FocusNode passNode;

  const PasswordFieldWidget(
      {Key key,
      this.passNode,
      this.textInputType,
      this.labelText,
      this.requiredText})
      : super(key: key);

  @override
  PasswordFieldWidgetState createState() => PasswordFieldWidgetState();
}

class PasswordFieldWidgetState extends State<PasswordFieldWidget> {
  bool hiddentText = true;

  void _toggleVisibility() {
    setState(() {
      hiddentText = !hiddentText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: TextFormField(
          keyboardType: widget.textInputType,
          autocorrect: false,
          obscureText: hiddentText,
          style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0),
          decoration: InputDecoration(
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: IconButton(
                  icon: hiddentText
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.visibility),
                  onPressed: _toggleVisibility,
                ),
              ),
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              labelText: widget.labelText,
              hintStyle: TextStyle(color: UIHelper.MUZ_TEXT_COLOR),
              border: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0))),
          validator: (value) {
            if (value.trim().isEmpty) return widget.requiredText;
          }),
    );
  }
}
