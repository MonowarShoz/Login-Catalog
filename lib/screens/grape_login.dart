import 'package:flutter/material.dart';

import '../ui_helper.dart';

bool _value = false;

class GrapeLogin extends StatefulWidget {
  @override
  _GrapeLoginState createState() => _GrapeLoginState();
}

class _GrapeLoginState extends State<GrapeLogin> {
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
      backgroundColor: UIHelper.WHITE,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * .1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Image.asset(
                UIHelper.monero,
                height: 100,
                width: 90,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 100, 0, 0),
              child: Text(
                "Sign In",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            _emailTextField,
            _passTextField,
            _keepLogin,
            _loginButton,
          ],
        ),
      ),
    );
  }

  Widget get _emailTextField => Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: TextField(
          focusNode: _emailFocusNode,
          onEditingComplete: oncomplete,
          obscureText: false,
          decoration: new InputDecoration(
            focusedBorder: new OutlineInputBorder(
              borderSide: new BorderSide(color: Color(0xFF5ABD8C), width: 2),
              borderRadius: const BorderRadius.all(
                const Radius.circular(20.0),
              ),
            ),
            enabledBorder: new OutlineInputBorder(
              borderSide: new BorderSide(color: Color(0x80EFEFEF), width: 2),
              borderRadius: const BorderRadius.all(
                const Radius.circular(20.0),
              ),
            ),
            filled: true,
            hintStyle: new TextStyle(color: Color(0x75000000)),
            hintText: 'Email Address',
          ),
        ),
      );
  Widget get _passTextField => Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: TextField(
          focusNode: _passwordFocusNode,
          obscureText: true,
          decoration: new InputDecoration(
            focusedBorder: new OutlineInputBorder(
              borderSide: new BorderSide(color: Color(0xFF5ABD8C), width: 2),
              borderRadius: const BorderRadius.all(
                const Radius.circular(20.0),
              ),
            ),
            enabledBorder: new OutlineInputBorder(
              borderSide: new BorderSide(color: Color(0x80EFEFEF), width: 2),
              borderRadius: const BorderRadius.all(
                const Radius.circular(20.0),
              ),
            ),
            filled: true,
            hintStyle: new TextStyle(color: Color(0x75000000)),
            hintText: 'Password',
          ),
        ),
      );

  void oncomplete() => FocusScope.of(context).requestFocus(_passwordFocusNode);
  Widget get _keepLogin => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Checkbox(
                checkColor: Color(0xFFFFFFFF),
                activeColor: Color(0xFF5ABD8C),
                onChanged: (value) {
                  setState(() {
                    _value = value;
                  });
                },
                value: _value),
            Text(UIHelper.stayLoggedIn,
                style: TextStyle(
                    color: Color(0x50212121), fontWeight: FontWeight.w300)),
          ],
        ),
      );
  Widget get _loginButton => Padding(
      padding: const EdgeInsets.all(20),
      child: MaterialButton(
        height: 56,
        minWidth: double.infinity,
        color: Color(0xFF5ABD8C),
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(20.0)),
        onPressed: () {},
        child: Text(
          "Sign In",
          style: TextStyle(fontSize: 15, color: Colors.white),
        ),
      ));
}
