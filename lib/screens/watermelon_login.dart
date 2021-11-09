import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_catalog/widgets%20copy/forgetPassButton_widget.dart';

import '../ui_helper.dart';

class WatermelonLogin extends StatefulWidget {
  @override
  _WatermelonLoginState createState() => _WatermelonLoginState();
}

class _WatermelonLoginState extends State<WatermelonLogin> {
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  @override
  void dispose() {
    passwordFocusNode.dispose();
    emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(maxHeight: MediaQuery.of(context).size.height * .35));
    return Scaffold(
      body: Container(
        color: UIHelper.WATERMELON_PRIMARY_COLOR,
        child: Column(
          children: <Widget>[_topBar, _bottomBar],
        ),
      ),
    );
  }

  Widget get _topBar => Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 50, 10, 50),
              child: Image.asset(
                UIHelper.monero,
                height: 100,
                width: 90,
              ),
              // child: Text(
              //   UIHelper.signInLower,
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: UIHelper.dynamicSp(170),
              //     fontWeight: FontWeight.w200,
              //   ),
              // ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Powered By Company1',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      );
  Widget get _bottomBar => Expanded(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60), topRight: Radius.circular(60))),
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    UIHelper.hello,
                    style: TextStyle(
                        fontSize: UIHelper.dynamicSp(70),
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1),
                  ),
                  new Text("Sign in to continue"),
                  _emailTextField(false),
                  _passTextField(true),
                  new ForgetPasswordButton(
                    color: UIHelper.WATERMELON_PRIMARY_COLOR,
                    rightPadding: 0,
                  ),
                  _loginButton,
                ],
              ),
            ),
          ),
        ),
      );

  void oncomplete() => FocusScope.of(context).requestFocus(passwordFocusNode);

  Widget _emailTextField(
    bool obscure,
  ) =>
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
        child: TextField(
          focusNode: emailFocusNode,
          onEditingComplete: oncomplete,
          style: TextStyle(color: Colors.grey),
          textAlign: TextAlign.left,
          obscureText: obscure,
          autocorrect: false,
          cursorColor: Colors.grey,
          maxLines: 1,
          decoration: InputDecoration(
            border: new UnderlineInputBorder(
                borderSide: new BorderSide(color: Colors.grey)),
            hintText: UIHelper.username,
            hintStyle: TextStyle(color: Colors.grey),
          ),
        ),
      );
  Widget _passTextField(bool obscure) => Padding(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
        child: TextField(
          focusNode: passwordFocusNode,
          //onEditingComplete: oncomplete,
          style: TextStyle(color: Colors.grey),
          textAlign: TextAlign.left,
          obscureText: obscure,
          autocorrect: false,
          cursorColor: Colors.grey,
          maxLines: 1,
          decoration: InputDecoration(
            border: new UnderlineInputBorder(
                borderSide: new BorderSide(color: Colors.grey)),
            hintText: UIHelper.password,
            hintStyle: TextStyle(color: Colors.grey),
          ),
        ),
      );

  Widget get _loginButton => Center(
        child: Padding(
            padding: EdgeInsets.only(top: 70),
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: UIHelper.WATERMELON_SHADOW,
                      blurRadius:
                          10.0, // has the effect of softening the shadow
                      spreadRadius:
                          1.0, // has the effect of extending the shadow
                      offset: Offset(
                        0.0, // horizontal, move right 10
                        5.0, // vertical, move down 10
                      ),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: UIHelper.WATERMELON_PRIMARY_COLOR,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(50.0)),
                  ),
                  onPressed: () {},
                  child: Text(
                    UIHelper.signInLower,
                    style: TextStyle(
                        fontSize: 20, color: UIHelper.SPOTIFY_TEXT_COLOR),
                  ),
                ),
              ),
            )),
      );
}
