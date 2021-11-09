import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_catalog/styles/text_styles.dart';
import 'package:login_catalog/widgets%20copy/button_widgets.dart';
import 'package:login_catalog/widgets%20copy/forgetPassButton_widget.dart';
import 'package:login_catalog/widgets%20copy/textField_widget.dart';

import '../ui_helper.dart';

class MuzLogin extends StatefulWidget {
  @override
  _MuzLoginState createState() => _MuzLoginState();
}

class _MuzLoginState extends State<MuzLogin> {
  bool hiddentText = true;

  void _toggleVisibility() {
    setState(() {
      hiddentText = !hiddentText;
    });
  }

  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(maxHeight: MediaQuery.of(context).size.height * .35));
    return Scaffold(
      backgroundColor: UIHelper.MUZ_BACKGROUND_COLOR,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: <Widget>[
            _topBar,
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: true,
                    focusNode: _emailFocusNode,
                    onEditingComplete: () =>
                        FocusScope.of(context).requestFocus(_passwordFocusNode),
                    obscureText: false,
                    style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0),
                    decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: Icon(Icons.email),
                        ),
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        labelText: 'Email',
                        hintStyle: TextStyle(color: UIHelper.MUZ_TEXT_COLOR),
                        border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
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
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        labelText: 'Password',
                        hintStyle: TextStyle(color: UIHelper.MUZ_TEXT_COLOR),
                        border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0))),
                  ),
                ),
                new ButtonWidget(
                  color: UIHelper.MUZ_PRIMARY_COLOR,
                  shadow: UIHelper.MUZ_BUTTONSHADOW,
                  text: UIHelper.signUp,
                  topPadding: 70,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('Forgot Password'),
                ),
              ],
            ),
            SizedBox(
              height: 70,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Powered By Company1',
                    style: TextStyle(color: Colors.black),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _topBar => Container(
      height: UIHelper.dynamicHeight(650),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: UIHelper.MUZ_SHADOW,
                blurRadius: 10.0, // has the effect of softening the shadow
                spreadRadius: 1.0, // has the effect of extending the shadow
                offset: Offset(
                  3.0, // horizontal, move right 10
                  3.0, // vertical, move down 10
                )),
          ],
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(UIHelper.dynamicWidth(150)),
              bottomRight: Radius.circular(UIHelper.dynamicWidth(150))),
          color: UIHelper.MUZ_PRIMARY_COLOR),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              UIHelper.monero,
              width: 80,
              height: 90,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(UIHelper.welcomeBack,
              style: TextStyle(fontSize: 30, color: Colors.white)),
        ],
      ));

  Widget get _signUpButton => Center(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(50.0)),
                onPressed: () {},
                child: Text(
                  UIHelper.signUp,
                  style: TextStyle(
                      fontSize: 20, color: UIHelper.MUZ_PRIMARY_COLOR),
                ),
              ),
            )),
      );
}
