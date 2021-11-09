import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_catalog/utils/config.dart';
import 'package:login_catalog/widgets/constants.dart';

class LinkLogin extends StatefulWidget {
  @override
  _LinkLoginState createState() => _LinkLoginState();
}

class _LinkLoginState extends State<LinkLogin> {
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
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 50, horizontal: 30),
              color: Colors.white,
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only()),
                  Center(
                    child: Image.asset(
                      UIGuide.logoUn,
                      //height: SizeConfig.blockSizeVertical! * 20,
                      // width: SizeConfig.blockSizeHorizontal! * 100,
                    ),
                  ),
                  SizedBox(height: SizeConfig.blockSizeVertical * 2),
                  FittedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "Intelligent Creative Partner,",
                          style: GoogleFonts.roboto(
                            fontSize: 25,
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                  // SizedBox(height: SizeConfig.blockSizeVertical! * 0.5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "Welcome!",
                        style: GoogleFonts.roboto(
                          fontSize: 25,
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  // SizedBox(height: SizeConfig.blockSizeVertical! * 3),
                  // _linkimage(),
                  Column(
                    children: [
                      SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: TextField(
                          focusNode: _emailFocusNode,
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(_passwordFocusNode),
                          decoration: InputDecoration(
                              labelText: 'Username',
                              hintText: 'enter your name',
                              isCollapsed: false,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              )),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: TextField(
                          focusNode: _passwordFocusNode,
                          decoration: InputDecoration(
                              labelText: 'Password',
                              hintText: 'enter your password',
                              isCollapsed: false,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              )),
                        ),
                      )
                    ],
                  ),
                  //  SizedBox(height: SizeConfig.blockSizeVertical! * 1.5),
                  _loginbtn(context),
                  //  SizedBox(height: SizeConfig.blockSizeVertical! * 1),
                  _forgotPass(),
                  //  SizedBox(height: SizeConfig.blockSizeVertical! * 7),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _loginbtn(context) {
    // ignore: deprecated_member_use
    return ElevatedButton(
      onPressed: () => {},
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
        padding: EdgeInsets.symmetric(horizontal: 48),
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(15.0),
        ),
      ),
      child: Text(
        "LOGIN",
        style: GoogleFonts.roboto(
            fontSize: 23,
            color: Colors.white,
            letterSpacing: 0.168,
            fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _forgotPass() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            "Forgot Password? ",
            style: GoogleFonts.roboto(
                fontSize: 15, color: Colors.blue, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
