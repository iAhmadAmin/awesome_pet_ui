import 'package:awesome_pet/constants.dart';
import 'package:awesome_pet/pages/home.dart';
import 'package:awesome_pet/pages/nav_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: "Poppins",
          primaryColor: greyColor,
          scaffoldBackgroundColor: greyColor),
      home: NavPage(),
    );
  }
}
