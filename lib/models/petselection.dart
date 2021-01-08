import 'package:awesome_pet/assets.dart';

class PetSelection {
  final String petName;
  final String imgPath;
  final bool isSelected;

  PetSelection({this.petName, this.imgPath, this.isSelected});
}

List<PetSelection> petSelectionList = [
  PetSelection(
    petName: "Cats",
    imgPath: Asset.cat1,
    isSelected: true,
  ),
  PetSelection(
    petName: "Dogs",
    imgPath: Asset.dog,
    isSelected: false,
  ),
  PetSelection(
    petName: "Rabbits",
    imgPath: Asset.rabbit,
    isSelected: false,
  )
];
