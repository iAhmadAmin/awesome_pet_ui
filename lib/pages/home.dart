import 'package:awesome_pet/assets.dart';
import 'package:awesome_pet/constants.dart';
import 'package:awesome_pet/models/newpet.dart';
import 'package:awesome_pet/models/petselection.dart';
import 'package:awesome_pet/pages/pet_detail_page.dart';
import 'package:awesome_pet/size_config.dart';
import 'package:awesome_pet/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(),
            _buildSearchBar(),
            _buildPetSelection(),
            _buildNewsetPet(),
          ],
        ),
      ),
    );
  }

  _buildNewsetPet() {
    return Expanded(
        child: Container(
      margin: EdgeInsets.only(top: 10.0),
      width: SizeConfig.screenWidth,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Newset Pet",
                  style: subHeadingTextStyle,
                ),
                Icon(
                  Icons.more_horiz,
                  size: 25.0,
                  color: primaryColor,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: StaggeredGridView.countBuilder(
                crossAxisCount: 4,
                itemCount: petList.length,
                itemBuilder: (BuildContext context, int index) {
                  Pet pet = petList[index];

                  return PetTile(pet: pet);
                },
                staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
              ),
            ),
          ),
        ],
      ),
    ));
  }

  _buildPetSelection() {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      height: 80.0,
      width: SizeConfig.screenWidth,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: petSelectionList.length,
          itemBuilder: (context, index) {
            PetSelection pet = petSelectionList[index];
            return _petTile(pet: pet);
          }),
    );
  }

  _petTile({PetSelection pet}) {
    return Container(
      margin: EdgeInsets.only(
        left: 10.0,
      ),

      // height: 60.0,
      width: SizeConfig.screenWidth * 0.4,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
                height: 60,
                width: SizeConfig.screenWidth * 0.4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: pet.isSelected
                        ? primaryColor
                        : Get.isDarkMode
                            ? liteGreyColor
                            : Colors.white)),
          ),
          Positioned(
            left: 0.0,
            bottom: 0.0,
            child: Image.asset(
              pet.imgPath,
              height: 80.0,
            ),
          ),
          Positioned(
            bottom: 12.0,
            right: 16.0,
            child: Text(
              pet.petName,
              style: pet.isSelected
                  ? titleTextStyle.copyWith(color: Colors.white)
                  : titleTextStyle,
            ),
          ),
        ],
      ),
    );
  }

  _buildSearchBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      height: 95.0,
      width: SizeConfig.screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Find Your", style: subHeadingTextStyle),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Awesome Pet",
                style: headingTextStyle,
              ),
              Icon(
                FlutterIcons.search1_ant,
                size: 35.0,
                color: primaryColor,
              ),
            ],
          )
        ],
      ),
    );
  }

  _buildAppBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      height: 80.0,
      width: SizeConfig.screenWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              if (Get.isDarkMode)
                Get.changeThemeMode(ThemeMode.light);
              else
                Get.changeThemeMode(ThemeMode.dark);
            },
            icon: Icon(
              Get.isDarkMode ? FlutterIcons.sun_fea : FlutterIcons.moon_fea,
              color: Get.isDarkMode ? Colors.white : choclateColor,
            ),
          ),
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
          )
        ],
      ),
    );
  }
}

class PetTile extends StatelessWidget {
  final Pet pet;
  PetTile({this.pet});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(PetDetailPage(pet: pet));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Get.isDarkMode ? liteGreyColor : Colors.white,
          borderRadius: BorderRadius.circular(16.0),
        ),
        height: SizeConfig.screenWidth * 0.60,
        width: SizeConfig.screenWidth * 0.40,
        child: Column(
          children: [
            Expanded(
                child: Container(
              child: Stack(
                children: [
                  Positioned(
                    top: 1.0,
                    right: 1.0,
                    child: Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Get.isDarkMode
                                  ? Colors.white.withOpacity(0.01)
                                  : Colors.black.withOpacity(0.01),
                              offset: Offset(1, 1),
                              blurRadius: 2,
                              spreadRadius: 4)
                        ],
                        color: Get.isDarkMode ? liteGreyColor : Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(FlutterIcons.heart_fou,
                          color: pet.isFavorite ? Colors.red : greyColor),
                    ),
                  ),
                  Positioned(
                      bottom: 0.0,
                      child: Image.asset(
                        pet.imgPath,
                        height: 120,
                        fit: BoxFit.scaleDown,
                      )),
                ],
              ),
            )),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pet.petName,
                      style: titleTextStyle,
                    ),
                    Text(
                      pet.petType,
                      style: body2TextStyle,
                    ),
                  ],
                ),
                Icon(
                    pet.gender == Gender.male
                        ? FlutterIcons.male_symbol_fou
                        : FlutterIcons.female_symbol_fou,
                    color:
                        pet.gender == Gender.male ? primaryColor : Colors.pink),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
