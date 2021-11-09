import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_catalog/utils/config.dart';
import 'package:login_catalog/widgets/constants.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 60),
              color: Color(0xFFfafafa),
              width: double.infinity,
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only()),
                  SizedBox(height: SizeConfig.blockSizeVertical * 3),
                  Center(
                    child: Image.asset(
                      UIGuide.logoUn,
                      height: SizeConfig.blockSizeVertical * 12,
                      width: SizeConfig.blockSizeHorizontal * 100,
                    ),
                  ),
                  SizedBox(height: SizeConfig.blockSizeVertical * 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "Sign In",
                        style: GoogleFonts.poppins(
                          fontSize: 30,
                          color: Color(0xff07446C),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.blockSizeVertical * 0.5),
                  SizedBox(height: SizeConfig.blockSizeVertical * 0.5),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(40),
              padding: EdgeInsets.only(top: 275, left: 5, right: 5),
              child: Column(children: [
                TextField(
                  onEditingComplete: () =>
                      FocusScope.of(context).requestFocus(_passwordFocusNode),
                  focusNode: _emailFocusNode,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                        color: Color(0xff85B634),
                        size: 20,
                      ),
                      focusColor: Color(0xff757575),
                      hintText: "Email Address",
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey))),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 30),
                TextField(
                  focusNode: _passwordFocusNode,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        FontAwesomeIcons.eyeSlash,
                        color: Color(0xff85B634),
                        size: 20,
                      ),
                      hintText: "Password",
                      fillColor: Color(0xff757575),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey))),
                  obscureText: true,
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Forgot Password?",
                      style: GoogleFonts.roboto(
                          fontSize: 20,
                          color: Color(0xff757575),
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(height: 70),
                _signinbtn(),
                SizedBox(height: 22),
                FittedBox(child: _signup()),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _signup() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Powered By",
        style: GoogleFonts.poppins(fontSize: 20, color: Color(0xff757575)),
      ),
      InkWell(
        child: Text(
          " company",
          style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xff07446C)),
        ),
        onTap: () {},
      )
    ],
  );
}

Widget _signinbtn() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0xff07446C),
          padding: EdgeInsets.symmetric(horizontal: 35),
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          ),
        ),
        onPressed: () => {},
        child: Text(
          "Sign In",
          style: GoogleFonts.montserrat(
              fontSize: 23,
              color: Colors.white,
              letterSpacing: 0.168,
              fontWeight: FontWeight.w500),
        ),
      ),
    ],
  );
}
