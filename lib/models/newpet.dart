import 'package:awesome_pet/assets.dart';
import 'package:awesome_pet/constants.dart';

enum Gender {
  male,
  female,
}

class Pet {
  final String petName;
  final String petType;
  final String imgPath;
  final Gender gender;
  final bool isFavorite;
  final int age;
  final String petStory;

  Pet(
      {this.petName,
      this.petType,
      this.imgPath,
      this.gender,
      this.isFavorite,
      this.age,
      this.petStory});
}

List<Pet> petList = [
  Pet(
    petName: "Oliver",
    gender: Gender.male,
    age: 1,
    imgPath: Asset.cat1,
    isFavorite: true,
    petType: "Munchkin",
    petStory: catDes1,
  ),
  Pet(
    petName: "Oscar",
    gender: Gender.male,
    age: 2,
    imgPath: Asset.cat2,
    isFavorite: false,
    petType: "Munchkin",
    petStory: catDes2,
  ),
  Pet(
    petName: "Dexter",
    gender: Gender.female,
    age: 1,
    imgPath: Asset.cat3,
    isFavorite: true,
    petType: "Munchkin",
    petStory: catDes3,
  ),
  Pet(
    petName: "Kitty",
    gender: Gender.male,
    age: 1,
    imgPath: Asset.cat4,
    isFavorite: true,
    petType: "Munchkin",
    petStory: catDes4,
  ),
  Pet(
    petName: "Oliver",
    gender: Gender.male,
    age: 1,
    imgPath: Asset.cat5,
    isFavorite: true,
    petType: "Munchkin",
    petStory: catDes1,
  ),
  Pet(
    petName: "Oliver",
    gender: Gender.male,
    age: 1,
    imgPath: Asset.cat6,
    isFavorite: true,
    petType: "Munchkin",
    petStory: catDes1,
  ),
  Pet(
    petName: "Oliver",
    gender: Gender.male,
    age: 1,
    imgPath: Asset.cat1,
    isFavorite: true,
    petType: "Munchkin",
    petStory: catDes1,
  ),
];
