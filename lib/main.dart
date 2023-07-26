import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news/News/NewsDetails.dart';

import 'package:news/category/category_details_screen.dart';
import 'package:news/home_screen.dart';
import 'package:news/my_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
   return MaterialApp(
     routes: {
       HomeScreen.routeName : (context)=> HomeScreen(),
       CategoryDetails.routeName : (context) => CategoryDetails(),
       NewsDetails.routeName : (context) => NewsDetails()
     },
     initialRoute: HomeScreen.routeName,
     theme: MyTheme.lightTheme,
   );
  }
}