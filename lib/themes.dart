import 'package:awesome_pet/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Themes {
  static final light = ThemeData(
      backgroundColor: Colors.grey[100],
      primaryColor: primaryColor,
      brightness: Brightness.light,
      textTheme: TextTheme(
        headline5: TextStyle(),
      ),
      fontFamily: "Poppins");
  static final dark = ThemeData(
      backgroundColor: darkGreyColor,
      brightness: Brightness.dark,
      primaryColor: primaryColor,
      fontFamily: "Poppins");
}

TextStyle get headingTextStyle {
  return TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w600,
      color: Get.isDarkMode ? Colors.white : choclateColor);
}

TextStyle get subHeadingTextStyle {
  return TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w400,
      color: Get.isDarkMode ? Colors.white : choclateColor);
}

TextStyle get titleTextStyle {
  return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Get.isDarkMode ? Colors.white : choclateColor);
}

TextStyle get body2TextStyle {
  return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Get.isDarkMode ? Colors.grey[200] : Colors.black);
}
