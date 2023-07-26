import 'dart:ui';

import '../my_theme.dart';

class Category {
  String id;
  String title;
  String imagePath;
  Color backGroundColor;

  Category(
      {required this.id,
      required this.title,
      required this.imagePath,
      required this.backGroundColor});

  static List<Category> getCategory() {
    return [
      Category(
          id: 'sports',
          title: 'Sports',
          imagePath: 'assets/images/ball.png',
          backGroundColor: MyTheme.redColor),
      Category(
          id: 'entertainment',
          title: 'Entertainment',
          imagePath: 'assets/images/Politics.png',
          backGroundColor: MyTheme.darkBlueColor),
      Category(
          id: 'health',
          title: 'Health',
          imagePath: 'assets/images/health.png',
          backGroundColor: MyTheme.pinkColor),
      Category(
          id: 'business',
          title: 'Business',
          imagePath: 'assets/images/bussines.png',
          backGroundColor: MyTheme.brownColor),
      Category(
          id: 'general',
          title: 'General',
          imagePath: 'assets/images/environment.png',
          backGroundColor: MyTheme.blueColor),

      Category(
          id: 'technology',
          title: 'Technology',
          imagePath: 'assets/images/science.png',
          backGroundColor: MyTheme.yellowColor)
    ];
  }
}
