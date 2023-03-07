import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twitter_clone/constants/constants.dart';
import 'package:twitter_clone/theme/pallete.dart';

class UiConstants {
  static AppBar appBar() {
    return AppBar(
        centerTitle: true,
        title: SvgPicture.asset(
          AssetsConstants.twitterLogo,
          color: Pallete.blueColor,
        ));
  }

  static List<Widget> bottomTabBarPages = [
    Text("data 1"),
    Text("data 2"),
    Text("data 3"),
  ];
}
