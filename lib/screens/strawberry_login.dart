import 'package:flutter/material.dart';
import 'package:login_catalog/widgets%20copy/forgetPassButton_widget.dart';

import '../ui_helper.dart';

class StrawberryLogin extends StatefulWidget {
  @override
  _StrawberryLoginState createState() => _StrawberryLoginState();
}

class _StrawberryLoginState extends State<StrawberryLogin> {
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
    return Scaffold(
      backgroundColor: UIHelper.CHERRY_PRIMARY_COLOR,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * .15,
              ),
              Image.asset(
                UIHelper.monero,
                height: 100,
                width: 80,
              ),
              Text(
                UIHelper.signInLower,
                style: TextStyle(color: UIHelper.WHITE, fontSize: 40),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 70, 50, 10),
                child: TextField(
                  focusNode: _emailFocusNode,
                  onEditingComplete: () =>
                      FocusScope.of(context).requestFocus(_passwordFocusNode),
                  style: TextStyle(color: UIHelper.WHITE),
                  textAlign: TextAlign.left,
                  obscureText: false,
                  autocorrect: false,
                  cursorColor: UIHelper.WHITE,
                  maxLines: 1,
                  decoration: InputDecoration(
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Icon(
                        Icons.person,
                        color: UIHelper.WHITE,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white54,
                    //fillColor: UIHelper.STRAWBERRY_SECONDARY_COLOR,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                            color: UIHelper.STRAWBERRY_SECONDARY_COLOR,
                            width: 2)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                            color: UIHelper.STRAWBERRY_SECONDARY_COLOR,
                            width: 2)),
                    hintText: UIHelper.username,
                    contentPadding: const EdgeInsets.fromLTRB(25, 20, 25, 20),
                    hintStyle: TextStyle(
                        color: UIHelper.WHITE, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 30, 50, 10),
                child: TextField(
                  focusNode: _passwordFocusNode,
                  // onEditingComplete: ,
                  style: TextStyle(color: UIHelper.WHITE),
                  textAlign: TextAlign.left,
                  obscureText: false,
                  autocorrect: false,
                  cursorColor: UIHelper.WHITE,
                  maxLines: 1,
                  decoration: InputDecoration(
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Icon(
                        Icons.remove_red_eye,
                        color: UIHelper.WHITE,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white54,
                    //fillColor: UIHelper.STRAWBERRY_SECONDARY_COLOR,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                            color: UIHelper.STRAWBERRY_SECONDARY_COLOR,
                            width: 2)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                            color: UIHelper.STRAWBERRY_SECONDARY_COLOR,
                            width: 2)),
                    hintText: UIHelper.password,
                    contentPadding: const EdgeInsets.fromLTRB(25, 20, 25, 20),
                    hintStyle: TextStyle(
                        color: UIHelper.WHITE, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              new ForgetPasswordButton(
                color: UIHelper.WHITE,
                rightPadding: 30,
              ),
              _loginButton,
            ],
          ),
        ),
      ),
    );
  }

  Widget get _loginButton => Padding(
        padding: const EdgeInsets.fromLTRB(50, 30, 50, 10),
        child: MaterialButton(
          height: 56,
          minWidth: double.infinity,
          color: UIHelper.WHITE,
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(20.0)),
          onPressed: () {},
          child: Text(
            UIHelper.login,
            style: TextStyle(
                fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      );
}
