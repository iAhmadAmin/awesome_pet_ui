import 'package:awesome_pet/assets.dart';
import 'package:awesome_pet/constants.dart';
import 'package:awesome_pet/models/newpet.dart';
import 'package:awesome_pet/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';

class PetDetailPage extends StatelessWidget {
  final Pet pet;
  PetDetailPage({this.pet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        color: greyColor,
        child: Stack(
          children: [
            _buildPetPicPart(context),
            _buildPetInfoPart(),
            _buildPetStoryNBioPart(),
            _buildOwnerPart(),
          ],
        ),
      ),
    );
  }

  _buildOwnerPart() {
    return Positioned(
      bottom: 0,
      child: Container(
        height: SizeConfig.screenHeight * 0.12,
        width: SizeConfig.screenWidth,
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        margin: EdgeInsets.fromLTRB(8, 0, 8, 8),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
              )
            ],
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(40.0),
                topLeft: Radius.circular(40.0))),
        child: Row(children: [
          Container(
            height: 40.0,
            width: 40.0,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(8.0)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                Asset.dp,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 6.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Nannie Barker",
                style: TextStyle(
                    color: choclateColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                "Owner",
                style: TextStyle(
                    color: choclateColor,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          Spacer(),
          Container(
            height: 40.0,
            width: 110.0,
            decoration: BoxDecoration(
                color: primaryColor, borderRadius: BorderRadius.circular(8.0)),
            child: Center(
              child: Text("Contact Me", style: TextStyle(color: Colors.white)),
            ),
          ),
        ]),
      ),
    );
  }

  _buildPetStoryNBioPart() {
    return Positioned(
      bottom: 0,
      child: Container(
        height: SizeConfig.screenHeight * 0.48,
        width: SizeConfig.screenWidth,
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
        margin: EdgeInsets.fromLTRB(8, 0, 8, 8),
        decoration: BoxDecoration(
            color: greyColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
              )
            ],
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(40.0),
                topLeft: Radius.circular(40.0))),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInfoCon(label: "AGE", value: "${pet.age} Year"),
                _buildInfoCon(
                    label: "SEX",
                    value: pet.gender == Gender.male ? "Male" : "Female"),
                _buildInfoCon(label: "WEIGHT", value: "8.5 kg"),
              ],
            ),
            SizedBox(
              height: 14.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pet Story",
                  style: TextStyle(
                      color: choclateColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 6.0,
                ),
                Text(
                  loremIpsum,
                  style: TextStyle(
                      color: choclateColor,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _buildInfoCon({String label, String value}) {
    return Container(
      height: SizeConfig.screenWidth * 0.15,
      width: SizeConfig.screenWidth * 0.27,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(4.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(
                color: Colors.grey,
                fontSize: 12.0,
                fontWeight: FontWeight.w400),
          ),
          Text(
            value,
            style: TextStyle(
                color: choclateColor,
                fontSize: 18.0,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  _buildPetInfoPart() {
    return Positioned(
      bottom: 0,
      child: Container(
        height: SizeConfig.screenHeight * 0.65,
        width: SizeConfig.screenWidth,
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
              )
            ],
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(40.0),
                topLeft: Radius.circular(40.0))),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pet.petName,
                      style: TextStyle(
                          color: choclateColor,
                          fontSize: 24.0,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      pet.petType,
                      style: TextStyle(
                          color: choclateColor,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Icon(
                    pet.gender == Gender.male
                        ? FlutterIcons.male_symbol_fou
                        : FlutterIcons.female_symbol_fou,
                    size: 40.0,
                    color:
                        pet.gender == Gender.male ? primaryColor : Colors.pink),
              ],
            ),
            Row(
              children: [
                Icon(Icons.location_on, color: primaryColor),
                Text(
                  "California, Walk Suite 516 (2.5 km)",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _buildPetPicPart(context) {
    return Container(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight * 0.36,
      child: Stack(
        children: [
          Positioned(
            left: 16.0,
            top: 32.0,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: choclateColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 0),
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight * 0.4,
            child: Image.asset(
              pet.imgPath,
            ),
          ),
        ],
      ),
    );
  }
}
