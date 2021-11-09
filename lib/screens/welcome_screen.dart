import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import '../main.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SplashScreenView(
        navigateRoute: Home(),
        duration: 5000,
        imageSize: 130,
        imageSrc: "assets/images/monero.png",
        text: "Powered By Company1",
        textType: TextType.TyperAnimatedText,
        pageRouteTransition: PageRouteTransition.CupertinoPageRoute,
        textStyle: TextStyle(
          fontSize: 20.0,
        ),
      ),
    );
  }
}
