import 'package:awesome_pet/constants.dart';
import 'package:awesome_pet/pages/home.dart';
import 'package:awesome_pet/size_config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavPage extends StatefulWidget {
  @override
  _NavPageState createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int selectedTab = 0;

  final List<Widget> _screens = [
    HomePage(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: _screens[selectedTab],
        ),
        _buildBottomNavBar(),
      ],
    ));
  }

  _buildBottomNavBar() {
    return Container(
      height: 60.0,
      width: SizeConfig.screenWidth,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildBottomNavBtn(
            onTap: () {
              setState(() {
                selectedTab = 0;
              });
            },
            isSelected: selectedTab == 0 ? true : false,
            icon: Icons.home,
          ),
          _buildBottomNavBtn(
            isSelected: selectedTab == 1 ? true : false,
            icon: Icons.chat,
            onTap: () {
              setState(() {
                selectedTab = 1;
              });
            },
          ),
          _buildBottomNavBtn(
            isSelected: selectedTab == 2 ? true : false,
            icon: FontAwesomeIcons.heart,
            onTap: () {
              setState(() {
                selectedTab = 2;
              });
            },
          ),
          _buildBottomNavBtn(
            isSelected: selectedTab == 3 ? true : false,
            icon: Icons.person,
            onTap: () {
              setState(() {
                selectedTab = 3;
              });
            },
          ),
        ],
      ),
    );
  }

  _buildBottomNavBtn({IconData icon, isSelected, Function onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Icon(icon,
            size: 30.0, color: isSelected ? primaryColor : greyColor),
      ),
    );
  }
}
