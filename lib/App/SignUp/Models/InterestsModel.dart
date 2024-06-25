import 'package:meetswap/Constant/ImagesPath.dart';

class InterestsModel {
  final String imagePath;
  final String name;
  final int id;
  InterestsModel(
      {required this.id, required this.imagePath, required this.name});

  static List<InterestsModel> interestsList = [
    InterestsModel(id: 1, imagePath: AppImagesPath.sportIcon, name: "Sports"),
    InterestsModel(id: 2, imagePath: AppImagesPath.foodIcon, name: "Food"),
    InterestsModel(id: 3, imagePath: AppImagesPath.musicIcon, name: "Music"),
    InterestsModel(id: 4, imagePath: AppImagesPath.gamingIcon, name: "Gaming"),
    InterestsModel(id: 5, imagePath: AppImagesPath.gamesIcon, name: "Games"),
    InterestsModel(
        id: 6, imagePath: AppImagesPath.businessIcon, name: "Business"),
    InterestsModel(id: 7, imagePath: AppImagesPath.movieIcon, name: "Movies"),
    InterestsModel(id: 8, imagePath: AppImagesPath.artIcon, name: "Art"),
    InterestsModel(
        id: 9, imagePath: AppImagesPath.photographyIcon, name: "Photography"),
    InterestsModel(
        id: 10, imagePath: AppImagesPath.nightLiveIcon, name: "Night Life"),
    InterestsModel(
        id: 11, imagePath: AppImagesPath.adventureIcon, name: "Adventure"),
    InterestsModel(id: 12, imagePath: AppImagesPath.eventsIcon, name: "Events"),
  ];
}
