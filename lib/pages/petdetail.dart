import 'package:awesome_pet/assets.dart';
import 'package:awesome_pet/constants.dart';
import 'package:awesome_pet/models/newpet.dart';
import 'package:awesome_pet/size_config.dart';
import 'package:awesome_pet/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

class PetDetailPage extends StatelessWidget {
  final Pet pet;
  PetDetailPage({this.pet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        color: context.theme.backgroundColor,
        child: Stack(
          children: [
            _petPicPart(),
            _petInfoPart(),
            _petStoryNBioPart(),
            _ownerPart(),
          ],
        ),
      ),
    );
  }

  _ownerPart() {
    return Positioned(
        bottom: 0,
        child: Container(
          height: SizeConfig.screenHeight * 0.12,
          width: SizeConfig.screenWidth,
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            color: Get.isDarkMode ? liteGreyColor : Colors.white,
            boxShadow: [BoxShadow(color: Colors.black12)],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      Asset.dp,
                      fit: BoxFit.cover,
                    )),
              ),
              SizedBox(width: 6),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Nannie Barker", style: titleTextStyle),
                    Text("Owner", style: body2TextStyle)
                  ]),
              Spacer(),
              Container(
                  height: 40,
                  width: 110,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                      child: Text("Contact Me",
                          style: TextStyle(color: Colors.white)))),
            ],
          ),
        ));
  }

  _petStoryNBioPart() {
    return Positioned(
        bottom: 0,
        child: Container(
            height: SizeConfig.screenHeight * 0.48,
            width: SizeConfig.screenWidth,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            decoration: BoxDecoration(
              color: Get.isDarkMode ? darkGreyColor : greyColor,
              boxShadow: [
                BoxShadow(color: Colors.black12),
              ],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                _buildInforCon(label: "AGE", value: "${pet.age} Year"),
                _buildInforCon(
                    label: "SEX",
                    value: pet.gender == Gender.male ? "Male" : "Female"),
                _buildInforCon(label: "WEIGHT", value: "8.5 kg")
              ]),
              SizedBox(height: getProportionateScreenHeight(14)),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text("Pet Story", style: titleTextStyle),
                SizedBox(height: getProportionateScreenHeight(6)),
                Text(
                  loremIpsum,
                  style: body2TextStyle,
                ),
              ])
            ])));
  }

  _buildInforCon({String label, String value}) {
    return Container(
        height: SizeConfig.screenWidth * 0.15,
        width: SizeConfig.screenWidth * 0.27,
        decoration: BoxDecoration(
            color: Get.isDarkMode ? liteGreyColor : Colors.white,
            borderRadius: BorderRadius.circular(4)),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(label, style: TextStyle(color: Colors.grey, fontSize: 12)),
              Text(value, style: titleTextStyle)
            ]));
  }

  _petInfoPart() {
    return Positioned(
      bottom: 0,
      child: Container(
        height: SizeConfig.screenHeight * 0.65,
        width: SizeConfig.screenWidth,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
        decoration: BoxDecoration(
          color: Get.isDarkMode ? liteGreyColor : Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
            )
          ],
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40),
            topLeft: Radius.circular(40),
          ),
        ),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(pet.petName, style: titleTextStyle),
                Text(
                  pet.petType,
                  style: body2TextStyle,
                )
              ]),
              SizedBox(height: getProportionateScreenHeight(6)),
              Icon(
                pet.gender == Gender.male
                    ? FlutterIcons.male_symbol_fou
                    : FlutterIcons.female_symbol_fou,
                color: pet.gender == Gender.male ? primaryColor : Colors.pink,
              )
            ],
          ),
          Row(
            children: [
              Icon(Icons.location_on, color: primaryColor),
              Text(
                "California, Walk Suite 526 (2.5 km)",
                style: body2TextStyle,
              )
            ],
          )
        ]),
      ),
    );
  }

  _petPicPart() {
    return Container(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight * 0.36,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight * 0.4,
            child: Image.asset(pet.imgPath),
          ),
          Positioned(
            left: getProportionateScreenWidth(16),
            top: getProportionateScreenHeight(32),
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Get.back();
              },
            ),
          ),
        ],
      ),
    );
  }
}
