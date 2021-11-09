import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../ui_helper.dart';

class PearLogin extends StatefulWidget {
  @override
  _PearLoginState createState() => _PearLoginState();
}

class _PearLoginState extends State<PearLogin> {
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
      backgroundColor: UIHelper.PEAR_PRIMARY_COLOR,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 100, 25, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(child: headerIcon),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Powered By Company1',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              // _helloText,
              // _description,
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                          child: TextField(
                            focusNode: _emailFocusNode,
                            onEditingComplete: () => FocusScope.of(context)
                                .requestFocus(_passwordFocusNode),
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.left,
                            obscureText: false,
                            autocorrect: false,
                            cursorColor: Colors.white,
                            maxLines: 1,
                            decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: IconButton(
                                  icon: Icon(Icons.email),
                                  color: Colors.white,
                                  onPressed: () {},
                                ),
                              ),
                              hintText: UIHelper.password,
                              hintStyle: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                          child: TextField(
                            focusNode: _passwordFocusNode,
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.left,
                            obscureText: true,
                            autocorrect: false,
                            cursorColor: Colors.white,
                            maxLines: 1,
                            decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: IconButton(
                                  icon: Icon(Icons.lock),
                                  color: Colors.white,
                                  onPressed: () {},
                                ),
                              ),
                              hintText: UIHelper.password,
                              hintStyle: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              _forgetPassword,
              _loginButton,
            ],
          ),
        ),
      ),
    );
  }

  Widget get _loginButton => Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: InkWell(
          borderRadius: _loginButtonBorderStyle,
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: _loginButtonBorderStyle),
            height: UIHelper.dynamicHeight(100),
            width: UIHelper.dynamicWidth(100),
            child: Center(
              child: Text(
                UIHelper.signIn.toUpperCase(),
                style: TextStyle(
                  color: UIHelper.PEAR_PRIMARY_COLOR,
                  fontSize: UIHelper.dynamicSp(40),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      );
  //Widget get _helloText => Text(UIHelper.hello, style: _helloTextStyle(70));
  Widget get headerIcon => Image.asset(
        UIHelper.monero,
        height: 100,
        width: 90,
      );

  // Widget get _description {
  //   return Text(UIHelper.signAccount, style: _helloTextStyle(30));
  // }
  Widget get _forgetPassword => Align(
        alignment: Alignment.centerLeft,
        child: Padding(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: SizedBox(
              height: 50,
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(50.0)),
                ),
                onPressed: () {},
                child: Text(UIHelper.forgetPassword,
                    style: TextStyle(fontSize: 15, color: Colors.white)),
              ),
            )),
      );
}

BorderRadius get _loginButtonBorderStyle => BorderRadius.only(
      bottomRight: Radius.circular(80),
      topRight: Radius.circular(80),
    );

// TextStyle _helloTextStyle(double fontSize) => TextStyle(
//       color: Colors.white,
//       fontSize: UIHelper.dynamicSp(fontSize),
//       fontWeight: FontWeight.bold,
//     );
