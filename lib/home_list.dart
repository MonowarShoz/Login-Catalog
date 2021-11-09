import 'dart:io';

import 'package:flutter/material.dart';

import 'package:login_catalog/screens/fig.dart';
import 'package:login_catalog/screens/grape_login.dart';

import 'package:login_catalog/screens/linkl.dart';
import 'package:login_catalog/screens/login.dart';
import 'package:login_catalog/screens/muz_login.dart';
import 'package:login_catalog/screens/paer_login.dart';
import 'package:login_catalog/screens/strawberry_login.dart';
import 'package:login_catalog/screens/watermelon_login.dart';
import 'package:login_catalog/ui_helper.dart';
import 'package:login_catalog/widgets/constants.dart';

class HomeList {
  Widget navigateScreen;
  String loginName;

  HomeList({
    this.navigateScreen,
    this.loginName = '',
  });

  static List<HomeList> homeList = [
    HomeList(
      loginName: "assets/images/monero.png",
      navigateScreen: GrapeLogin(),
    ),
    HomeList(
      loginName: "assets/images/monero.png",
      navigateScreen: MuzLogin(),
    ),
    HomeList(
      loginName: "assets/images/monero.png",
      navigateScreen: PearLogin(),
    ),
    HomeList(
      loginName: "assets/images/monero.png",
      navigateScreen: StrawberryLogin(),
    ),
    HomeList(
      loginName: "assets/images/monero.png",
      navigateScreen: WatermelonLogin(),
    ),
  ];
}
