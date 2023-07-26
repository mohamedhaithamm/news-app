
import 'package:flutter/material.dart';
import 'package:news/model/Category.dart';
import 'package:news/my_theme.dart';

class CategoryItemWidget extends StatelessWidget {
 Category category;
  int index ;
  CategoryItemWidget({required this.category ,required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: category.backGroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(index % 2 == 0 ? 20 : 0 ),
          bottomRight: Radius.circular(index % 2 == 0 ? 0 : 20 ),
        )
      ),
      child: Column(
        children: [
          Image.asset(category.imagePath,height: 100,),
          Text(category.title,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
                color: MyTheme.whiteColor
            ),
          ),
        ],
      ),
    );
  }
}
